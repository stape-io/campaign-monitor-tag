___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Campaign Monitor by Stape",
  "categories": [
    "ANALYTICS",
    "CONVERSIONS",
    "MARKETING"
  ],
  "brand": {
    "id": "brand_dummy",
    "displayName": "stape.io",
    "thumbnail": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAACXBIWXMAAAsSAAALEgHS3X78AAABeElEQVRYCe2XMU7CcBjFfxh3uYHcQD2B3EAmumLi6OBoBxOdGic9AiQuXUxN3BzAAxjwBvUGcIKar/maNE0pX1tKB3gjLf/3/u977yN0oiiiTRy1yr73Ag4CBJ37YRQAPWDm+dztgtR1eAX6QCgC0j38BUaez6Ih4nNgDJwln2VHIA/mrrN9J/TMeZpckHUgjW91I6xJ3NNbX+Y9LwqhfGHhOoxqkA/kjHXkgiIH0vhQN5ZG4q7e+mrTu9YaykGh68TJ3UTe11tvJC8jQHACTKVCesM8cqnXFDi1HmodQRZS10ES0Lx6WVF1E4rFSwrq1aSAJ8+Pm9F1HWbASxXiBMcl3l1pEwKt11hzUQtWAX8yc21CYE24BZYRyEaUkHXL1GtbAiaeH/f6sWy9rCgawbWu4kXVhFuQ54CE7UItr1wvK7IOyIK5hXijrf0BaUrABPgCPrdRLyuSETyr5W+7JBeIAw/ATRMJN2AlAn40eG3g/fDfcM8FAP8ur2VEbkCa9wAAAABJRU5ErkJggg\u003d\u003d"
  },
  "description": "This tag adds, updates, or unsubscribes Subscribers via Campaign Monitor\u0027s Subscribers API.",
  "containerContexts": [
    "SERVER"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "GROUP",
    "name": "configGroup",
    "subParams": [
      {
        "type": "RADIO",
        "name": "eventType",
        "displayName": "Event Type",
        "radioItems": [
          {
            "value": "addOrUpdateSubscriber",
            "displayValue": "Add or Update Subscriber"
          },
          {
            "value": "unsubscribeSubscriber",
            "displayValue": "Unsubscribe Subscriber"
          }
        ],
        "simpleValueType": true,
        "defaultValue": "addOrUpdateSubscriber",
        "help": "\u003cb\u003eAdd or Update Subscriber\u003c/b\u003e adds a new subscriber to the list, or updates their name, mobile number, consent, and custom fields if they already exist on it (Campaign Monitor\u0027s Add Subscriber endpoint upserts by email address).\u003cbr/\u003e\u003cb\u003eUnsubscribe Subscriber\u003c/b\u003e unsubscribes an existing subscriber from the list by email address."
      },
      {
        "type": "TEXT",
        "name": "apiKey",
        "displayName": "API Key",
        "simpleValueType": true,
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "alwaysInSummary": true,
        "help": "Your Campaign Monitor API Key. It can be found in your Campaign Monitor account under Account Settings → API Keys.\u003cbr/\u003e\u003ca href\u003d\"https://www.campaignmonitor.com/api/v3-3/getting-started/\"\u003eLearn more\u003c/a\u003e about authentication and locating your API Key."
      },
      {
        "type": "TEXT",
        "name": "listId",
        "displayName": "List ID",
        "simpleValueType": true,
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "valueHint": "a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6",
        "help": "The ID of the Campaign Monitor list this subscriber belongs to. Find it in the list\u0027s settings in the Campaign Monitor UI."
      },
      {
        "type": "CHECKBOX",
        "name": "useOptimisticScenario",
        "checkboxText": "Use Optimistic Scenario",
        "simpleValueType": true,
        "help": "The tag will call gtmOnSuccess() without waiting for a response from the API. This speeds up sGTM response time, but returns a success status even if the API call fails."
      },
      {
        "type": "CHECKBOX",
        "name": "autoMapEventData",
        "checkboxText": "Automap from Event Data",
        "simpleValueType": true,
        "defaultValue": true,
        "help": "When enabled (default), fields left empty automatically fall back to values from Event Data, as documented in each field\u0027s help text below. Disable to require every value to be set explicitly."
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "subscriberDataGroup",
    "subParams": [
      {
        "type": "TEXT",
        "name": "emailAddress",
        "displayName": "Email Address",
        "simpleValueType": true,
        "valueValidators": [
          {
            "type": "NON_EMPTY",
            "enablingConditions": [
              {
                "paramName": "autoMapEventData",
                "paramValue": true,
                "type": "NOT_EQUALS"
              }
            ]
          }
        ],
        "help": "Required. The subscriber\u0027s email address.\u003cbr/\u003e\u003cbr/\u003eWhen left empty and \u003ci\u003eAutomap from Event Data\u003c/i\u003e is enabled, falls back to the first non-hashed value of:\n\u003cul\u003e\n\u003cli\u003e\u003ci\u003eeventData.email\u003c/i\u003e\u003c/li\u003e\n\u003cli\u003e\u003ci\u003eeventData.email_address\u003c/i\u003e\u003c/li\u003e\n\u003cli\u003e\u003ci\u003eeventData.user_data.email\u003c/i\u003e\u003c/li\u003e\n\u003cli\u003e\u003ci\u003eeventData.user_data.email_address\u003c/i\u003e\u003c/li\u003e\n\u003c/ul\u003e"
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "addOrUpdateFieldsGroup",
    "subParams": [
      {
        "type": "TEXT",
        "name": "name",
        "displayName": "Name (Optional)",
        "simpleValueType": true,
        "help": "When left empty and \u003ci\u003eAutomap from Event Data\u003c/i\u003e is enabled, falls back to the non-hashed values of the following, joined by a space:\n\u003cul\u003e\n\u003cli\u003e\u003ci\u003eeventData.user_data.address.first_name\u003c/i\u003e\u003c/li\u003e\n\u003cli\u003e\u003ci\u003eeventData.user_data.address.last_name\u003c/i\u003e\u003c/li\u003e\n\u003c/ul\u003e"
      },
      {
        "type": "TEXT",
        "name": "mobileNumber",
        "displayName": "Mobile Number (Optional)",
        "simpleValueType": true,
        "help": "Must be in E.164 format (e.g. +5012398752), otherwise Campaign Monitor rejects the whole request. SMS is only sent when SMS Consent is Yes.\u003cbr/\u003e\u003cbr/\u003eWhen left empty and \u003ci\u003eAutomap from Event Data\u003c/i\u003e is enabled, falls back to the first valid value of the list below. Spaces, dashes, dots and parentheses are removed and a missing + prefix is added. Hashed values and values that are not valid E.164 numbers are skipped.\n\u003cul\u003e\n\u003cli\u003e\u003ci\u003eeventData.phone\u003c/i\u003e\u003c/li\u003e\n\u003cli\u003e\u003ci\u003eeventData.phone_number\u003c/i\u003e\u003c/li\u003e\n\u003cli\u003e\u003ci\u003eeventData.user_data.phone_number\u003c/i\u003e\u003c/li\u003e\n\u003cli\u003e\u003ci\u003eeventData.user_data.phone\u003c/i\u003e\u003c/li\u003e\n\u003c/ul\u003e"
      },
      {
        "type": "SELECT",
        "name": "consentToTrack",
        "displayName": "Tracking Consent",
        "simpleValueType": true,
        "selectItems": [
          {
            "value": "Yes",
            "displayValue": "Yes"
          },
          {
            "value": "No",
            "displayValue": "No"
          },
          {
            "value": "Unchanged",
            "displayValue": "Unchanged"
          }
        ],
        "defaultValue": "Unchanged",
        "help": "Whether the subscriber consents to being tracked (opens/clicks). Campaign Monitor treats \"Unchanged\" as consenting for a brand new subscriber, and as a no-op for an existing one.\u003cbr/\u003e\u003ca href\u003d\"https://www.campaignmonitor.com/api/v3-3/subscribers/\"\u003eLearn more\u003c/a\u003e about consent fields."
      },
      {
        "type": "SELECT",
        "name": "consentToSendSms",
        "displayName": "SMS Consent (Optional)",
        "simpleValueType": true,
        "selectItems": [
          {
            "value": "Yes",
            "displayValue": "Yes"
          },
          {
            "value": "No",
            "displayValue": "No"
          },
          {
            "value": "Unchanged",
            "displayValue": "Unchanged"
          }
        ],
        "notSetText": "Not set",
        "help": "Only meaningful when Mobile Number is set. Leave unset to leave the subscriber\u0027s existing SMS consent untouched."
      },
      {
        "type": "CHECKBOX",
        "name": "resubscribe",
        "checkboxText": "Resubscribe if previously unsubscribed",
        "simpleValueType": true,
        "help": "By default, adding/updating a subscriber who is unsubscribed, inactive or on the suppression list does not re-add them to this list. Enable this to re-add them.\u003cbr/\u003e\u003cbr/\u003eUse with caution: only re-add people who have given permission."
      },
      {
        "type": "SIMPLE_TABLE",
        "name": "customFields",
        "displayName": "Custom Fields",
        "simpleTableColumns": [
          {
            "defaultValue": "",
            "displayName": "Field Key",
            "name": "key",
            "type": "TEXT",
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ]
          },
          {
            "defaultValue": "",
            "displayName": "Value",
            "name": "value",
            "type": "TEXT",
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ]
          }
        ],
        "newRowButtonText": "Add custom field",
        "help": "Campaign Monitor identifies Custom (Personalization) Fields by their \"key\" (e.g. website), not their label. Find each field\u0027s key in the list\u0027s Personalization Fields settings in the Campaign Monitor UI.\u003cbr/\u003e\u003cbr/\u003eFor a \"Multi-Valued Select Many\" field, add multiple rows with the same key and a different value in each."
      }
    ],
    "enablingConditions": [
      {
        "paramName": "eventType",
        "paramValue": "addOrUpdateSubscriber",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "tagExecutionConsentSettingsGroup",
    "displayName": "Tag Execution Consent Settings",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "RADIO",
        "name": "adStorageConsent",
        "radioItems": [
          {
            "value": "optional",
            "displayValue": "Send data always"
          },
          {
            "value": "required",
            "displayValue": "Send data in case marketing consent given",
            "help": "Aborts the tag execution if marketing consent (ad_storage) is not given."
          }
        ],
        "simpleValueType": true,
        "defaultValue": "optional"
      }
    ]
  }
]


___SANDBOXED_JS_FOR_SERVER___

const encodeUriComponent = require('encodeUriComponent');
const getAllEventData = require('getAllEventData');
const getRequestHeader = require('getRequestHeader');
const getType = require('getType');
const JSON = require('JSON');
const logToConsole = require('logToConsole');
const makeString = require('makeString');
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

  const name = data.name || (autoMap ? getNameFromEventData(eventDataUserData) : undefined);
  if (isValidValue(name)) subscriberData.Name = makeString(name);

  const mobileNumber =
    data.mobileNumber ||
    (autoMap
      ? getFirstValidPhoneNumber([
          eventData.phone,
          eventData.phone_number,
          eventDataUserData.phone_number,
          eventDataUserData.phone
        ])
      : undefined);
  if (isValidValue(mobileNumber)) subscriberData.MobileNumber = makeString(mobileNumber);

  subscriberData.ConsentToTrack = data.consentToTrack || 'Unchanged';
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
      ? getFirstUnhashedValue([
          eventData.email,
          eventData.email_address,
          eventDataUserData.email,
          eventDataUserData.email_address
        ])
      : undefined)
  );
}

