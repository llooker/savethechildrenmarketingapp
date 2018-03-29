include: "ad.view.lkml"
include: "keyword.view.lkml"

explore: ad_status {
  hidden: yes
}
view: ad_status {
  derived_table: {
    explore_source: ad {
      column: _date {}
      column: external_customer_id {}
      column: campaign_id {}
      column: ad_group_id {}
      column: creative_id {}
      column: status {}
      derived_column: status_lag {
        sql: LAG(status, 1, "Not Present") OVER (PARTITION BY external_customer_id, campaign_id, ad_group_id, creative_id ORDER BY _date ASC) ;;
      }
    }
  }
  dimension: _date {}
  dimension: external_customer_id {}
  dimension: campaign_id {}
  dimension: ad_group_id {}
  dimension: creative_id {}
  dimension: status {}
  dimension: status_lag {}
  dimension: status_changed {
    type: yesno
    sql: ${status} != ${status_lag} ;;
  }
}

explore: keyword_status {
  hidden: yes
}
view: keyword_status {
  derived_table: {
    explore_source: keyword {
      column: _date {}
      column: external_customer_id {}
      column: campaign_id {}
      column: ad_group_id {}
      column: criterion_id {}
      column: status {}
      derived_column: status_lag {
        sql: LAG(status, 1, "Not Present") OVER (PARTITION BY external_customer_id, campaign_id, ad_group_id, criterion_id ORDER BY _date ASC) ;;
      }
    }
  }
  dimension: _date {}
  dimension: external_customer_id {}
  dimension: campaign_id {}
  dimension: ad_group_id {}
  dimension: criterion_id {}
  dimension: status {}
  dimension: status_lag {}
  dimension: status_changed {
    type: yesno
    sql: ${status} != ${status_lag} ;;
  }
}

explore: ad_group_status {
  hidden: yes
}
view: ad_group_status {
  derived_table: {
    explore_source: ad_group {
      column: _date {}
      column: external_customer_id {}
      column: campaign_id {}
      column: ad_group_id {}
      column: status { field: ad_group.ad_group_status }
      derived_column: status_lag {
        sql: LAG(status, 1, "Not Present") OVER (PARTITION BY external_customer_id, campaign_id, ad_group_id ORDER BY _date ASC) ;;
      }
    }
  }
  dimension: _date {}
  dimension: external_customer_id {}
  dimension: campaign_id {}
  dimension: ad_group_id {}
  dimension: status {}
  dimension: status_lag {}
  dimension: status_changed {
    type: yesno
    sql: ${status} != ${status_lag} ;;
  }
}

explore: campaign_status {
  hidden: yes
}
view: campaign_status {
  derived_table: {
    explore_source: campaign {
      column: _date {}
      column: external_customer_id {}
      column: campaign_id {}
      column: status { field: campaign.campaign_status }
      derived_column: status_lag {
        sql: LAG(status, 1, "Not Present") OVER (PARTITION BY external_customer_id, campaign_id ORDER BY _date ASC) ;;
      }
    }
  }
  dimension: _date {}
  dimension: external_customer_id {}
  dimension: campaign_id {}
  dimension: status {}
  dimension: status_lag {}
  dimension: status_changed {
    type: yesno
    sql: ${status} != ${status_lag} ;;
  }
}


