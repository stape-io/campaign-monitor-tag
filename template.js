const encodeUriComponent = require('encodeUriComponent');
const getAllEventData = require('getAllEventData');
const getRequestHeader = require('getRequestHeader');
const getType = require('getType');
const JSON = require('JSON');
const logToConsole = require('logToConsole');
const makeString = require('makeString');
const Promise = require('Promise');
const sendHttpRequest = require('sendHttpRequest');
const toBase64 = require('toBase64');

/*==============================================================================
==============================================================================*/

const eventData = getAllEventData();

if (shouldExitEarly(data, eventData)) return;

if (data.eventType === 'addOrUpdateSubscriber') {
  const failed = addOrUpdateSubscriber(eventData);
  if (!failed && data.useOptimisticScenario) {
    return data.gtmOnSuccess();
  }
} else if (data.eventType === 'unsubscribeSubscriber') {
  const failed = unsubscribeSubscriber(eventData);
  if (!failed && data.useOptimisticScenario) {
    return data.gtmOnSuccess();
  }
} else {
  return data.gtmOnSuccess();
}

/*==============================================================================
  Vendor related functions
==============================================================================*/

function addOrUpdateSubscriber(eventData) {
  const subscriberData = buildSubscriberData(eventData);
  if (!subscriberData) return true;

  performApiCall('/subscribers/' + enc(data.listId) + '.json', 'POST', subscriberData);
  return false;
}

function unsubscribeSubscriber(eventData) {
  if (!requireValue(data.listId, 'listId', '🛑 [ERROR] Subscriber was not unsubscribed.')) {
    return true;
  }

  const email = resolveEmail(eventData);
  if (!requireValue(email, 'emailAddress', '🛑 [ERROR] Subscriber was not unsubscribed.')) {
    return true;
  }

  performApiCall('/subscribers/' + enc(data.listId) + '/unsubscribe.json', 'POST', {
    EmailAddress: makeString(email)
  });
  return false;
}

function buildSubscriberData(eventData) {
  if (!requireValue(data.listId, 'listId', '🛑 [ERROR] Subscriber was not sent.')) return null;

  const email = resolveEmail(eventData);
  if (!requireValue(email, 'emailAddress', '🛑 [ERROR] Subscriber was not sent.')) return null;

  const subscriberData = { EmailAddress: makeString(email) };
  const eventDataUserData = eventData.user_data || {};
  const autoMap = data.autoMapEventData;

  const name = data.name || (autoMap ? eventData.name || eventDataUserData.name : undefined);
  if (isValidValue(name)) subscriberData.Name = makeString(name);

  const mobileNumber =
    data.mobileNumber ||
    (autoMap ? eventDataUserData.phone_number || eventDataUserData.phone : undefined);
  if (isValidValue(mobileNumber)) subscriberData.MobileNumber = makeString(mobileNumber);

  if (isValidValue(data.consentToTrack)) subscriberData.ConsentToTrack = data.consentToTrack;
  if (isValidValue(data.consentToSendSms)) subscriberData.ConsentToSendSms = data.consentToSendSms;
  if (data.resubscribe) subscriberData.Resubscribe = true;

  const customFields = mapCustomFields();
  if (customFields) subscriberData.CustomFields = customFields;

  return subscriberData;
}

function resolveEmail(eventData) {
  const eventDataUserData = eventData.user_data || {};
  const autoMap = data.autoMapEventData;
  return (
    data.emailAddress ||
    (autoMap
      ? eventData.email || eventDataUserData.email || eventDataUserData.email_address
      : undefined)
  );
}

function mapCustomFields() {
  if (!data.customFields || !data.customFields.length) return null;
  const customFields = [];
  data.customFields.forEach((row) => {
    if (isValidValue(row.key)) {
      customFields.push({ Key: makeString(row.key), Value: makeString(row.value) });
    }
  });
  return customFields.length ? customFields : null;
}

function performApiCall(path, method, body) {
  apiRequest(path, method, body)
    .then((result) => {
      const success = result.statusCode >= 200 && result.statusCode < 300;

      if (!data.useOptimisticScenario) {
        if (success) data.gtmOnSuccess();
        else data.gtmOnFailure();
      }
    })
    .catch(() => {
      if (!data.useOptimisticScenario) data.gtmOnFailure();
    });
}

function apiRequest(path, method, body) {
  const endpoint = 'https://api.createsend.com/api/v3.3' + path;
  const requestOptions = {
    headers: {
      Authorization: 'Basic ' + toBase64(data.apiKey + ':x'),
      'Content-Type': 'application/json'
    },
    method: method
  };

  return body === undefined
    ? sendHttpRequest(endpoint, requestOptions)
    : sendHttpRequest(endpoint, requestOptions, JSON.stringify(body));
}

/*==============================================================================
  Helpers
==============================================================================*/

function requireValue(value, paramName, failMessage) {
  if (isValidValue(value)) return true;
  log({
    Name: 'Campaign Monitor',
    Type: 'Message',
    Message: failMessage,
    Reason: 'Missing required parameter: "' + paramName + '".'
  });
  data.gtmOnFailure();
  return false;
}

function isValidValue(value) {
  const valueType = getType(value);
  if (valueType === 'null' || valueType === 'undefined' || value !== value) return false;
  return value !== '' && value !== 'undefined' && value !== 'null';
}

function isConsentGivenOrNotRequired(data, eventData) {
  if (data.adStorageConsent !== 'required') return true;
  if (eventData.consent_state) return !!eventData.consent_state.ad_storage;
  const xGaGcs = eventData['x-ga-gcs'] || '';
  return xGaGcs[2] === '1';
}

function getUrl(eventData) {
  return eventData.page_location || getRequestHeader('referer') || eventData.page_referrer;
}

function shouldExitEarly(data, eventData) {
  if (!isConsentGivenOrNotRequired(data, eventData)) {
    data.gtmOnSuccess();
    return true;
  }

  const url = getUrl(eventData);
  if (url && url.lastIndexOf('https://gtm-msr.appspot.com/', 0) === 0) {
    data.gtmOnSuccess();
    return true;
  }
  return false;
}

function enc(value) {
  if (['null', 'undefined'].indexOf(getType(value)) !== -1) value = '';
  return encodeUriComponent(makeString(value));
}

function log(rawDataToLog) {
  rawDataToLog.TraceId = getRequestHeader('trace-id');
  logToConsole(JSON.stringify(rawDataToLog));
}
