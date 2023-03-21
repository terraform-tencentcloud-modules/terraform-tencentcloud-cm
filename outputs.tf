#################
# alarm_notice
#################

output "notice_instance_id" {
  description = "ID of the resource."
  value       = try(tencentcloud_monitor_alarm_notice.this.*.id, "")
}

output "ip_preset" {
  description = "Whether it is the system default notification template 0=No 1=Yes."
  value       = try(tencentcloud_monitor_alarm_notice.this.*.is_preset, "")
}

output "policy_ids" {
  description = "List of alarm policy IDs bound to the alarm notification template."
  value       = try(tencentcloud_monitor_alarm_notice.this.*.policy_ids, "")
}

output "updated_at" {
  description = "Last modified time."
  value       = try(tencentcloud_monitor_alarm_notice.this.*.updated_at, "")
}

output "updated_by" {
  description = "Last Modified By."
  value       = try(tencentcloud_monitor_alarm_notice.this.*.updated_by, "")
}

#################
# alarm_policy
#################

output "policy_instance_id" {
  description = "ID of the resource."
  value       = tencentcloud_monitor_alarm_policy.this.*.id
}

output "create_time" {
  description = "The alarm policy create time."
  value       = tencentcloud_monitor_alarm_policy.this.*.create_time
}

output "update_time" {
  description = "The alarm policy update time."
  value       = tencentcloud_monitor_alarm_policy.this.*.update_time
}

#################
# binding_object
#################

output "binding_object_instance_id" {
  description = "ID of the resource."
  value       = tencentcloud_monitor_binding_object.this.*.id
}

#################
# binding_receiver
#################

output "binding_receiver_instance_id" {
  description = "ID of the resource."
  value       = tencentcloud_monitor_binding_receiver.this.*.id
}

#################
# policy_binding_object
#################

output "policy_binding_object_instance_id" {
  description = "ID of the resource."
  value       = tencentcloud_monitor_policy_binding_object.this.*.id
}

#################
# policy_group
#################

output "policy_group_instance_id" {
  description = "ID of the resource."
  value       = tencentcloud_monitor_policy_group.this.*.id
}

output "binding_objects" {
  description = "A list binding objects(list only those in the provider.region). "
  value       = tencentcloud_monitor_policy_group.this.*.binding_objects
}

############################
# tmp_tke_alert_policy
############################

output "tmp_tke_alert_policy_instance_id" {
  description = "ID of the resource."
  value       = tencentcloud_monitor_tmp_tke_alert_policy.this.*.id
}


############################
# tmp_tke_cluster_agent
############################

output "tmp_tke_cluster_agent_instance_id" {
  description = "ID of the resource."
  value       = tencentcloud_monitor_tmp_tke_cluster_agent.this.*.id
}

############################
# tmp_tke_config
############################

output "tmp_tke_config_instance_id" {
  description = "ID of the resource."
  value       = tencentcloud_monitor_tmp_tke_config.this.*.id
}

output "config" {
  description = "Global configuration."
  value       = tencentcloud_monitor_tmp_tke_config.this.*.config
}


############################
# tmp_tke_global_notification
############################

output "tmp_tke_global_notification_instance_id" {
  description = "ID of the resource."
  value       = tencentcloud_monitor_tmp_tke_global_notification.this.*.id
}


############################
# tmp_tke_record_rule_yaml
############################

output "tmp_tke_record_rule_yaml_instance_id" {
  description = "ID of the resource."
  value       = tencentcloud_monitor_tmp_tke_record_rule_yaml.this.*.id
}

output "cluster_id" {
  description = "An ID identify the cluster, like cls-xxxxxx."
  value       = tencentcloud_monitor_tmp_tke_record_rule_yaml.this.*.cluster_id
}

output "name" {
  description = "Name of the instance."
  value       = tencentcloud_monitor_tmp_tke_record_rule_yaml.this.*.name
}

output "template_id" {
  description = "Used for the argument, if the configuration comes to the template, the template id."
  value       = tencentcloud_monitor_tmp_tke_record_rule_yaml.this.*.template_id
}

output "tke_record_rule_yaml_update_time" {
  description = "Last modified time of record rule."
  value       = tencentcloud_monitor_tmp_tke_record_rule_yaml.this.*.update_time
}

############################
# tmp_tke_template
############################

output "tmp_tke_template_instance_id" {
  description = "ID of the resource."
  value       = tencentcloud_monitor_tmp_tke_template.this.*.id
}

############################
# tmp_tke_template_attachment
############################

output "tmp_tke_template_attachment_instance_id" {
  description = "ID of the resource."
  value       = tencentcloud_monitor_tmp_tke_template_attachment.this.*.id
}




