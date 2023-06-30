---
created: 2023-06-29T12:29:17.594Z
modified: 2023-06-30T20:04:55.700Z
tags: [firebase,database,document,platform,develop,server,data,realtime,pcde]
---
# Firebase

## Introduction

>**Firebase** is an app development platform that helps you build and
>grow apps and games users love.
>Backed by Google and trusted by millions of businesses around the world.
>
>--[(Google Corporation 2023)][firebase-home]

Firebase is an application platform that
simplifies significant amounts of backend application service development.
This includes common backend logic like security authentication and authorization.
[Database management][-db] using its [NoSQL Document Database][-doc-db].
And provide real-time streaming of data compatible with
[publish/subscribe][-pub-sub] models of data transmission like [MQTT][-mqtt].

## Create a Real-Time Database

To create a realtime database using firebase,
obviously go to the page first, then follow these UI prompts.

1. Go to the [Firebase Console][firebase-console].
2. Use the `Add Project` link.
3. Enter Name of Project.
4. Choose whether to allow Google analytics for the project.
5. *If using analytics* then select analytics account to use.
6. Wait for project to be created.
7. Open project menu and select `Realtime Database` control panel.
8. Select `Create Realtime Database`.
9. Set data-center location.
10. Set security rules, it's good to start in
    `test-mode` *(allow public read/write for 30 days)*
11. Once the database is created, it should show a `Realtime Database` dashboard for
    the newly created database.

## Create Alarms from Realtime Data

1. Go to realtime database
2. Create another datastream or document in the document database
3. Name it
4. Copy the link to the client sending the data
5. Paste the link to whatever API is requesting or publishing to firebase.

## References

### Web Links

* [Google Corporation. 2023. Firebase Homepage][firebase-home]
* [Google Corporation. 2023. Firebase Console][firebase-console]


<!-- Hidden References -->
[firebase-home]: https://firebase.google.com "Firebase Homepage"
[firebase-console]: https://console.firebase.google.com "Firebase Console"

### Note Links

* [Database][-db]
* [Document Database][-doc-db]
* [Publish Subscribe Pattern][-pub-sub]
* [Message Queue Telemetry Transport (MQTT)][-mqtt]

<!-- Hidden References -->
[-db]: database.md "Database"
[-doc-db]: document-database.md "Document Database"
[-pub-sub]: publish-subscribe.md "Publish Subscribe Pattern"
[-mqtt]: mqtt.md "Message Queue Telemetry Transport (MQTT)"
