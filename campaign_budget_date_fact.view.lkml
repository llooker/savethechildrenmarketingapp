include: "campaign.view"
include: "date_base.view"
include: "period_base.view"

explore: campaign_budget_date_fact {
  hidden: yes
  label: "Campaign Budget Date Fact"
  view_label: "Campaign Budget Date Fact"
  from: campaign_budget_date_fact
  view_name: fact
  join: customer {
    view_label: "Customer"
    sql_on: ${fact.external_customer_id} = ${customer.external_customer_id} AND
      ${fact.date_date} = ${customer.date_date} ;;
    relationship: many_to_one
  }
  join: campaign {
    view_label: "Campaign"
    sql_on: ${fact.campaign_id} = ${campaign.campaign_id} AND
      ${fact.date_date} = ${campaign.date_date} ;;
    relationship: many_to_one
  }
}

view: campaign_budget_date_fact {
  extends: [date_base, period_base]
  derived_table: {
    datagroup_trigger: etl_datagroup
    explore_source: ad_impressions {
      column: campaign_id { field: fact.campaign_id }
      column: budget_id { field: campaign.budget_id }
      column: _date { field: fact.date_date}
      column: external_customer_id { field: fact.external_customer_id }
      column: amount { field: campaign.total_amount }
      column: cost { field: fact.total_cost }
    }
  }
  dimension: campaign_id {
  }
  dimension: external_customer_id {
  }
  dimension: _date {
    hidden: yes
    type: date_raw
  }
  dimension: budget_id {}
  dimension: amount {}
  dimension: cost {}
  dimension: remaining_budget {
    type: number
    sql: ${amount} - ${cost} ;;
    value_format_name: usd_0
  }
  dimension: percent_remaining_budget {
    type: number
    sql: ${remaining_budget} / NULLIF(${amount},0) ;;
    value_format_name: percent_2
  }
  dimension: percent_used_budget {
    type: number
    sql: COALESCE(1 - ${percent_remaining_budget}, 0) ;;
    value_format_name: percent_2
  }
  dimension: percent_used_budget_tier {
    type: tier
    tiers: [0, 0.2, 0.4, 0.6, 0.8, 1]
    style: interval
    sql: ${percent_used_budget} ;;
    value_format_name: percent_2
  }
  dimension: constrained_budget {
    type: yesno
    description: "Daily spend within 20% of campaign budget"
    sql:  ${percent_remaining_budget} <= .2 ;;
  }
  measure: total_amount {
    type: sum
    sql: ${amount} ;;
    value_format_name: usd_0
  }
  measure: total_cost {
    type: sum
    sql: ${cost} ;;
    value_format_name: usd_0
  }
  measure: count_constrained_budget_days {
    type: count_distinct
    description: "Days with daily spend within 20% of campaign budget"
    sql:  CONCAT(CAST(${date_raw} as STRING), CAST(${budget_id} as STRING))  ;;
    filters: {
      field: constrained_budget
      value: "yes"
    }
  }
}
