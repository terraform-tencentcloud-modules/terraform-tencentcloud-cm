module "tencentcloud_monitor_alarm_notice" {

  source          = "../../"
  name            = "test_alarm_notice_2"
  notice_type     = "ALL"
  notice_language = "zh-CN"

  user_notices {
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
  }

  url_notices {
    url        = "https://www.mytest.com/validate"
    end_time   = 0
    start_time = 1
    weekday    = [1, 2, 3, 4, 5, 6, 7]
  }

}