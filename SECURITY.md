# Security Policy

This repository is a sanitized public portfolio showcase. It does not contain production source code, live infrastructure configuration, secrets, credentials, or real incident data.

## Reporting Security Issues

If you notice sensitive material that appears to have been committed by mistake, please open a GitHub issue with a brief description and the affected path. Do not include secrets or exploit details in the issue body.

## Sanitization Rules

Before publishing updates, verify that the repository does not contain:

- `.env` files or environment backups.
- API keys, tokens, private keys, or passwords.
- Live hostnames, public IPs, or account IDs.
- Customer data or real incident data.
- Private logs, model artifacts, datasets, or database dumps.
- Proprietary orchestration internals.

## Demo Data

All examples should use synthetic values:

- Tenant: `tenant-demo`
- Users: `user-demo-*`, `svc-*-demo`, or `analyst-demo`
- IPs: `192.0.2.0/24`, `198.51.100.0/24`, or `203.0.113.0/24`
- Domains: `example.invalid`, `example.com`, or other documentation-safe names

## Scope

This repository is not a production security product and does not claim compliance certification. It is intended to demonstrate architecture, detection engineering, and response-governance thinking.
