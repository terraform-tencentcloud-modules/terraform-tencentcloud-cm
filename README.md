
# TencentCloud Monitor  Module for Terraform

## terraform-tencentcloud-cm

A terraform module used to create CDN domain.

The following resources are included.

* [Alarm Notice](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/monitor_alarm_notice)
* [Alarm Policy](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/monitor_alarm_policy)
* [Binding Object](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/monitor_binding_object)
* [Binding Receiver](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/monitor_binding_receiver)
* [Policy Binding Object](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/monitor_policy_binding_object)
* [Policy Group](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/monitor_policy_group)
* [TKE Alert Policy](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/monitor_tmp_tke_alert_policy)
* [TKE Cluster Agent](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/monitor_tmp_tke_cluster_agent)
* [TKE Config](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/monitor_tmp_tke_config)
* [TKE Global Notification](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/monitor_tmp_tke_global_notification)
* [TKE Record Rule Yaml](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/monitor_tmp_tke_record_rule_yaml)
* [TKE Template](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/monitor_tmp_tke_template)
* [TKE Template Attachment](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/monitor_tmp_tke_template_attachment)

## Usage
```hcl
module "tencentcloud_monitor_alarm_notice" {
  name            = "test_alarm_notice_1"
  notice_type     = "ALL"
  notice_language = "zh-CN"

  user_notices =[{
    receiver_type            = "USER"
    start_time               = 0
    end_time                 = 1
    notice_way               = ["SMS", "EMAIL"]
    user_ids                 = [10001]
    group_ids                = []
    phone_order              = [10001]
    phone_circle_times       = 2
    phone_circle_interval    = 50
    phone_inner_interval     = 60
    need_phone_arrive_notice = 1
    phone_call_type          = "CIRCLE"
    weekday                  = [1, 2, 3, 4, 5, 6, 7]
  }]

  url_notices =[{
    url        = "https://www.mytest.com/validate"
    end_time   = 0
    start_time = 1
    weekday    = [1, 2, 3, 4, 5, 6, 7]
  }]

}
```

## Conditional Creation

This module can create CDN domain.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| name | Notification template name within 60. | string |  | yes 
| notice_language | Notification language zh-CN=Chinese en-US=English. | string | "" | yes 
| notice_type | Alarm notification type ALARM=Notification not restored OK=Notification restored ALL. | string | ""  | yes 
| cls_notices | A maximum of one alarm notification can be pushed to the CLS service. | list(any) | [] | no |
| url_notices | A maximum of one alarm notification can be pushed to the CLS service. | list(any) | [] | no |
| user_notices | A maximum of one alarm notification can be pushed to the CLS service. | list(any) | [] | no |
| monitor_type | The type of monitor. | string |  | yes 
| namespace | The type of alarm. | string |  | yes 
| policy_name | The name of policy. | string |  | yes 
| conditions | A list of metric trigger condition. | list(any) | [] | no 
| conditon_template_id | ID of trigger condition template. | int |  | no  
| enable | Whether to enable, default is 1. | int |  | no  
| event_conditions | A list of event trigger condition. | list(any) | [] | no  
| notice_ids | List of notification rule IDs.. | list(string) |  | no  
| policy_tag | Policy tag to bind object. | list(any) |  | no  
| project_id | Project ID. For products with different projects, a value other than -1 must be passed in. | int |  | no  
| remark | The remark of policy group. | string |  | no  
| trigger_tasks | Triggered task list. | list(any) |  | no  
| dimensions | A list objects. Each element contains the following attributes: | set(any) |  | yes 
| group_id | Policy group ID for binding objects. | int |  | yes 
| receivers | A list of receivers(will overwrite the configuration of the server or other resources). Each element contains the following attributes: | list(any) |  | yes 
| policy_group_id | Policy group ID for binding receivers. | string |  | yes 
| policy_id |  Alarm policy ID for binding objects. | string |  | yes 
| group_name | Policy group name, length should between 1 and 20. | string |  | yes 
| policy_view_name | Policy view name, eg:cvm_device,BANDWIDTHPACKAGE, refer to data.tencentcloud_monitor_policy_conditions(policy_view_name). | string |  | yes 
| remark | Policy group's remark information. | string |  | yes 
| policy_group_conditions | A list of threshold rules. Each element contains the following attributes: | list(any) |  | no 
| policy_group_event_conditions | A list of event rules. Each element contains the following attributes: | list(any) |  | no 
| is_union_rule | The and or relation of indicator alarm rule. Valid values: 0, 1. 0 represents or rule (if any rule is met, the alarm will be raised), 1 represents and rule (if all rules are met, the alarm will be raised).The default is 0. | int | 0 | no 
| project_id | he project id to which the policy group belongs, default is 0. | int | 0 | no 
| alert_rule | Alarm notification channels. | list(any) |  | no 
| instance_id | Instance Id. | string |  | no 
| agents | agent list. | list(any) |  | yes 
| cluster_id | ID of cluster. | string |  | yes 
| cluster_type | Type of cluster. | string |  | yes 
| pod_monitors | Configuration of the pod monitors. | list(any) |  | no 
| raw_jobs | Configuration of the native prometheus job. | list(any) |  | no 
| service_monitors | Configuration of the service monitors. | list(any) |  | no 
| notification | Alarm notification channels. | list(any) |  | yes 
| content | Contents of record rules in yaml format. | string |  | yes 
| template | Template settings. | list(any) |  | yes 
| targets | Sync target details.. | list(any) |  | yes 
| template_id | The ID of the template, which is used for the outgoing reference. | string |  | yes 



## Outputs

| Name | Description |
|------|-------------|
| notice_instance_id | ID of the resource. |
| ip_preset | Whether it is the system default notification template 0=No 1=Yes. |
| policy_ids | List of alarm policy IDs bound to the alarm notification template. |
| updated_at | Last modified time. |
| updated_by | Last Modified By. |
| policy_instance_id | ID of the resource. |
| create_time | The alarm policy create time. |
| update_time | The alarm policy update time. |
| binding_object_instance_id | ID of the resource. |
| binding_receiver_instance_id | ID of the resource. |
| policy_binding_object_instance_id | ID of the resource. |
| policy_group_instance_id | ID of the resource. |
| binding_objects | A list binding objects(list only those in the provider.region).  |
| tmp_tke_alert_policy_instance_id | ID of the resource. |
| tmp_tke_cluster_agent_instance_id | ID of the resource. |
| tmp_tke_config_instance_id | ID of the resource. |
| config | Global configuration. |
| tmp_tke_global_notification_instance_id | ID of the resource. |
| tmp_tke_record_rule_yaml_instance_id | ID of the resource. |
| cluster_id | An ID identify the cluster, like cls-xxxxxx. |
| name | Name of the instance. |
| template_id | Used for the argument, if the configuration comes to the template, the template id. |
| tke_record_rule_yaml_update_time | Last modified time of record rule. |
| tmp_tke_template_instance_id | ID of the resource. |
| tmp_tke_template_attachment_instance_id | ID of the resource. |




## Authors

Created and maintained by [TencentCloud](https://github.com/terraform-providers/terraform-provider-tencentcloud)

## License

Mozilla Public License Version 2.0.
See LICENSE for full details.
