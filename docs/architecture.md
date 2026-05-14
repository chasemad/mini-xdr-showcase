# Architecture

Mini-XDR is represented here as a three-plane security platform: data plane, control plane, and reasoning plane. The separation is intentional. High-volume telemetry moves through the data plane, tenant and workflow state stays in the control plane, and AI-assisted analysis operates through a mediated reasoning plane.

## Data Plane

The data plane collects endpoint, cloud, identity, network, and honeypot telemetry. Events are normalized into a common schema before detection logic runs against them.

Core responsibilities:

- Accept events from collectors and ingestion agents.
- Validate source identity and tenant context.
- Normalize raw logs into consistent event fields.
- Enrich events with asset, user, geo, and threat-intel context.
- Preserve raw and parsed evidence for investigation and audit.

Representative technologies include OpenTelemetry Collector, Kafka or Redpanda-style streaming, ClickHouse or OpenSearch-style hot analytics, and object storage for evidence retention.

## Control Plane

The control plane stores low-volume, high-value operational data. This includes tenants, users, assets, incidents, workflows, policy decisions, approvals, and audit records.

Representative responsibilities:

- Track incident lifecycle state.
- Store approval records and response workflow metadata.
- Maintain tenant and analyst context.
- Keep policy receipts and action history.
- Support rollback planning and verification state.

PostgreSQL is the representative control-plane datastore because relational constraints are useful for workflow state, authorization boundaries, and audit trails.

## Reasoning Plane

The reasoning plane provides AI-assisted triage and analyst support. It is deliberately separated from response authorization.

The AI assistant can:

- Summarize evidence.
- Identify likely attack patterns.
- Explain why an alert matters.
- Recommend next actions.
- Estimate confidence and likely impact.

The AI assistant cannot directly execute high-risk actions. Any response proposal must pass policy evaluation, approval requirements, and audit logging before execution.

## Investigation Model

The investigation workspace is built around four linked views:

- Incident queue for prioritization.
- Timeline for event sequence review.
- Entity graph for asset, user, IP, and indicator pivots.
- Evidence drawer for raw logs, parsed fields, and policy receipts.

This model is designed to help an analyst move from alert to evidence to decision without losing context.

## Non-Goals

This public repository does not attempt to reproduce the private implementation. It intentionally avoids:

- Private source code.
- Live infrastructure details.
- Secrets or credentials.
- Real incident data.
- Proprietary orchestration internals.
- Compliance certification claims.

## Design Principle

The central architecture rule is simple: probabilistic systems can assist investigation, but deterministic systems govern response.
