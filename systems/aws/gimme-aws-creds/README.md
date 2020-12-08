# `gimme-aws-creds`

> gimme-aws-creds is a CLI that utilizes an Okta IdP via SAML to acquire temporary AWS credentials via AWS STS.
>
> Okta is a SAML identity provider (IdP), that can be easily set-up to do SSO to your AWS console. Okta does offer an OSS java CLI tool to obtain temporary AWS credentials, but I found it needs more information than the average Okta user would have and doesn't scale well if have more than one Okta App.
>
> With gimme-aws-creds all you need to know is your username, password, Okta url and MFA token, if MFA is enabled. gimme-aws-creds gives you the option to select which Okta AWS application and role you want credentials for. Alternatively, you can pre-configure the app and role name by passing -c or editing the config file. This is all covered in the usage section.
>
> -- Project github: https://github.com/Nike-Inc/gimme-aws-creds

GAWSC uses Okta to generate temporary AWS credentials. Bypasses a lot of the hassle of key auth / TFA. 

* Source / Docs / Guide: https://github.com/Nike-Inc/gimme-aws-creds

## Installation

* Install prog:

`$ pip3 install gimme-aws-creds`

* Install keyrings.alt (necessary on Linux/WSL):

`$ pip3 install keyrings.alt`

* Move `okta_aws_login_config` to `~/.okta_aws_login_config` (mind the dot). Change defaults as necessary. (If file not present, the first invocation of `gimme-aws-creds` will prompt questions to make this config, although the answers are often non-obvious.)

## Use

```
$ gimme-aws-creds
$ aws <...>
```