view: status_changes {
  derived_table: {
    sql:
    SELECT
      ad_status._date AS _date,
      ad_status.external_customer_id AS external_customer_id,
      ad_status.campaign_id AS campaign_id,
      ad_status.ad_group_id AS ad_group_id,
      ad_status.creative_id AS creative_id,
      null AS criterion_id,
      ad_status.status AS status,
      ad_status.status_lag AS status_lag
    FROM ${ad_status.SQL_TABLE_NAME} as ad_status
    WHERE
      ad_status.status != ad_status.status_lag
    UNION ALL
    SELECT
      keyword_status._date AS _date,
      keyword_status.external_customer_id AS external_customer_id,
      keyword_status.campaign_id AS campaign_id,
      keyword_status.ad_group_id AS ad_group_id,
      null AS creative_id,
      keyword_status.criterion_id AS criterion_id,
      keyword_status.status AS status,
      keyword_status.status_lag AS status_lag
    FROM ${keyword_status.SQL_TABLE_NAME} as keyword_status
    WHERE
      keyword_status.status != keyword_status.status_lag
    UNION ALL
    SELECT
      ad_group_status._date AS _date,
      ad_group_status.external_customer_id AS external_customer_id,
      ad_group_status.campaign_id AS campaign_id,
      ad_group_status.ad_group_id AS ad_group_id,
      null AS creative_id,
      null AS criterion_id,
      ad_group_status.status AS status,
      ad_group_status.status_lag AS status_lag
    FROM ${ad_group_status.SQL_TABLE_NAME} as ad_group_status
    WHERE
      ad_group_status.status != ad_group_status.status_lag
    UNION ALL
    SELECT
      campaign_status._date AS _date,
      campaign_status.external_customer_id AS external_customer_id,
      campaign_status.campaign_id AS campaign_id,
      null AS ad_group_id,
      null AS creative_id,
      null AS criterion_id,
      campaign_status.status AS status,
      campaign_status.status_lag AS status_lag
    FROM ${campaign_status.SQL_TABLE_NAME} as campaign_status
    WHERE
      campaign_status.status != campaign_status.status_lag
    ;;
  }

  dimension: external_customer_id {
    type: number
    hidden: yes
  }

  dimension: campaign_id {
    type: number
    hidden: yes
  }

  dimension: ad_group_id {
    type: number
    hidden: yes
  }

  dimension: creative_id {
    type: number
    hidden: yes
  }

  dimension: criterion_id {
    type: number
    hidden: yes
  }

  dimension: status_lag {
    hidden: yes
  }

  dimension: status {
    hidden: yes
  }

  dimension: change_type {
    type: string
    case: {
      when: {
        sql: ${status_lag} = "Not Present" ;;
        label: "Addition"
      }
      else: "Status Change"
    }
  }

  dimension: status_display {
    label: "Status Update"
    type: string
    case: {
      when: {
        sql: ${status} = 'Status_Enabled' OR ${status} = "ENABLED" OR ${status} = "Status_Active" AND ${change_type} = 'Status Change';;
        label: "Re-enabled"
      }
      when: {
        sql: ${status} = 'Status_Enabled' OR ${status} = "ENABLED" OR ${status} = "Status_Active" AND ${change_type} = 'Addition';;
        label: "Enabled"
      }
      else: "Disabled"
    }
  }

  dimension_group: change {
    type: time
    sql: ${TABLE}._date ;;
    timeframes: [date, week, month, day_of_week, day_of_month]
  }

  dimension: content_type {
    type: string
    case: {
      when: {
        sql: ${creative_id} IS NOT NULL ;;
        label: "Ad"
      }
      when: {
        sql: ${criterion_id} IS NOT NULL ;;
        label: "Keyword"
      }
      when: {
        sql: ${ad_group_id} IS NOT NULL ;;
        label: "Ad Group"
      }
      when: {
        sql: ${campaign_id} IS NOT NULL ;;
        label: "Campaign"
      }
      else: "Other"
    }
  }

  dimension: current_day_of_month {
    hidden: yes
    type:  number
    sql: EXTRACT(DAY FROM TIMESTAMP(CURRENT_DATE())) ;;
  }

  dimension: less_than_current_day_of_month {
    sql: ${change_day_of_month} <= ${current_day_of_month} ;;
    type:  yesno
  }

  measure: count {
    type: count_distinct
    sql: COALESCE(${creative_id}, ${ad_group_id}, ${campaign_id}, ${criterion_id}) ;;
    description: "The number of Ads, Ad Groups, Keywords and Campaigns that changed status"
    html:  {% if (status_changes.content_type._value == 'Ad') %}
    <a href= "/explore/looker_app_google_adwords/status_changes?fields=ad.creative,status_changes.change_date, status_changes.status_display&f[status_changes.change_date]={{_filters['status_changes.change_date']}}"> {{value}}  </a>
    {% elsif (status_changes.content_type._value == 'Keyword') %}
    <a href= "/explore/looker_app_google_adwords/status_changes?fields=keyword.criteria,status_changes.change_date, status_changes.status_display&f[status_changes.change_date]={{_filters['status_changes.change_date']}}"> {{value}} </a>
     {% elsif (status_changes.content_type._value == 'Ad Group') %}
    <a href= "/explore/looker_app_google_adwords/status_changes?fields=ad_group.ad_group_name,status_changes.change_date, status_changes.status_display&f[status_changes.change_date]={{_filters['status_changes.change_date']}}"> {{value}}  </a>
    {% elsif (status_changes.content_type._value == 'Campaign') %}
    <a href= "/explore/looker_app_google_adwords/status_changes?fields=campaign.campaign_name,status_changes.change_date, status_changes.status_display&f[status_changes.change_date]={{_filters['status_changes.change_date']}}"> {{value}}  </a>
    {% endif %} ;;
  }
}
