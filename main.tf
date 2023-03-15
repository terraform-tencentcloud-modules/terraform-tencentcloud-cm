resource "tencentcloud_monitor_alarm_notice" "this" {
  count           = var.create_alarm_notice ? 1 : 0
  name            = var.name
  notice_language = var.notice_language
  notice_type     = var.notice_type

  dynamic "cls_notices" {
    for_each = var.cls_notices
    content {
      log_set_id = cls_notices.value["log_set_id"]
      region     = cls_notices.value["region"]
      topic_id   = cls_notices.value["topic_id"]
      enable     = cls_notices.value["enable"]
    }
  }
  dynamic "url_notices" {
    for_each = var.url_notices
    content {
      url        = url_notices.value["url"]
      end_time   = url_notices.value["end_time"]
      start_time = url_notices.value["start_time"]
      weekday    = url_notices.value["weekday"]
    }
  }
  dynamic "user_notices" {
    for_each = var.user_notices
    content {
      end_time      = user_notices.value["end_time"]
      notice_way    = user_notices.value["notice_way"]
      receiver_type = user_notices.value["receiver_type"]

      start_time = user_notices.value["start_time"]

      group_ids                = user_notices.value["group_ids"]
      need_phone_arrive_notice = user_notices.value["need_phone_arrive_notice"]
      phone_call_type          = user_notices.value["phone_call_type"]
      phone_circle_interval    = user_notices.value["phone_circle_interval"]
      phone_circle_times       = user_notices.value["phone_circle_times"]
      phone_inner_interval     = user_notices.value["phone_inner_interval"]
      phone_order              = user_notices.value["phone_order"]
      user_ids                 = user_notices.value["user_ids"]

      weekday = user_notices.value["weekday"]
    }
  }
}

resource "tencentcloud_monitor_alarm_policy" "this" {
  count        = var.create_alarm_policy ? 1 : 0
  monitor_type = var.monitor_type
  namespace    = var.namespace
  policy_name  = var.policy_name
  dynamic "conditions" {
    for_each = var.conditions
    content {
      is_union_rule = conditions.value["is_union_rule"]
      dynamic "rules" {
        for_each = conditions.value.rules
        content {
          continue_period = rules.value["continue_period"]
          description     = rules.value["description"]
          dynamic "filter" {
            for_each = rules.value["filter"]
            content {
              dimensions = filter.value["dimensions"]
              type       = filter.value["type"]
            }
          }
          is_power_notice  = rules.value["is_power_notice"]
          metric_name      = rules.value["metric_name"]
          notice_frequency = rules.value["notice_frequency"]
          operator         = rules.value["operator"]
          period           = rules.value["period"]
          rule_type        = rules.value["rule_type"]
          unit             = rules.value["unit"]
          value            = rules.value["conditions_value"]
        }
      }
    }
  }

  conditon_template_id = var.conditon_template_id
  enable               = var.enable

  dynamic "event_conditions" {
    for_each = var.event_conditions
    content {
      continue_period = event_conditions.value["continue_period"]
      description     = event_conditions.value["description"]
      dynamic "filter" {
        for_each = event_conditions.value.filter
        content {
          dimensions = filter.value["dimensions"]
          type       = filter.value["type"]
        }
      }
      is_power_notice  = event_conditions.value["is_power_notice"]
      metric_name      = event_conditions.value["metric_name"]
      notice_frequency = event_conditions.value["notice_frequency"]
      operator         = event_conditions.value["operator"]
      period           = event_conditions.value["period"]
      rule_type        = event_conditions.value["rule_type"]
      unit             = event_conditions.value["unit"]
      value            = event_conditions.value["event_conditions_value"]
    }
  }
  notice_ids = var.notice_ids
  dynamic "policy_tag" {
    for_each = var.policy_tag
    content {
      key   = policy_tag.value["key"]
      value = policy_tag.value["value"]
    }
  }
  project_id = var.project_id
  remark     = var.remark
  dynamic "trigger_tasks" {
    for_each = var.trigger_tasks
    content {
      task_config = trigger_tasks.value["task_config"]
      type        = trigger_tasks.value["type"]
    }
  }
}





resource "tencentcloud_monitor_binding_object" "this" {
  count    = var.binding_object ? 1 : 0
  group_id = var.group_id

  dynamic "dimensions" {
    for_each = var.dimensions
    content {
      dimensions_json = dimensions.value["dimensions_json"]
    }
  }
}

resource "tencentcloud_monitor_binding_receiver" "this" {
  count    = var.binding_receiver ? 1 : 0
  group_id = var.policy_group_id
  dynamic "receivers" {
    for_each = var.receivers
    content {
      notify_way          = receivers.value["notify_way"]
      receiver_type       = receivers.value["receiver_type"]
      end_time            = receivers.value["end_time"]
      receive_language    = receivers.value["receive_language"]
      receiver_group_list = receivers.value["receiver_group_list"]
      receiver_user_list  = receivers.value["receiver_user_list"]
      start_time          = receivers.value["start_time"]
    }
  }
}

