---
created: 2022-11-14T19:44:30.368Z
modified: 2023-04-13T14:55:49.202Z
tags: [oauth,infosec,crypto,web,authorize]
---
# Oauth2

OAuth2 is the industry standard protocol for
authorization including authorizing access to functions on a server.
A third party service is used to verify the right permissinons to
perform the operation desired exists.

The simplest example of how to use OAuth is when
you want to log in to a website and it offers you the possibility of
using other credentials from other websites.
What happens in these cases is that you choose the website that will authenticate you,
then it will communicate with the original site being accessed that
the credentials are correct, thus granting access.

In other words, OAuth helps a user accomplish something, such as logging on,
between two unrelated websites.

The key detail to remember is that it's focused on authorization,
**NOT AUTHENTICATION**.
Authentication is the process of a user providing a password to prove their identity.
Authorization is the process of letting a subset access resources after
successful authentication.

More info about how to use this authorization protocol can be found here:
[OAuth2][oauth2]

## Okta

Okta is a platform that enables multiple users to
access various software with the same login.
The main reason why organizations use Okta is to
allow access to the cloud & services without
using single authentications for each endpoint or service.
This simplifies access to software through a platform that is secure & reliable.

## API Token Management with Okta

API tokens are used to authenticate requests to the Okta API
just like HTTP [cookies][-cookie] to authenticate requests.
An API token is issued for a specific user and all requests with
the token act on behalf of the user.
API tokens are secrets and should be treated like passwords.

API tokens are generated with the permissions of the user that created the token.
If a users permission change, then so does the token's.
API tokens are valid for 30 days and
automatically renew every time they are used with an API request.
When a token has been inactive for more than 30 days,
it is revokes and cannot be used again.

>"Tokens are also only valid if the user who created the token is also active.
>Tokens issued by deactivated users are rejected.
>If the user account is reactivated,
>the API token is accepted with no other action required" (Okta, Inc. 2021)

With OAuth2 for Okta,
you are able to interact with Okta APIs using scoped OAuth2 access tokens.
Each access token enables you to perform specific actions on
specific Okta APIs with ability controlled by which
scopes the access token contains.

In summary,
OAuth2 is an authorization protocol used for
accessing services without specific login credentials for those services.
Okta can be used in conjunction with
OAuth2 to create API tokens that authenticate requests for users.

## Typical Information in an OAuth Request

Typically an OAuth2 authorized service will expect a **client id**,
**issuer**, **client secret** and a **scope** to the authorization.

Typically this information will be sent in
an HTTP request using the authorization header that's standard to
HTTP requests using those 4 pieces of information.

## References

### Note References

* [Cookie (HTTP)][-cookie]

<!-- hidden references -->
[-cookie]: cookie.md "Cookie (HTTP)"

### Web References

* [Okta: Homepage][okta]
* [OAuth2 Homepage][oauth2]
* [Okta: API Token Management][okta-api-token-mgmt]

<!-- hidden references -->
[okta]: https://www.okta.com/ "Okta: Homepage"
[oauth2]: https://oauth.net/2/ "OAuth2 Homepage"
[okta-api-token-mgmt]: https://help.okta.com/en/prod/Content/Topics/Security/API.htm "Okta: API Token Management"
