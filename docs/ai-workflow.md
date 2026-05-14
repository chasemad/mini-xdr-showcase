# AI-Assisted Triage Workflow

Mini-XDR uses AI as an investigation assistant, not as an unrestricted response engine. The AI workflow is evidence-grounded, policy-mediated, and audit-friendly.

## AI Boundary

The assistant may:

- Summarize incident evidence.
- Identify likely attack patterns.
- Map observations to ATT&CK techniques.
- Suggest response options.
- Explain confidence and uncertainty.
- Draft analyst notes.

The assistant may not:

- Execute containment directly.
- Bypass tenant authorization.
- Ignore policy decisions.
- Hide uncertainty or missing evidence.
- Modify audit records.

## Evidence Pack

Before AI analysis, the platform assembles an evidence pack:

- Incident metadata.
- Timeline events.
- Related entities.
- Detection rule matches.
- Enrichment results.
- Prior action history.
- Known policy constraints.

The assistant receives bounded context rather than direct database access.

## Output Contract

AI triage output should be structured enough for review:

```json
{
  "summary": "Synthetic service account activity shows impossible travel followed by suspicious administrative access.",
  "confidence": "medium",
  "evidence": [
    "Authentication from two distant regions within 18 minutes",
    "Service account normally authenticates from one workload subnet",
    "No approved change window attached to the event"
  ],
  "recommended_action": "require_manual_review",
  "expected_impact": "No production impact until an analyst approves containment.",
  "rollback_notes": "Disable proposed account restrictions if business owner validates expected activity."
}
```

## Governance Flow

1. AI proposes an action.
2. Policy engine evaluates action, severity, tenant, asset criticality, and blast radius.
3. Low-risk actions may be logged as recommendations.
4. High-risk actions require human approval.
5. Approved actions are executed through a playbook.
6. Verification and rollback notes are attached to the audit trail.

## Prompt and Tool Safety

AI tools should be mediated through a narrow interface:

- Read-only evidence retrieval.
- No raw secret access.
- No unrestricted shell or network access.
- Explicit action schemas.
- Policy checks before execution.
- Replayable decision logs.

This design keeps AI useful during investigation while preserving deterministic control over response.
