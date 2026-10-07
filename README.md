# Campaign Monitor tag for Google Tag Manager Server Side

The **Campaign Monitor tag for the Google Tag Manager server container** allows you to integrate your website with Campaign Monitor by adding, updating, or unsubscribing Subscribers via Campaign Monitor's Subscribers API.

This server-to-server integration helps improve data accuracy and security by communicating directly with Campaign Monitor from your server, bypassing client-side tracking limitations. Authentication uses a Campaign Monitor API Key — no OAuth setup required.

## Features

- **Add or Update Subscriber** — adds a new subscriber to a list, or updates their name, mobile number, consent, and custom fields if they already exist on it (Campaign Monitor's Add Subscriber endpoint upserts by email address). A subscriber who is unsubscribed, inactive or on the suppression list is not re-added to the list unless **Resubscribe if previously unsubscribed** is enabled. Use it with caution: only re-add people who have given permission.
- **Unsubscribe Subscriber** — unsubscribes an existing subscriber from a list by email address.

## How to use Campaign Monitor tag

1. Add the Campaign Monitor tag to the server GTM container from the template gallery.
2. Add your Campaign Monitor API Key — found in your Campaign Monitor account under **Account Settings → API Keys**. [Learn more](https://www.campaignmonitor.com/api/v3-3/getting-started/) about locating your API Key.
3. Add the List ID for the list you want to add/update/unsubscribe subscribers on. This can be found in the list's settings in the Campaign Monitor UI.
4. Select the Event Type: **Add or Update Subscriber** or **Unsubscribe Subscriber**.
5. Add the subscriber's email address. Leave it empty to fall back to the event's email fields when **Automap from Event Data** is enabled.
6. For Add or Update Subscriber, optionally set the Name, Mobile Number, Tracking Consent, SMS Consent, Resubscribe and Custom Fields.

### Automap from Event Data

Enabled by default (**Automap from Event Data** checkbox). When on, fields left empty fall back to Event Data. Hashed (SHA-256) values are skipped, since Campaign Monitor needs plain text values.

- **Email Address** — the first available value of:
  - `eventData.email`
  - `eventData.email_address`
  - `eventData.user_data.email`
  - `eventData.user_data.email_address`
- **Name** — `eventData.user_data.address.first_name` and `eventData.user_data.address.last_name`, joined by a space.
- **Mobile Number** — the first valid value of the list below. Spaces, dashes, dots and parentheses are removed and a missing `+` prefix is added. Values that are not valid E.164 numbers are skipped, since Campaign Monitor rejects the whole request for an invalid Mobile Number:
  - `eventData.phone`
  - `eventData.phone_number`
  - `eventData.user_data.phone_number`
  - `eventData.user_data.phone`

Disable this checkbox to require every value to be set explicitly on the tag. The Email Address then becomes a required field.

### Consent fields

- **Tracking Consent** — whether the subscriber consents to having their email opens and clicks tracked. Campaign Monitor requires this value, so the tag sends `Unchanged` (default) when it's not set. Campaign Monitor treats `Unchanged` as consenting for a new subscriber, and as a no-op for an existing one.
- **SMS Consent** — only applies when a Mobile Number is sent. Leave unset to keep the subscriber's existing SMS consent.

### Custom Fields

Campaign Monitor identifies Custom (Personalization) Fields by their **key** (e.g. `website`), not their label. Find each field's key in the list's Personalization Fields settings in the Campaign Monitor UI. Each row requires a key and a value. For a "Multi-Valued Select Many" field, add multiple rows with the same key and a different value in each. Each value is limited to 250 characters.

## Additional information

- **Use Optimistic Scenario:** calls `gtmOnSuccess()` without waiting for Campaign Monitor's response. This speeds up the server container response, but reports success even if the API call fails.
- **Tag Execution Consent Settings:** the tag can send data always, or only when marketing consent (`ad_storage`) is given. When consent is required and not given, the tag doesn't send anything and finishes as successful.

## Open Source

The **Campaign Monitor tag for GTM Server Side** is developed and maintained by [Stape Team](https://stape.io/) under the Apache 2.0 license.
