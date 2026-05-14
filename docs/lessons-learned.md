# Lessons Learned

## Separate Analysis From Authority

The most important design lesson was keeping AI analysis separate from response authority. AI is useful for synthesis and prioritization, but policy engines and human approvals should govern disruptive actions.

## Normalize Early

Detection logic becomes easier to reason about when source-specific logs are normalized early. Normalization makes it possible to write consistent rules across endpoint, identity, cloud, and honeypot telemetry.

## Evidence Must Be First-Class

An incident view is only useful if the analyst can quickly answer why the alert exists. Timelines, entity pivots, raw evidence, and policy receipts should be treated as product features, not afterthoughts.

## Graph Context Helps When Relationships Matter

Entity relationships can improve investigation when the question is about blast radius, shared identity use, lateral movement, or asset ownership. Graph modeling is most useful when it answers a concrete investigation question.

## Conservative Automation Builds Trust

Response automation should start with recommendations, simulations, and approvals before moving toward execution. That keeps automation useful while reducing the risk of accidental disruption.

## Public Portfolio Packaging Matters

For a recruiter or interviewer, a clear architecture case study is often more valuable than a large code dump. Diagrams, sanitized detections, policy examples, and tradeoff explanations make the engineering work easier to evaluate.
