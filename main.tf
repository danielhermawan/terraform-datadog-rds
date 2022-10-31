locals {
  monitor_enabled = var.enabled && length(var.recipients) > 0 ? true : false
}

resource "datadog_dashboard" "rds" {
  count = var.enabled ? 1 : 0

  title       = "${var.product_domain} - ${var.rds_name} - ${var.environment} - RDS"
  description = "A generated dashboard for RDS"
  layout_type = "ordered"

  template_variable {
    default = var.rds_name
    name    = "rds_name"
    prefix  = "name"
  }

  template_variable {
    default = var.environment
    name    = "environment"
    prefix  = "environment"
  }

  widget {
    timeseries_definition {
      title = "Bin Log Disk Usage"

      request {
        q            = "avg:aws.rds.bin_log_disk_usage{$rds_name, $environment} by {hostname}"
        display_type = "area"
      }
    }
  }

  widget {
    timeseries_definition {
      title = "Burst Balance"

      request {
        q            = "avg:aws.rds.burst_balance{$rds_name, $environment} by {hostname}"
        display_type = "area"
      }
    }
  }

  widget {
    timeseries_definition {
      title = "CPU Utilization"

      request {
        q            = "avg:aws.rds.cpuutilization{$rds_name, $environment} by {hostname}"
        display_type = "area"
      }
    }
  }

  widget {
    timeseries_definition {
      title = "Database Connections"

      request {
        q            = "avg:aws.rds.database_connections{$rds_name, $environment} by {hostname}"
        display_type = "area"
      }
    }
  }

  widget {
    timeseries_definition {
      title = "Disk Queue Depth"

      request {
        q            = "avg:aws.rds.disk_queue_depth{$rds_name, $environment} by {hostname}"
        display_type = "area"
      }
    }
  }

  widget {
    timeseries_definition {
      title = "Free Storage Space"

      request {
        q            = "avg:aws.rds.free_storage_space{$rds_name, $environment} by {hostname}"
        display_type = "area"
      }
    }
  }

  widget {
    timeseries_definition {
      title = "Freeable Memory"

      request {
        q            = "avg:aws.rds.freeable_memory{$rds_name, $environment} by {hostname}"
        display_type = "area"
      }
    }
  }

  widget {
    timeseries_definition {
      title = "Maximum Used Transaction Ids"

      request {
        q            = "avg:aws.rds.maximum_used_transaction_ids{$rds_name, $environment} by {hostname}"
        display_type = "area"
      }
    }
  }

  widget {
    timeseries_definition {
      title = "Network Receive Throughput"

      request {
        q            = "avg:aws.rds.network_receive_throughput{$rds_name, $environment} by {hostname}"
        display_type = "area"
      }
    }
  }

  widget {
    timeseries_definition {
      title = "Network Transmit Throughput"

      request {
        q            = "avg:aws.rds.network_transmit_throughput{$rds_name, $environment} by {hostname}"
        display_type = "area"
      }
    }
  }

  widget {
    timeseries_definition {
      title = "Oldest Replication Slot Lag"

      request {
        q            = "avg:aws.rds.oldest_replication_slot_lag{$rds_name, $environment} by {hostname}"
        display_type = "area"
      }
    }
  }

  widget {
    timeseries_definition {
      title = "Read IOPS"

      request {
        q            = "avg:aws.rds.read_iops{$rds_name, $environment} by {hostname}"
        display_type = "area"
      }
    }
  }

  widget {
    timeseries_definition {
      title = "Read Latency"

      request {
        q            = "avg:aws.rds.read_latency{$rds_name, $environment} by {hostname}"
        display_type = "area"
      }
    }
  }

  widget {
    timeseries_definition {
      title = "Read Throughput"

      request {
        q            = "avg:aws.rds.read_throughput{$rds_name, $environment} by {hostname}"
        display_type = "area"
      }
    }
  }

  widget {
    timeseries_definition {
      title = "Replica Lag"

      request {
        q            = "avg:aws.rds.replica_lag{$rds_name, $environment} by {hostname}"
        display_type = "area"
      }
    }
  }

  widget {
    timeseries_definition {
      title = "Replication Slot Disk Usage"

      request {
        q            = "avg:aws.rds.replication_slot_disk_usage{$rds_name, $environment} by {hostname}"
        display_type = "area"
      }
    }
  }

  widget {
    timeseries_definition {
      title = "Swap Usage"

      request {
        q            = "avg:aws.rds.swap_usage{$rds_name, $environment} by {hostname}"
        display_type = "area"
      }
    }
  }

  widget {
    timeseries_definition {
      title = "Total Storage Space"

      request {
        q            = "avg:aws.rds.total_storage_space{$rds_name, $environment} by {hostname}"
        display_type = "area"
      }
    }
  }

  widget {
    timeseries_definition {
      title = "Transaction Logs Disk Usage"

      request {
        q            = "avg:aws.rds.transaction_logs_disk_usage{$rds_name, $environment} by {hostname}"
        display_type = "area"
      }
    }
  }

  widget {
    timeseries_definition {
      title = "Transaction Logs Generation"

      request {
        q            = "avg:aws.rds.transaction_logs_generation{$rds_name, $environment} by {hostname}"
        display_type = "area"
      }
    }
  }

  widget {
    timeseries_definition {
      title = "Write IOPS"

      request {
        q            = "avg:aws.rds.write_iops{$rds_name, $environment} by {hostname}"
        display_type = "area"
      }
    }
  }

  widget {
    timeseries_definition {
      title = "Write Latency"

      request {
        q            = "avg:aws.rds.write_latency{$rds_name, $environment} by {hostname}"
        display_type = "area"
      }
    }
  }

  widget {
    timeseries_definition {
      title = "Write Throughtput"

      request {
        q            = "avg:aws.rds.write_throughput{$rds_name, $environment} by {hostname}"
        display_type = "area"
      }
    }
  }

  widget {
    timeseries_definition {
      title = "CPU Credit Balance"

      request {
        q            = "avg:aws.rds.cpucredit_balance{$rds_name,$environment} by {hostname}"
        display_type = "line"
      }
    }
  }
}

