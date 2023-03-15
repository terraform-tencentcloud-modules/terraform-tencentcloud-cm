#################
# alarm_notice
#################

output "notice_instance_id" {
  description = "ID of the resource."
  value       = tencentcloud_monitor_alarm_notice.this.*.id
}

output "ip_preset" {
  description = "Whether it is the system default notification template 0=No 1=Yes."
  value       = tencentcloud_monitor_alarm_notice.this.*.is_preset
}

output "policy_ids" {
  description = "List of alarm policy IDs bound to the alarm notification template."
  value       = tencentcloud_monitor_alarm_notice.this.*.policy_ids
}

output "updated_at" {
  description = "Last modified time."
  value       = tencentcloud_monitor_alarm_notice.this.*.updated_at
}

output "updated_by" {
  description = "Last Modified By."
  value       = tencentcloud_monitor_alarm_notice.this.*.updated_by
}