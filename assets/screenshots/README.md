# Screenshot Placeholders

Add sanitized screenshots here after capturing them from a demo environment. Do not include real customer data, live public IP addresses, secrets, personal credentials, or private incident details.

Expected filenames:

| Filename | Intended View |
| --- | --- |
| `dashboard-overview.png` | Main SOC dashboard with synthetic metrics |
| `incident-queue.png` | Incident queue with fake tenant and demo incidents |
| `investigation-workspace.png` | Timeline, evidence, and entity pivot view |
| `ai-triage-panel.png` | AI summary with evidence and confidence fields |
| `soar-approval-workflow.png` | Policy and approval workflow state |
| `threat-visualization.png` | 3D threat visualization or attack map |
| `honeypot-monitoring.png` | T-Pot/Cowrie-style monitoring with synthetic or redacted data |

Recommended redactions:

- Replace IPs with RFC 5737 documentation ranges: `192.0.2.0/24`, `198.51.100.0/24`, or `203.0.113.0/24`.
- Replace tenants with `tenant-demo`.
- Replace users with names such as `analyst-demo`, `svc-backup-demo`, or `user-demo-001`.
- Crop browser chrome if it shows local paths, extensions, personal accounts, or tokens.
