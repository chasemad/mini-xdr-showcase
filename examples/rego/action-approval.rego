package minixdr.response

default allow = false
default approval_required = true

low_risk_actions = {
  "add_watchlist_note",
  "notify_analyst",
  "collect_recent_logs"
}

high_risk_actions = {
  "isolate_endpoint",
  "disable_user",
  "block_network_egress",
  "quarantine_file"
}

allow {
  input.tenant_id != ""
  low_risk_actions[input.action]
  input.kill_switch_enabled == false
}

allow {
  input.tenant_id != ""
  high_risk_actions[input.action]
  input.kill_switch_enabled == false
  input.approval.status == "approved"
  input.approval.approved_by != ""
  input.rollback.supported == true
}

approval_required {
  high_risk_actions[input.action]
}

deny_reason["kill switch is enabled"] {
  input.kill_switch_enabled == true
}

deny_reason["approval required for high-risk action"] {
  high_risk_actions[input.action]
  input.approval.status != "approved"
}

deny_reason["rollback plan required for high-risk action"] {
  high_risk_actions[input.action]
  input.rollback.supported != true
}
