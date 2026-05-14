# SOAR Governance

Mini-XDR represents SOAR response as a governed workflow, not a direct automation shortcut. This matters because containment actions can disrupt business systems if executed without context.

## Workflow Lifecycle

1. Detection creates or updates an incident.
2. Analyst or AI assistant proposes a response.
3. Policy engine evaluates the proposal.
4. Approval gate decides whether execution can proceed.
5. Playbook executes approved actions.
6. Verification checks whether the action worked.
7. Rollback plan remains available when supported.
8. Audit trail records the decision, inputs, and result.

## Policy Inputs

Policy decisions may consider:

- Tenant ID.
- User role.
- Asset criticality.
- Incident severity.
- Detection confidence.
- Business-hour constraints.
- Action category.
- Rollback availability.
- Kill-switch state.

## Example Response Categories

| Category | Example | Approval Handling |
| --- | --- | --- |
| Observe | Add to watchlist | Usually no approval |
| Notify | Page analyst or owner | Usually no approval |
| Collect | Gather forensic package | May require approval |
| Contain | Isolate endpoint or block IP | Approval required |
| Identity | Disable account or force reset | Approval required |
| Restore | Roll back containment | Approval required or break-glass |

## Rollback Planning

Every disruptive action should answer:

- What exactly changes?
- How is success verified?
- What is the expected business impact?
- Who approved it?
- How can it be reversed?
- What evidence proves the action was necessary?

## Public Example

See [examples/playbooks/contain-compromised-endpoint.yml](../examples/playbooks/contain-compromised-endpoint.yml) for a sanitized response workflow and [examples/rego/action-approval.rego](../examples/rego/action-approval.rego) for a simple policy gate.
