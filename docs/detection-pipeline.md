# Detection Pipeline

The detection pipeline shows how Mini-XDR turns raw telemetry into prioritized findings. The examples in this repository use synthetic events and Sigma-style rules to demonstrate the approach without exposing private detection content.

## Flow

1. Collect telemetry from endpoint, cloud, identity, network, and honeypot sources.
2. Validate source authentication and tenant context.
3. Normalize source-specific fields into a consistent event contract.
4. Enrich the event with asset, identity, geo, and threat-intel context.
5. Run deterministic detections, correlation rules, and risk scoring.
6. Create or update an incident with evidence links.
7. Route the incident into analyst triage and response governance.

## Normalized Event Contract

| Field | Purpose | Example |
| --- | --- | --- |
| `tenant_id` | Prevents cross-tenant ambiguity | `tenant-demo` |
| `event_time` | Event occurrence time in UTC | `2026-05-14T17:22:41Z` |
| `source_type` | Original source family | `endpoint`, `identity`, `cloud`, `honeypot` |
| `activity_name` | Normalized activity label | `Process Created` |
| `src_endpoint.ip` | Source IP when available | `198.51.100.24` |
| `actor.user.name` | User or service account | `svc-backup-demo` |
| `process.cmd_line` | Command-line evidence | `powershell -enc ...` |
| `severity_id` | Normalized severity value | `3` |
| `metadata.log_name` | Source log or dataset name | `synthetic-auth-demo` |

## Severity Mapping

| Severity | Meaning | Typical Handling |
| --- | --- | --- |
| Informational | Useful context, no immediate action | Store and enrich |
| Low | Suspicious but weak signal | Correlate and monitor |
| Medium | Credible signal requiring review | Create finding or incident |
| High | Strong malicious pattern or high impact | Page analyst and require policy review |
| Critical | Active compromise or broad blast radius | Require approval-gated containment |

## ATT&CK Alignment

Detections include MITRE ATT&CK references when the behavior maps cleanly to a technique. For example:

- Encoded PowerShell command: `T1059.001`
- Impossible travel for service account: `T1078`
- Credential stuffing or password spray: `T1110`
- Suspicious cloud policy change: `T1098`

ATT&CK tags are used as investigation context, not as proof of compromise by themselves.

## False-Positive Handling

Each detection should include enough context for review:

- Why the behavior is suspicious.
- What evidence triggered the rule.
- Known benign cases.
- Required data sources.
- Suggested next pivot.

The public examples include false-positive notes to show detection engineering judgment, not just alert creation.

## Example Files

- [Suspicious encoded command](../examples/sigma/suspicious-encoded-command.yml)
- [Impossible travel service account](../examples/sigma/impossible-travel-service-account.yml)
- [OCSF-style finding event](../examples/ocsf/finding-event.json)
- [Synthetic authentication events](../examples/ocsf/authentication-events.jsonl)
