# Campaign Monitor tag for Google Tag Manager Server Side

The **Campaign Monitor tag for the Google Tag Manager server container** allows you to integrate your website with Campaign Monitor by adding, updating, or unsubscribing Subscribers via Campaign Monitor's Subscribers API.

This server-to-server integration helps improve data accuracy and security by communicating directly with Campaign Monitor from your server, bypassing client-side tracking limitations. Authentication uses a Campaign Monitor API Key — no OAuth setup required.

## Features

- **Add or Update Subscriber** — adds a new subscriber to a list, or updates their name, mobile number, consent, and custom fields if they're already subscribed (Campaign Monitor's Add Subscriber endpoint upserts by email address).
- **Unsubscribe Subscriber** — unsubscribes an existing subscriber from a list by email address.

## How to use Campaign Monitor tag

1. Add the Campaign Monitor tag to the server GTM container from the template gallery.
2. Add your Campaign Monitor API Key — found in your Campaign Monitor account under **Account Settings → API Keys**. [Learn more](https://www.campaignmonitor.com/api/v3-3/getting-started/) about locating your API Key.
3. Add the List ID for the list you want to add/update/unsubscribe subscribers on. This can be found in the list's settings in the Campaign Monitor UI.
4. Select the Event Type: **Add or Update Subscriber** or **Unsubscribe Subscriber**.
5. Add the subscriber's email address (or leave it empty to fall back to the event's email fields, when Automap from Event Data is enabled) and any optional fields.
6. With **Automap from Event Data** enabled (the default), fields left empty are automatically filled from Event Data — e.g. Email Address falls back to `email`/`user_data.email`/`user_data.email_address`. Disable this checkbox to require every value to be set explicitly on the tag. Each field's help text documents its exact Event Data source.

## Open Source

The **Campaign Monitor tag for GTM Server Side** is developed and maintained by [Stape Team](https://stape.io/) under the Apache 2.0 license.