resource "tencentcloud_monitor_policy_binding_object" "this" {
  policy_id = var.policy_id

  dynamic "dimensions" {
    for_each = var.dimensions
    content {
      dimensions_json = dimensions.value["dimensions_json"]
    }
  }
}


resource "tencentcloud_monitor_policy_group" "this" {
  count = var.create_policy_group ? 1 : 0

  group_name       = var.group_name
  policy_view_name = var.policy_view_name
  remark           = var.policy_remark

  dynamic "conditions" {
    for_each = var.policy_group_conditions
    content {
      alarm_notify_period = conditions.value["alarm_notify_period"]
      alarm_notify_type   = conditions.value["alarm_notify_type"]
      metric_id           = conditions.value["metric_id"]
      calc_period         = conditions.value["calc_period"]
      calc_type           = conditions.value["calc_type"]
      calc_value          = conditions.value["calc_value"]
      continue_period     = conditions.value["continue_period"]
    }
  }

  dynamic "event_conditions" {
    for_each = var.policy_group_event_conditions
    content {
      alarm_notify_period = event_conditions.value["alarm_notify_period"]
      alarm_notify_type   = event_conditions.value["alarm_notify_type"]
      event_id            = event_conditions.value["event_id"]
    }
  }
  is_union_rule = var.is_union_rule
  project_id    = var.policy_group_project_id
}

resource "tencentcloud_monitor_tmp_tke_alert_policy" "this" {
  count = var.create_tke_alert_policy ? 1 : 0

  dynamic "alert_rule" {
    for_each = var.alert_rule
    content {
      name = alert_rule.value["name"]
      dynamic "rules" {
        for_each = alert_rule.value.rules
        content {
          for = rules.value["for_val"]
          dynamic "labels" {
            for_each = rules.value["labels"]
            content {
              name  = labels.value["name"]
              value = labels.value["value"]
            }
          }

          name     = rules.value["name"]
          rule     = rules.value["rule"]
          template = rules.value["template"]
          dynamic "annotations" {
            for_each = rules.value["annotations"]
            content {
              name  = annotations.value["name"]
              value = annotations.value["value"]
            }
          }

          describe   = rules.value["describe"]
          rule_state = rules.value["rule_state"]
        }
      }
      cluster_id = alert_rule.value["cluster_id"]
      id         = alert_rule.value["id"]
      dynamic "notification" {
        for_each = alert_rule.value.notification
        content {
          enabled = notification.value["enabled"]
          type    = notification.value["type"]
          dynamic "alert_manager" {
            for_each = notification.value["alert_manager"]
            content {
              url          = alert_manager.value["url"]
              cluster_id   = alert_manager.value["cluster_id"]
              cluster_type = alert_manager.value["cluster_type"]
            }
          }

          notify_way            = notification.value["notify_way"]
          phone_arrive_notice   = notification.value["phone_arrive_notice"]
          phone_circle_interval = notification.value["phone_circle_interval"]
          phone_circle_times    = notification.value["phone_circle_times"]
          phone_inner_interval  = notification.value["phone_inner_interval"]
          phone_notify_order    = notification.value["phone_notify_order"]
          receiver_groups       = notification.value["receiver_groups"]
          repeat_interval       = notification.value["repeat_interval"]
          time_range_end        = notification.value["time_range_end"]
          time_range_start      = notification.value["time_range_start"]
          web_hook              = notification.value["web_hook"]
        }
      }
      template_id = alert_rule.value["template_id"]
      updated_at  = alert_rule.value["updated_at"]
    }
  }

  instance_id = var.instance_id
}


resource "tencentcloud_monitor_tmp_tke_cluster_agent" "this" {
  count = var.create_tke_cluster_agent ? 1 : 0

  dynamic "agents" {
    for_each = var.agents
    content {
      cluster_id      = agents.value["cluster_id"]
      cluster_type    = agents.value["cluster_type"]
      enable_external = agents.value["enable_external"]
      region          = agents.value["region"]
      dynamic "external_labels" {
        for_each = agents.value.external_labels
        content {
          name  = external_labels.value["name"]
          value = external_labels.value["value"]
        }
      }
      dynamic "in_cluster_pod_config" {
        for_each = agents.value.in_cluster_pod_config
        content {
          host_net = in_cluster_pod_config.value["host_net"]
          dynamic "node_selector" {
            for_each = in_cluster_pod_config.value["node_selector"]
            content {
              name  = node_selector.value["name"]
              value = node_selector.value["value"]
            }
          }
          dynamic "tolerations" {
            for_each = in_cluster_pod_config.value["tolerations"]
            content {
              effect   = tolerations.value["effect"]
              key      = tolerations.value["key"]
              operator = tolerations.value["operator"]
            }
          }
        }
      }
      not_install_basic_scrape = agents.value["not_install_basic_scrape"]
      not_scrape               = agents.value["not_scrape"]
    }
  }
  instance_id = var.instance_id
}