module "monitor_cpu_usage" {
  source  = "github.com/traveloka/terraform-datadog-monitor?ref=v0.2.0"
  enabled = local.monitor_enabled

  product_domain = var.product_domain
  service        = var.service
  environment    = var.environment
  tags           = var.tags
  timeboard_id   = join(",", datadog_dashboard.rds.*.id)

  name               = "${var.product_domain} - ${var.rds_name} - ${var.environment} - CPU Usage is High"
  query              = "avg(last_5m):avg:aws.rds.cpuutilization{name:${var.rds_name}, environment:${var.environment}} by {hostname} >= ${var.cpu_usage_thresholds["critical"]}"
  thresholds         = var.cpu_usage_thresholds
  message            = var.cpu_usage_message
  escalation_message = var.cpu_usage_escalation_message

  recipients         = var.recipients
  alert_recipients   = var.alert_recipients
  warning_recipients = var.warning_recipients

  renotify_interval = var.renotify_interval
  notify_audit      = var.notify_audit
}

module "monitor_free_storage_percentage" {
  source  = "github.com/traveloka/terraform-datadog-monitor?ref=v0.2.0"
  enabled = local.monitor_enabled

  product_domain = var.product_domain
  service        = var.service
  environment    = var.environment
  tags           = var.tags
  timeboard_id   = join(",", datadog_dashboard.rds.*.id)

  name               = "${var.product_domain} - ${var.rds_name} - ${var.environment} - Free Storage Percentage is Low"
  query              = "avg(last_1h):avg:aws.rds.free_storage_space{name:${var.rds_name}, environment:${var.environment}} by {hostname} * 100 / avg:aws.rds.total_storage_space{name:${var.rds_name}, environment:${var.environment}} by {hostname} <= ${var.free_storage_percentage_thresholds["critical"]}"
  thresholds         = var.free_storage_percentage_thresholds
  message            = var.free_storage_percentage_message
  escalation_message = var.free_storage_percentage_escalation_message

  recipients         = var.recipients
  alert_recipients   = var.alert_recipients
  warning_recipients = var.warning_recipients

  renotify_interval = var.renotify_interval
  notify_audit      = var.notify_audit
}

module "monitor_db_connection_count" {
  source  = "github.com/traveloka/terraform-datadog-monitor?ref=v0.2.0"
  enabled = local.monitor_enabled

  product_domain = var.product_domain
  service        = var.service
  environment    = var.environment
  tags           = var.tags
  timeboard_id   = join(",", datadog_dashboard.rds.*.id)

  name               = "${var.product_domain} - ${var.rds_name} - ${var.environment} - DB Connection Count is Low"
  query              = "avg(last_5m):avg:aws.rds.database_connections{name:${var.rds_name}, environment:${var.environment}} by {hostname} <= ${var.db_connection_count_thresholds["critical"]}"
  thresholds         = var.db_connection_count_thresholds
  message            = var.db_connection_count_message
  escalation_message = var.db_connection_count_escalation_message

  recipients         = var.recipients
  alert_recipients   = var.alert_recipients
  warning_recipients = var.warning_recipients

  renotify_interval = var.renotify_interval
  notify_audit      = var.notify_audit
}

