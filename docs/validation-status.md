# Mini-XDR — Implementation and Validation Status

This document separates hands-on lab work from architectural examples in the public showcase. It is a portfolio record, **not** a claim of production deployment, an independently audited test report, or a current end-to-end health check of private software.

## 1. Hands-on lab workflow (historically tested)

The project owner reports building and testing the following workflow in a controlled, non-production environment:

1. Used a **Cowrie SSH honeypot** to generate and observe suspicious authentication activity.
2. Sent security event information into a monitoring and detection workflow.
3. Observed suspicious activity being surfaced as security events and incidents in an analyst-facing application.
4. Investigated incident and event records through the interface.
5. Exercised **IP block and unblock** response workflows and viewed related action history and application-reported UFW firewall containment status.

These activities used controlled simulations. They are not evidence of a real-world breach or deployment to an organizational security operations center.

**Evidence limit:** The original walkthrough demonstrates application behavior and reported containment outcomes. The public showcase does not independently verify every underlying firewall rule change with corresponding host-level command output, nor establish the same functionality across every architecture component.

## 2. Architecture, prototypes, and illustrative interfaces

The following topics are documented in this repository as **design patterns, sample artifacts, or sanitized interface examples**, rather than uniformly verified production-ready integrations:

- Cross-source endpoint, cloud, identity, and network telemetry normalization and streaming.
- Broad XDR/SIEM/SOAR architecture using technologies such as Kafka, OpenSearch/ClickHouse, OCSF, and PostgreSQL.
- AI-assisted triage, agent command centers, natural-language workflow creation, and multi-agent coordination.
- Sigma-style detections, policy-as-code examples, approval flows, simulation, rollback planning, and audit receipts.
- Entity graphs, blast-radius analysis, and wider AWS-style reference architectures.

Some features or interfaces were explored in private application iterations. **A screenshot or example configuration alone does not establish that an external integration was configured, a model was validated, or an automated response was successfully executed.**

## 3. AI development and model-performance boundaries

The project owner planned requirements, architecture, integrations, and testing workflows; used **Claude and Cursor for source-code implementation and code-level debugging**; and personally set up labs, ran functional tests, identified behavioral issues, and directed iterations.

AI coding assistance used to **create** the software is different from AI-assisted analysis **within** the application. This showcase does not provide reproducible model-training and evaluation artifacts, so it does **not** claim measured detection accuracy, precision, recall, or proven real-world model performance.

## 4. Public evidence and limitations

- The repository provides architecture write-ups, sanitized screenshots, synthetic events, sample detection rules, and example policies/playbooks.
- The private working application and its full codebase are outside the scope of this public showcase.
- A shortened, privacy-cleaned walkthrough was prepared; a public link should be added only after the final version has been reviewed and published.
- Some experimental response interfaces may display action states that require correction. A displayed success indicator is not sufficient verification by itself.
- **Separate AWS, Microsoft Sentinel, and Splunk learning labs should not be read as validated live Mini-XDR integrations** unless corresponding integration evidence is supplied.

## 5. Sensible next validation steps

1. Reproduce the Cowrie event → detection → incident → response path in a fresh local environment.
2. Record what event triggered the detection, the corresponding incident identifier, and the relevant timestamps.
3. Verify firewall containment and rollback independently at host level, in addition to the application history.
4. Reconcile any mismatch between action result fields and UI status colors.
5. Review the demonstration for personal information, publish the privacy-cleaned edition, and add a link to this repository.

The emphasis of this project is practical learning in security monitoring and response, with transparent limits around experimental architecture.