resource "tencentcloud_monitor_tmp_tke_config" "this" {
  count = var.create_tke_config ? 1 : 0

  cluster_id   = var.cluster_id
  cluster_type = var.cluster_type
  instance_id  = var.instance_id
  dynamic "pod_monitors" {
    for_each = var.pod_monitors
    content {
      config      = pod_monitors.value["config"]
      name        = pod_monitors.value["name"]
      template_id = pod_monitors.value["template_id"]
    }
  }



  dynamic "raw_jobs" {
    for_each = var.raw_jobs
    content {
      config      = raw_jobs.value["config"]
      name        = raw_jobs.value["name"]
      template_id = raw_jobs.value["template_id"]
    }
  }


  dynamic "service_monitors" {
    for_each = var.service_monitors
    content {
      config      = service_monitors.value["config"]
      name        = service_monitors.value["name"]
      template_id = service_monitors.value["template_id"]
    }
  }
}


resource "tencentcloud_monitor_tmp_tke_global_notification" "this" {
  count = var.create_tke_global_notification ? 1 : 0

  instance_id = var.instance_id
  dynamic "notification" {
    for_each = var.notification
    content {
      enabled = notification.value["enabled"]
      type    = notification.value["type"]
      dynamic "alert_manager" {
        for_each = notification.value.alert_manager
        content {
          url          = alert_manager.value["url"]
          cluster_id   = alert_manager.value["cluster_id"]
          cluster_type = alert_manager.value["cluster_type"]
        }
      }
      notify_way            = notification.value["notify_way"]
      phone_arrive_notice   = notification.value["phone_arrive_notice"]
      phone_circle_interval = notification.value["phone_circle_interval"]
      phone_circle_times    = notification.value["phone_circle_times"]
      phone_inner_interval  = notification.value["phone_inner_interval"]
      phone_notify_order    = notification.value["phone_notify_order"]
      receiver_groups       = notification.value["receiver_groups"]
      repeat_interval       = notification.value["repeat_interval"]
      time_range_end        = notification.value["time_range_end"]
      time_range_start      = notification.value["time_range_start"]
      web_hook              = notification.value["web_hook"]
    }
  }
}

resource "tencentcloud_monitor_tmp_tke_record_rule_yaml" "this" {
  count       = var.create_tke_record_rule_yaml ? 1 : 0
  content     = var.content
  instance_id = var.instance_id
}


resource "tencentcloud_monitor_tmp_tke_template" "this" {
  count = var.create_tke_template ? 1 : 0

  dynamic "template" {
    for_each = var.template
    content {
      level      = template.value["level"]
      name       = template.value["name"]
      describe   = template.value["describe"]
      is_default = template.value["is_default"]
      dynamic "pod_monitors" {
        for_each = template.value.pod_monitors
        content {
          config      = pod_monitors.value["config"]
          name        = pod_monitors.value["name"]
          template_id = pod_monitors.value["template_id"]
        }
      }
      dynamic "raw_jobs" {
        for_each = template.value.raw_jobs
        content {
          config      = raw_jobs.value["config"]
          name        = raw_jobs.value["name"]
          template_id = raw_jobs.value["template_id"]
        }
      }
      dynamic "record_rules" {
        for_each = template.value.record_rules
        content {
          config      = record_rules.value["config"]
          name        = record_rules.value["name"]
          template_id = record_rules.value["template_id"]
        }
      }
      dynamic "service_monitors" {
        for_each = template.value.service_monitors
        content {
          config      = service_monitors.value["config"]
          name        = service_monitors.value["name"]
          template_id = service_monitors.value["template_id"]
        }
      }
      template_id = template.value["template_id"]
      update_time = template.value["update_time"]
      version     = template.value["version"]
    }
  }
}


resource "tencentcloud_monitor_tmp_tke_template_attachment" "this" {
  count = var.create_tke_template_attachment ? 1 : 0
  dynamic "targets" {
    for_each = var.targets
    content {
      instance_id   = targets.value["instance_id"]
      region        = targets.value["region"]
      cluster_id    = targets.value["cluster_id"]
      cluster_name  = targets.value["cluster_name"]
      cluster_type  = targets.value["cluster_type"]
      instance_name = targets.value["instance_name"]
      sync_time     = targets.value["sync_time"]
      version       = targets.value["version"]
    }
  }
  template_id = var.template_id
}


