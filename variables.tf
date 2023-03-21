#################
# alarm_notice
#################

variable "create_alarm_notice" {
  description = "create alarm_notice"
  type        = bool
  default     = false
}

variable "name" {
  description = "Notification template name within 60."
  type        = string
  default     = ""
}

variable "notice_language" {
  description = "Notification language zh-CN=Chinese en-US=English."
  type        = string
  default     = "en-US"
}

variable "notice_type" {
  description = "Alarm notification type ALARM=Notification not restored OK=Notification restored ALL."
  type        = string
  default     = "ALARM"
}

variable "cls_notices" {
  description = "A maximum of one alarm notification can be pushed to the CLS service."
  type = list(object({
    log_set_id = string,
    region     = string,
    topic_id   = string,
    enable     = optional(number)
  }))
  default = []
}

variable "url_notices" {
  description = "The maximum number of callback notifications is 3."
  type = list(object({
    url        = string,
    start_time = optional(number),
    end_time   = optional(number),
    weekday    = optional(set(number))
  }))
  default = []
}

variable "user_notices" {
  description = "Alarm notification template list.(At most five)."
  type = list(object({
    end_time                 = number,
    notice_way               = set(string),
    receiver_type            = string,
    start_time               = number,
    group_ids                = optional(set(number)),
    need_phone_arrive_notice = optional(number),
    phone_call_type          = optional(string),
    phone_circle_interval    = optional(number),
    phone_circle_times       = optional(number),
    phone_inner_interval     = optional(number),
    phone_order              = optional(set(number)),
    user_ids                 = optional(set(number)),
    weekday                  = optional(set(number))
  }))
  default = []
}

#################
# alarm_policy
#################

variable "create_alarm_policy" {
  description = "create alarm_policy"
  type        = bool
  default     = false
}

variable "monitor_type" {
  description = "The type of monitor."
  type        = string
  default     = ""
}

variable "namespace" {
  description = "The type of alarm."
  type        = string
  default     = ""
}

variable "policy_name" {
  description = "The name of policy."
  type        = string
  default     = ""
}

variable "conditions" {
  description = "A list of metric trigger condition."
  type = list(object({
    is_union_rule = optional(number),
    rules = optional(list(object({
      continue_period = optional(number),
      description     = optional(string),
      filter = optional(list(
        object({
          dimensions = optional(string),
          type       = optional(string)
        })
      ), []),
      is_power_notice  = optional(number),
      metric_name      = optional(string),
      notice_frequency = optional(number),
      operator         = optional(string),
      period           = optional(number),
      rule_type        = optional(string),
      unit             = optional(string),
      conditions_value = optional(string)
    })))
  }))
  default = []
}

variable "conditon_template_id" {
  description = "ID of trigger condition template."
  type        = number
  default     = 0
}

variable "enable" {
  description = "Whether to enable, default is 1."
  type        = number
  default     = 1
}

variable "event_conditions" {
  description = "A list of event trigger condition."
  type = list(object({
    continue_period = optional(number),
    description     = optional(string),
    filter = optional(list(
      object({
        dimensions = optional(string),
        type       = optional(string)
      })
    ), []),
    is_power_notice  = optional(number),
    metric_name      = optional(string),
    notice_frequency = optional(number),
    operator         = optional(string),
    period           = optional(number),
    rule_type        = optional(string),
    unit             = optional(string),
  event_conditions_value = optional(string) }))
  default = []
}

variable "notice_ids" {
  description = "List of notification rule IDs."
  type        = list(string)
  default     = []
}

variable "policy_tag" {
  description = "Policy tag to bind object."
  type = list(object({
    key = string,
  policy_tag_value = string }))
  default = []
}

variable "project_id" {
  description = "Project ID. For products with different projects, a value other than -1 must be passed in."
  type        = number
  default     = 0
}

variable "remark" {
  description = "Project ID. For products with different projects, a value other than -1 must be passed in."
  type        = string
  default     = ""
}

variable "trigger_tasks" {
  description = "Triggered task list."
  type = list(object({
    task_config = string,
  type = string }))
  default = []
}



#################
# binding_object
#################

variable "binding_object" {
  description = "binding_object"
  type        = bool
  default     = false
}