function getNameFromEventData(eventDataUserData) {
  let address = eventDataUserData.address;
  const addressType = getType(address);
  if (addressType !== 'object' && addressType !== 'array') return;
  address = address[0] || address;

  return [address.first_name, address.last_name]
    .filter((namePart) => isValidValue(namePart) && !isHashed(namePart))
    .join(' ');
}

function mapCustomFields() {
  if (!data.customFields || !data.customFields.length) return null;
  const customFields = [];
  data.customFields.forEach((row) => {
    if (isValidValue(row.key) && isValidValue(row.value)) {
      customFields.push({ Key: makeString(row.key), Value: makeString(row.value) });
    }
  });
  return customFields.length ? customFields : null;
}

function performApiCall(path, method, body) {
  apiRequest(path, method, body)
    .then((result) => {
      const success = result.statusCode === 200 || result.statusCode === 201;

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

  return sendHttpRequest(endpoint, requestOptions, JSON.stringify(body));
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

function getFirstUnhashedValue(values) {
  return values.filter((value) => isValidValue(value) && !isHashed(value))[0];
}

function getFirstValidPhoneNumber(values) {
  return values.filter(isValidValue).map(normalizePhoneNumber).filter(isValidValue)[0];
}

function normalizePhoneNumber(phoneNumber) {
  phoneNumber = makeString(phoneNumber)
    .split(' ')
    .join('')
    .split('-')
    .join('')
    .split('.')
    .join('')
    .split('(')
    .join('')
    .split(')')
    .join('');
  if (isHashed(phoneNumber)) return;
  if (phoneNumber[0] !== '+') phoneNumber = '+' + phoneNumber;
  // Campaign Monitor rejects the whole request (error 220) when MobileNumber is not E.164.
  if (phoneNumber.match('^\\+[1-9][0-9]{1,14}$') === null) return;
  return phoneNumber;
}

function isHashed(value) {
  return makeString(value).match('^[A-Fa-f0-9]{64}$') !== null;
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


___SERVER_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "read_request",
        "versionId": "1"
      },
      "param": [
        {
          "key": "requestAccess",
          "value": {
            "type": 1,
            "string": "any"
          }
        },
        {
          "key": "headerAccess",
          "value": {
            "type": 1,
            "string": "any"
          }
        },
        {
          "key": "queryParameterAccess",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "all"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "read_event_data",
        "versionId": "1"
      },
      "param": [
        {
          "key": "eventDataAccess",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "send_http",
        "versionId": "1"
      },
      "param": [
        {
          "key": "allowedUrls",
          "value": {
            "type": 1,
            "string": "specific"
          }
        },
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://api.createsend.com/api/v3.3/subscribers/*"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios:
- name: '[Early Exit] Calls gtmOnSuccess and stops when marketing consent is required
    but not given'
  code: |-
    mockData.adStorageConsent = 'required';

    mock('getAllEventData', () => ({
      page_location: 'https://example.com/signup',
      'x-ga-gcs': 'G100'
    }));

    runCode(mockData);

    assertApi('sendHttpRequest').wasNotCalled();
    assertApi('gtmOnSuccess').wasCalled();
    assertApi('gtmOnFailure').wasNotCalled();
- name: '[Early Exit] Proceeds normally when marketing consent is required and given'
  code: |-
    mockData.adStorageConsent = 'required';

    mock('getAllEventData', () => ({
      page_location: 'https://example.com/signup',
      consent_state: {ad_storage: true}
    }));

    runCode(mockData);

    callLater(() => {
      assertApi('sendHttpRequest').wasCalled();
      assertApi('gtmOnSuccess').wasCalled();
      assertApi('gtmOnFailure').wasNotCalled();
    });
- name: '[Early Exit] Consent check is skipped entirely when adStorageConsent is optional'
  code: |-
    mockData.adStorageConsent = 'optional';

    mock('getAllEventData', () => ({
      page_location: 'https://example.com/signup',
      'x-ga-gcs': 'G100'
    }));

    runCode(mockData);

    callLater(() => {
      assertApi('sendHttpRequest').wasCalled();
      assertApi('gtmOnSuccess').wasCalled();
      assertApi('gtmOnFailure').wasNotCalled();
    });
- name: '[Early Exit] Calls gtmOnSuccess and stops when the URL matches the GTM preview
    endpoint'
  code: |-
    mock('getAllEventData', () => ({page_location: 'https://gtm-msr.appspot.com/preview'}));

    runCode(mockData);

    assertApi('sendHttpRequest').wasNotCalled();
    assertApi('gtmOnSuccess').wasCalled();
    assertApi('gtmOnFailure').wasNotCalled();
- name: '[Add or Update Subscriber] Fails when List ID is missing, without making
    any API call'
  code: |-
    mockData.listId = undefined;

    runCode(mockData);

    assertApi('sendHttpRequest').wasNotCalled();
    assertApi('gtmOnSuccess').wasNotCalled();
    assertApi('gtmOnFailure').wasCalled();
- name: '[Add or Update Subscriber] Fails when the email address cannot be resolved
    from any source'
  code: |-
    mockData.emailAddress = undefined;
    mock('getAllEventData', () => ({page_location: 'https://example.com/signup'}));

    runCode(mockData);

    assertApi('sendHttpRequest').wasNotCalled();
    assertApi('gtmOnSuccess').wasNotCalled();
    assertApi('gtmOnFailure').wasCalled();
- name: '[Add or Update Subscriber] Falls back to Event Data email fields when emailAddress
    is missing and Automap from Event Data is enabled'
  code: |-
    mockData.emailAddress = undefined;

    mock('getAllEventData', () => ({
      page_location: 'https://example.com/signup',
      user_data: {email: 'userdata-subscriber@example.com'}
    }));

    mock('sendHttpRequest', (url, options, body) => {
      assertThat(url).isEqualTo('https://api.createsend.com/api/v3.3/subscribers/testListId.json');

      const parsedBody = JSON.parse(body);
      assertThat(parsedBody.EmailAddress).isEqualTo('userdata-subscriber@example.com');
      return Promise.create((resolve) => resolve({statusCode: 201, body: '{}'}));
    });

    runCode(mockData);

    callLater(() => {
      assertApi('gtmOnSuccess').wasCalled();
      assertApi('gtmOnFailure').wasNotCalled();
    });
- name: '[Add or Update Subscriber] Does not fall back to Event Data email when Automap
    from Event Data is disabled'
  code: |-
    mockData.emailAddress = undefined;
    mockData.autoMapEventData = false;

    mock('getAllEventData', () => ({
      page_location: 'https://example.com/signup',
      email: 'fallback@example.com'
    }));

    runCode(mockData);

    assertApi('sendHttpRequest').wasNotCalled();
    assertApi('gtmOnSuccess').wasNotCalled();
    assertApi('gtmOnFailure').wasCalled();
- name: '[Add or Update Subscriber] Builds the POST body against the list endpoint,
    defaults ConsentToTrack to Unchanged and omits optional fields when unset'
  code: |-
    mockData.consentToTrack = undefined;

    mock('sendHttpRequest', (url, options, body) => {
      assertThat(url).isEqualTo('https://api.createsend.com/api/v3.3/subscribers/testListId.json');
      assertThat(options.method).isEqualTo('POST');

      const parsedBody = JSON.parse(body);
      assertThat(parsedBody).isEqualTo({
        EmailAddress: 'subscriber@example.com',
        ConsentToTrack: 'Unchanged'
      });

      return Promise.create((resolve) => resolve({statusCode: 201, body: '{}'}));
    });

    runCode(mockData);

    callLater(() => {
      assertApi('gtmOnSuccess').wasCalled();
      assertApi('gtmOnFailure').wasNotCalled();
    });
- name: '[Add or Update Subscriber] Includes Name, Mobile Number, Consent and Resubscribe
    in the POST body when set, with UI values winning over Event Data'
  code: |-
    mockData.name = 'Jane Doe';
    mockData.mobileNumber = '+123456';
    mockData.consentToTrack = 'Yes';
    mockData.consentToSendSms = 'Yes';
    mockData.resubscribe = true;

    mock('getAllEventData', () => ({
      page_location: 'https://example.com/signup',
      email: 'eventdata@example.com',
      phone: '+987654321',
      user_data: {address: {first_name: 'Event', last_name: 'Data'}}
    }));

    mock('sendHttpRequest', (url, options, body) => {
      const parsedBody = JSON.parse(body);
      assertThat(parsedBody).isEqualTo({
        EmailAddress: 'subscriber@example.com',
        Name: 'Jane Doe',
        MobileNumber: '+123456',
        ConsentToTrack: 'Yes',
        ConsentToSendSms: 'Yes',
        Resubscribe: true
      });

      return Promise.create((resolve) => resolve({statusCode: 201, body: '{}'}));
    });

    runCode(mockData);

    callLater(() => {
      assertApi('gtmOnSuccess').wasCalled();
      assertApi('gtmOnFailure').wasNotCalled();
    });
- name: '[Add or Update Subscriber] Falls back to Event Data name and mobile number
    when Automap from Event Data is enabled, normalizing the phone and skipping invalid
    ones'
  code: |-
    mock('getAllEventData', () => ({
      page_location: 'https://example.com/signup',
      user_data: {
        phone_number: '12345abc',
        phone: '(123) 456-789',
        address: [{first_name: 'Jane', last_name: 'Doe'}]
      }
    }));

    mock('sendHttpRequest', (url, options, body) => {
      const parsedBody = JSON.parse(body);
      assertThat(parsedBody.Name).isEqualTo('Jane Doe');
      assertThat(parsedBody.MobileNumber).isEqualTo('+123456789');
      return Promise.create((resolve) => resolve({statusCode: 201, body: '{}'}));
    });

    runCode(mockData);

    callLater(() => {
      assertApi('gtmOnSuccess').wasCalled();
      assertApi('gtmOnFailure').wasNotCalled();
    });
- name: '[Add or Update Subscriber] Does not fall back to Event Data name and mobile
    number when Automap from Event Data is disabled'
  code: |-
    mockData.autoMapEventData = false;

    mock('getAllEventData', () => ({
      page_location: 'https://example.com/signup',
      user_data: {
        phone_number: '+123456789',
        address: {first_name: 'Jane', last_name: 'Doe'}
      }
    }));

    mock('sendHttpRequest', (url, options, body) => {
      const parsedBody = JSON.parse(body);
      assertThat(parsedBody.Name).isEqualTo(undefined);
      assertThat(parsedBody.MobileNumber).isEqualTo(undefined);
      return Promise.create((resolve) => resolve({statusCode: 201, body: '{}'}));
    });

    runCode(mockData);

    callLater(() => {
      assertApi('gtmOnSuccess').wasCalled();
      assertApi('gtmOnFailure').wasNotCalled();
    });
- name: '[Add or Update Subscriber] Maps the Custom Fields table to a Key/Value array,
    supporting repeated keys for multi-value fields'
  code: |-
    mockData.customFields = [
      {key: 'website', value: 'https://example.com'},
      {key: 'interests', value: 'magic'},
      {key: 'interests', value: 'romantic walks'},
      {key: '', value: 'should be skipped'},
      {key: 'empty', value: ''}
    ];

    mock('sendHttpRequest', (url, options, body) => {
      const parsedBody = JSON.parse(body);
      assertThat(parsedBody.CustomFields).isEqualTo([
        {Key: 'website', Value: 'https://example.com'},
        {Key: 'interests', Value: 'magic'},
        {Key: 'interests', Value: 'romantic walks'}
      ]);
      return Promise.create((resolve) => resolve({statusCode: 201, body: '{}'}));
    });

    runCode(mockData);

    callLater(() => {
      assertApi('gtmOnSuccess').wasCalled();
      assertApi('gtmOnFailure').wasNotCalled();
    });
- name: '[Add or Update Subscriber] Skips hashed Event Data values when automapping
    email, mobile number and name'
  code: |-
    mockData.emailAddress = undefined;

    mock('getAllEventData', () => ({
      page_location: 'https://example.com/signup',
      email: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
      email_address: 'plain@example.com',
      phone: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
      phone_number: '+123456789',
      user_data: {
        email: 'userdata@example.com',
        phone_number: '+987654321',
        address: {first_name: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', last_name: 'Doe'}
      }
    }));

    mock('sendHttpRequest', (url, options, body) => {
      const parsedBody = JSON.parse(body);
      assertThat(parsedBody.EmailAddress).isEqualTo('plain@example.com');
      assertThat(parsedBody.MobileNumber).isEqualTo('+123456789');
      assertThat(parsedBody.Name).isEqualTo('Doe');
      return Promise.create((resolve) => resolve({statusCode: 201, body: '{}'}));
    });

    runCode(mockData);

    callLater(() => {
      assertApi('gtmOnSuccess').wasCalled();
      assertApi('gtmOnFailure').wasNotCalled();
    });
- name: '[Add or Update Subscriber] Fails when the only Event Data email is hashed'
  code: |-
    mockData.emailAddress = undefined;

    mock('getAllEventData', () => ({
      page_location: 'https://example.com/signup',
      user_data: {email: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'}
    }));

    runCode(mockData);

    assertApi('sendHttpRequest').wasNotCalled();
    assertApi('gtmOnSuccess').wasNotCalled();
    assertApi('gtmOnFailure').wasCalled();
- name: '[Add or Update Subscriber] Omits Name when both Event Data name parts are
    hashed'
  code: |-
    mock('getAllEventData', () => ({
      page_location: 'https://example.com/signup',
      user_data: {address: [{first_name: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', last_name: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'}]}
    }));

    mock('sendHttpRequest', (url, options, body) => {
      const parsedBody = JSON.parse(body);
      assertThat(parsedBody.Name).isEqualTo(undefined);
      return Promise.create((resolve) => resolve({statusCode: 201, body: '{}'}));
    });

    runCode(mockData);

    callLater(() => {
      assertApi('gtmOnSuccess').wasCalled();
      assertApi('gtmOnFailure').wasNotCalled();
    });
- name: '[Add or Update Subscriber] Calls gtmOnFailure on a 2xx status other than
    200 or 201'
  code: |-
    mock('sendHttpRequest', () => {
      return Promise.create((resolve) => resolve({statusCode: 202, body: ''}));
    });

    runCode(mockData);

    callLater(() => {
      assertApi('gtmOnSuccess').wasNotCalled();
      assertApi('gtmOnFailure').wasCalled();
    });
- name: '[Add or Update Subscriber] Calls gtmOnFailure on an error API response'
  code: |-
    mock('sendHttpRequest', () => {
      return Promise.create((resolve) =>
        resolve({statusCode: 400, body: JSON.stringify({Code: 1, Message: 'Invalid email address'})})
      );
    });

    runCode(mockData);

    callLater(() => {
      assertApi('gtmOnSuccess').wasNotCalled();
      assertApi('gtmOnFailure').wasCalled();
    });
- name: '[Add or Update Subscriber] Calls gtmOnFailure when the request promise rejects'
  code: |-
    mock('sendHttpRequest', () => {
      return Promise.create((resolve, reject) => reject({reason: 'failed'}));
    });

    runCode(mockData);

    callLater(() => {
      assertApi('gtmOnSuccess').wasNotCalled();
      assertApi('gtmOnFailure').wasCalled();
    });
- name: '[Add or Update Subscriber] useOptimisticScenario calls gtmOnSuccess immediately
    regardless of the API outcome'
  code: |-
    mockData.useOptimisticScenario = true;

    mock('sendHttpRequest', () => {
      return Promise.create((resolve) => resolve({statusCode: 500, body: '{}'}));
    });

    runCode(mockData);

    assertApi('gtmOnSuccess').wasCalled();
    assertApi('gtmOnFailure').wasNotCalled();

    callLater(() => {
      assertApi('gtmOnFailure').wasNotCalled();
    });
- name: '[Unsubscribe Subscriber] Fails when List ID is missing, without making any
    API call, even with useOptimisticScenario enabled'
  code: |-
    mockData.eventType = 'unsubscribeSubscriber';
    mockData.listId = undefined;
    mockData.useOptimisticScenario = true;

    runCode(mockData);

    assertApi('sendHttpRequest').wasNotCalled();
    assertApi('gtmOnSuccess').wasNotCalled();
    assertApi('gtmOnFailure').wasCalled();
- name: '[Unsubscribe Subscriber] Fails when the email address cannot be resolved,
    without making any API call'
  code: |-
    mockData.eventType = 'unsubscribeSubscriber';
    mockData.emailAddress = undefined;
    mock('getAllEventData', () => ({page_location: 'https://example.com/signup'}));

    runCode(mockData);

    assertApi('sendHttpRequest').wasNotCalled();
    assertApi('gtmOnSuccess').wasNotCalled();
    assertApi('gtmOnFailure').wasCalled();
- name: '[Unsubscribe Subscriber] Posts the email address to the unsubscribe endpoint'
  code: |-
    mockData.eventType = 'unsubscribeSubscriber';

    mock('sendHttpRequest', (url, options, body) => {
      assertThat(url).isEqualTo('https://api.createsend.com/api/v3.3/subscribers/testListId/unsubscribe.json');
      assertThat(options.method).isEqualTo('POST');
      assertThat(options.headers.Authorization).isEqualTo('Basic dGVzdEFwaUtleTp4');

      const parsedBody = JSON.parse(body);
      assertThat(parsedBody).isEqualTo({EmailAddress: 'subscriber@example.com'});

      return Promise.create((resolve) => resolve({statusCode: 200, body: '{}'}));
    });

    runCode(mockData);

    callLater(() => {
      assertApi('gtmOnSuccess').wasCalled();
      assertApi('gtmOnFailure').wasNotCalled();
    });
- name: '[Unsubscribe Subscriber] Calls gtmOnFailure on an error API response'
  code: |-
    mockData.eventType = 'unsubscribeSubscriber';

    mock('sendHttpRequest', () => {
      return Promise.create((resolve) =>
        resolve({statusCode: 404, body: JSON.stringify({Code: 203, Message: 'Subscriber not found'})})
      );
    });

    runCode(mockData);

    callLater(() => {
      assertApi('gtmOnSuccess').wasNotCalled();
      assertApi('gtmOnFailure').wasCalled();
    });
- name: '[Unsubscribe Subscriber] Calls gtmOnFailure when the request promise rejects'
  code: |-
    mockData.eventType = 'unsubscribeSubscriber';

    mock('sendHttpRequest', () => {
      return Promise.create((resolve, reject) => reject({reason: 'failed'}));
    });

    runCode(mockData);

    callLater(() => {
      assertApi('gtmOnSuccess').wasNotCalled();
      assertApi('gtmOnFailure').wasCalled();
    });
- name: '[Unsubscribe Subscriber] useOptimisticScenario calls gtmOnSuccess immediately
    regardless of the API outcome'
  code: |-
    mockData.eventType = 'unsubscribeSubscriber';
    mockData.useOptimisticScenario = true;

    mock('sendHttpRequest', () => {
      return Promise.create((resolve) => resolve({statusCode: 500, body: '{}'}));
    });

    runCode(mockData);

    assertApi('gtmOnSuccess').wasCalled();
    assertApi('gtmOnFailure').wasNotCalled();

    callLater(() => {
      assertApi('gtmOnFailure').wasNotCalled();
    });
setup: |-
  const JSON = require('JSON');
  const Object = require('Object');
  const Promise = require('Promise');
  const callLater = require('callLater');

  const assign = (target, source) => {
    if (!source) return target;
    const keys = Object.keys(source);
    keys.forEach((key) => {
      target[key] = source[key];
    });
    return target;
  };

  const baseMockData = {
    eventType: 'addOrUpdateSubscriber',
    apiKey: 'testApiKey',
    listId: 'testListId',
    useOptimisticScenario: false,
    autoMapEventData: true,
    adStorageConsent: 'optional',
    emailAddress: 'subscriber@example.com',
    name: undefined,
    mobileNumber: undefined,
    consentToTrack: 'Unchanged',
    consentToSendSms: undefined,
    resubscribe: false,
    customFields: []
  };

  const createMockData = (overrides) => assign(assign({}, baseMockData), overrides || {});

  mock('getAllEventData', () => ({page_location: 'https://example.com/signup'}));
  mock('getRequestHeader', () => undefined);
  mock('sendHttpRequest', () => Promise.create((resolve) => resolve({statusCode: 200, body: '{}'})));

  const mockData = createMockData({});


___NOTES___

2026-09-16 - Change Notes:
  - First release

Created on 09/16/2026, 06:23:09