variable "dimensions" {
  description = "A list objects. Each element contains the following attributes:"
  type        = set(object({ dimensions_json = string }))
  default     = []
}

variable "group_id" {
  description = "Policy group ID for binding objects."
  type        = number
  default     = 0
}

#################
# binding_receiver
#################

variable "binding_receiver" {
  description = "binding_receiver"
  type        = bool
  default     = false
}


variable "policy_group_id" {
  description = "Policy group ID for binding receivers."
  type        = number
  default     = 0
}

variable "receivers" {
  description = "A list of receivers(will overwrite the configuration of the server or other resources). Each element contains the following attributes:"
  type = list(object({
    notify_way          = list(string),
    receiver_type       = string,
    endtime             = optional(number),
    receive_language    = optional(string),
    receiver_group_list = optional(list(string)),
    receiver_user_list  = optional(list(string)),
  start_time = optional(number) }))
  default = []
}

#################
# policy_binding_object
#################

variable "policy_binding_object" {
  description = "policy_binding_object"
  type        = bool
  default     = false
}


variable "policy_id" {
  description = "Alarm policy ID for binding objects."
  type        = number
  default     = 0
}

#################
# policy_group
#################

variable "group_name" {
  description = "Policy group name, length should between 1 and 20."
  type        = string
  default     = ""
}

variable "policy_view_name" {
  description = "Policy view name, eg:cvm_device,BANDWIDTHPACKAGE, refer to data.tencentcloud_monitor_policy_conditions(policy_view_name)."
  type        = string
  default     = ""
}

variable "policy_remark" {
  description = "Policy group's remark information."
  type        = string
  default     = ""
}

variable "policy_group_conditions" {
  description = "A list of threshold rules. Each element contains the following attributes:"
  type = list(object({
    alarm_notify_period = number,
    alarm_notify_type   = number,
    metric_id           = number,
    calc_period         = optional(number),
    calc_type           = optional(number),
    calctype            = optional(number),
    calc_value          = optional(number),
    continue_period     = optional(number)
  }))
  default = []
}

variable "policy_group_event_conditions" {
  description = "A list of event rules. Each element contains the following attributes:"
  type = list(object({
    alarm_notify_period = number,
    alarm_notify_type   = number,
    event_id            = number
  }))
  default = []
}

variable "is_union_rule" {
  description = "The and or relation of indicator alarm rule. Valid values: 0, 1. 0 represents or rule (if any rule is met, the alarm will be raised), 1 represents and rule (if all rules are met, the alarm will be raised).The default is 0."
  type        = number
  default     = 0
}

variable "policy_group_project_id" {
  description = "The project id to which the policy group belongs, default is 0."
  type        = number
  default     = 0
}









############################
# tmp_tke_alert_policy
############################

variable "create_tke_alert_policy" {
  description = "create_tke_alert_policy"
  type        = bool
  default     = false
}

variable "alert_rule" {
  description = "Alarm notification channels."
  type = list(object({
    name = string
    rules = list(object({
      for_val = string
      labels = list(object({
        name  = string
        value = string
      }))
      name     = string
      rule     = string
      template = string
      annotations = optional(list(object({
        name  = string
        value = string
      })), [])
      describe   = optional(string)
      rule_state = optional(number)
    }))
    cluster_id = optional(number)
    id         = optional(string)
    notification = optional(list(object({
      enabled = bool
      type    = string
      alert_manager = optional(list(object({
        url          = string
        cluster_id   = optional(string)
        cluster_type = optional(string)
      })))
      notify_way            = optional(set(string))
      phone_arrive_notice   = optional(bool)
      phone_circle_interval = optional(number)
      phone_circle_times    = optional(number)
      phone_inner_interval  = optional(number)
      phone_notify_order    = optional(set(string))
      receiver_groups       = optional(set(string))
      repeat_interval       = optional(string)
      time_range_end        = optional(string)
      time_range_start      = optional(string)
      web_hook              = optional(string)
    })))
    template_id = optional(string)
    updated_at  = optional(string)
  }))
  default = []
}

variable "instance_id" {
  description = "Instance Id."
  type        = string
  default     = ""
}


############################
# tmp_tke_cluster_agent
############################

variable "agents" {
  description = "agent list."
  type = list(object({
    cluster_id      = string
    cluster_type    = string
    enable_external = bool
    region          = string
    external_labels = optional(list(object({
      name  = string
      value = string
    })), [])
    in_cluster_pod_config = optional(list(object({
      host_net = bool
      node_selector = optional(list(object({
        name  = optional(string)
        value = optional(string)
      })))
      tolerations = optional(list(object({
        effect   = optional(string)
        key      = optional(string)
        operator = optional(string)
      })))
    })), [])
    not_install_basic_scrape = optional(bool)
    not_scrape               = optional(bool)
  }))
  default = []
}

variable "create_tke_cluster_agent" {
  description = "create_tke_cluster_agent"
  type        = bool
  default     = false
}




############################
# tmp_tke_config
############################

variable "cluster_id" {
  description = "ID of cluster."
  type        = string
  default     = ""
}

variable "cluster_type" {
  description = "ID of cluster."
  type        = string
  default     = ""
}

variable "pod_monitors" {
  description = "Configuration of the pod monitors."
  type = list(object({
    config      = string
    name        = string
    template_id = optional(string)
  }))
  default = []
}

variable "raw_jobs" {
  description = "Configuration of the native prometheus job."
  type = list(object({
    config      = string
    name        = string
    template_id = optional(string)
  }))
  default = []
}

variable "service_monitors" {
  description = "Configuration of the service monitors."
  type = list(object({
    config      = string
    name        = string
    template_id = optional(string)
  }))
  default = []
}

variable "create_tke_config" {
  description = "create_tke_config"
  type        = bool
  default     = false
}

############################
# tmp_tke_global_notification
############################

variable "notification" {
  description = "Alarm notification channels."
  type = list(object({
    enabled = bool
    type    = string
    alert_manager = optional(list(object({
      url          = string
      cluster_id   = optional(string)
      cluster_type = optional(string)
    })))
    notify_way            = optional(set(string))
    phone_arrive_notice   = optional(bool)
    phone_circle_interval = optional(number)
    phone_circle_times    = optional(number)
    phone_circle_interval = optional(number)
    phone_circle_times    = optional(number)
    phone_inner_interval  = optional(number)
    phone_notify_order    = optional(set(string))
    receiver_groups       = optional(set(string))
    repeat_interval       = optional(string)
    time_range_end        = optional(string)
    time_range_start      = optional(string)
    web_hook              = optional(string)
  }))
  default = []
}


variable "create_tke_global_notification" {
  description = "create_tke_global_notification"
  type        = bool
  default     = false
}




############################
# tmp_tke_record_rule_yaml
############################

variable "content" {
  description = "Contents of record rules in yaml format."
  type        = string
  default     = ""
}


variable "create_tke_record_rule_yaml" {
  description = "create_tke_record_rule_yaml"
  type        = bool
  default     = false
}

############################
# tmp_tke_template
############################

variable "template" {
  description = "Template settings."
  type = list(object({
    level      = string
    name       = string
    describe   = optional(string)
    is_default = optional(bool)
    pod_monitors = optional(list(object({
      config      = string
      name        = string
      template_id = optional(string)
    })), [])
    raw_jobs = optional(list(object({
      config      = string
      name        = string
      template_id = optional(string)
    })), [])
    record_rules = optional(list(object({
      config      = string
      name        = string
      template_id = optional(string)
    })), [])
    service_monitors = optional(list(object({
      config      = string
      name        = string
      template_id = optional(string)
    })), [])
    template_id = optional(string)
    update_time = optional(string)
    version     = optional(string)
  }))
  default = []
}


variable "create_tke_template" {
  description = "create_tke_template"
  type        = bool
  default     = false
}



############################
# tmp_tke_template_attachment
############################


variable "targets" {
  description = "Sync target details."
  type = list(object({
    instance_id   = string
    region        = string
    cluster_id    = optional(string)
    cluster_name  = optional(string)
    cluster_type  = optional(string)
    instance_name = optional(string)
    sync_time     = optional(string)
    version       = optional(string)
  }))
  default = []
}

variable "template_id" {
  description = "The ID of the template, which is used for the outgoing reference."
  type        = string
  default     = ""
}


variable "create_tke_template_attachment" {
  description = "create_tke_template_attachment"
  type        = bool
  default     = false
}





