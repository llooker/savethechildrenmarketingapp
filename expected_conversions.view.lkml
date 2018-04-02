include: "ad_impressions.view"

view: expected_conversions_base {

  dimension: clicks {
    type: number
    hidden: yes
  }
  dimension: conversions {
    type: number
    hidden: yes
  }
  dimension: cost {
    type: number
    hidden: yes
  }
  dimension: impressions {
    type: number
    hidden: yes
  }
  measure: total_impressions {
    type: sum
    sql: ${impressions} ;;
    drill_fields: [total_impressions]
    hidden: yes
  }
  measure: total_clicks {
    type: sum
    sql: ${clicks} ;;
    drill_fields: [total_clicks]
    hidden: yes
  }
  measure: total_conversions {
    type: sum
    sql: ${conversions} ;;
    drill_fields: [total_conversions]
    hidden: yes
  }
  measure: total_cost {
    type: sum
    sql: ${cost} ;;
    drill_fields: [total_cost]
    hidden: yes
  }
}
view: account_avg_cpa {
  extends: [expected_conversions_base]

  derived_table: {
    explore_source: ad_impressions {
      column: external_customer_id {}
      column: cost { field: ad_impressions.total_cost }
      column: clicks { field: ad_impressions.total_clicks }
      column: conversions { field: ad_impressions.total_conversions }
      column: impressions { field: ad_impressions.total_impressions }
    bind_filters: {
      to_field: ad_impressions.date_date
      from_field: ad_impressions.date_date
    }
  }
  }

  dimension: external_customer_id {
    primary_key: yes
    hidden: yes
  }

  measure: average_cpa_of_the_account {
    label: "Average Cost Per Conversion of the account"
    description: "Average Cost Per Conversion of the whole account for all time"
    view_label: "Ad Stats"
    hidden: yes
    type: number
    sql: ${total_cost} / NULLIF(${total_conversions},0);;
    value_format_name: usd
  }

  measure: expected_conversions_for_campaign {
    label: "Expected Conversions"
    view_label: "Campaign"
    description: "Cost divided by average Cost Per Conversion for the account"
    type: number
    sql: ${ad_impressions.total_cost} / NULLIF(${average_cpa_of_the_account},0) ;;
    value_format_name: decimal_2
  }
}

view: campaign_avg_cpa {
  extends: [expected_conversions_base]

  derived_table: {
    explore_source: ad_impressions {
      column: external_customer_id {}
      column: campaign_id {}
      column: cost { field: ad_impressions.total_cost }
      column: clicks { field: ad_impressions.total_clicks }
      column: conversions { field: ad_impressions.total_conversions }
      column: impressions { field: ad_impressions.total_impressions }
      bind_filters: {
        to_field: ad_impressions.date_date
        from_field: ad_impressions.date_date
      }
    }
  }

  dimension: id {
    sql: CONCAT(${TABLE}.external_customer_id, ${TABLE}.campaign_id) ;;
    primary_key: yes
    hidden: yes
  }
  dimension: external_customer_id {
    hidden: yes
  }
  dimension: campaign_id {
    hidden: yes
  }

  measure: average_cpa_of_campaign {
    label: "Average Cost Per Conversion of the campaign"
    description: "Average Cost Per Conversion for the campaign"
    view_label: "Ad Groups"
    hidden: yes
    type: number
    sql: ${total_cost} / NULLIF(${total_conversions},0);;
    value_format_name: usd
  }

  measure: average_ctr_of_campaign {
    label: "Average CTR of the campaign"
    description: "Average Click Through Rate for the campaign"
    view_label: "Ad Groups"
    hidden: yes
    type: number
    sql: ${total_clicks} / NULLIF(${total_impressions},0);;
    value_format_name: usd
  }

  measure: cpa_compared_to_average_for_campaign {
    label: "% of Campaign Cost Per Conversion"
    description: "Cost Per Conversion compared to Average Cost Per Conversion of the campaign"
    view_label: "Ad Groups"
    type: number
    sql: ${ad_impressions.average_cost_per_conversion} / NULLIF(${average_cpa_of_campaign},0);;
    value_format_name: percent_0
  }

  measure: ctr_compared_to_average_for_campaign {
    description: "CTR compared to Average CTR of the campaign"
    label: "% of Campaign CTR"
    view_label: "Ad Groups"
    type: number
    sql: ${ad_impressions.average_click_rate} / NULLIF(${average_ctr_of_campaign},0);;
    value_format_name: percent_0
  }

  measure: expected_conversions_for_ad_group {
    label: "Expected Conversions"
    view_label: "Ad Groups"
    description: "Cost divided by average Cost Per Conversion of the campaign"
    type: number
    sql: ${ad_impressions.total_cost} / NULLIF(${campaign_avg_cpa.average_cpa_of_campaign},0) ;;
    value_format_name: decimal_2
  }
}

view: ad_group_avg_cpa {
  extends: [expected_conversions_base]

  derived_table: {
    explore_source: ad_impressions {
      column: external_customer_id {}
      column: campaign_id {}
      column: ad_group_id {}
      column: cost { field: ad_impressions.total_cost }
      column: clicks { field: ad_impressions.total_clicks }
      column: conversions { field: ad_impressions.total_conversions }
      column: impressions { field: ad_impressions.total_impressions }
    bind_filters: {
      to_field: ad_impressions.date_date
      from_field: ad_impressions.date_date
    }
  }}

  dimension: id {
    sql: CONCAT(${TABLE}.external_customer_id, ${TABLE}.campaign_id, ${TABLE}.ad_group_id) ;;
    primary_key: yes
    hidden: yes
  }
  dimension: external_customer_id {
    hidden: yes
  }
  dimension: ad_group_id {
    hidden: yes
  }
  dimension: campaign_id {
    hidden: yes
  }

  measure: average_conversion_rate {
    description: "Average Conversion Rate of the ad group"
    label: "Average Conversion Rate of the Ad Group"
    view_label: "Keywords"
    hidden: yes
    type: number
    sql: ${total_conversions} / NULLIF(${total_clicks},0);;
    value_format_name: percent_2
  }

  measure: average_cpa_of_ad_group {
    description: "Average Cost Per Conversion of the ad group"
    label: "Average Cost Per Conversion of the Ad Group"
    view_label: "Ads"
    hidden: yes
    type: number
    sql: ${total_cost} / NULLIF(${total_conversions},0);;
    value_format_name: usd
  }

  measure: average_ctr_of_ad_group {
    description: "Average CTR of the ad group"
    label: "Average Click Through Rate of the Ad Group"
    view_label: "Ads"
    type: number
    hidden: yes
    sql: ${total_clicks} / NULLIF(${total_impressions},0);;
    value_format_name: percent_2
  }

  measure: cpa_compared_to_average_for_ad_group {
    description: "Cost Per Conversion compared to Average CPA of the ad group"
    label: "% of Ad Group Cost Per Conversion"
    view_label: "Ads"
    type: number
    sql: ${ad_impressions.average_cost_per_conversion} / NULLIF(${average_cpa_of_ad_group},0);;
    value_format_name: percent_0
  }

  measure: ctr_compared_to_average_for_ad_group {
    description: "CTR compared to Average CTR of the ad group"
    label: "% of Ad Group CTR"
    view_label: "Ads"
    type: number
    sql: ${ad_impressions.average_click_rate} / NULLIF(${average_ctr_of_ad_group},0);;
    value_format_name: percent_0
  }

  measure: expected_conversions_for_ad {
    label: "Expected Conversions"
    view_label: "Ads"
    description: "Cost divided by average CPA of the Ad Group"
    type: number
    sql: ${ad_impressions.total_cost} / NULLIF(${ad_group_avg_cpa.average_cpa_of_ad_group},0) ;;
    value_format_name: decimal_2
  }

    measure: expected_conversions_for_keyword {
      label: "Expected Conversions"
      view_label: "Keyword"
      description: "Cost divided by average CPA of the Ad Group"
      type: number
      sql: ${ad_impressions.total_cost} / NULLIF(${ad_group_avg_cpa.average_cpa_of_ad_group},0) ;;
      value_format_name: decimal_2
    }

    measure: cpa_compared_to_average_for_ad_group_keyword {
      description: "Cost Per Conversion compared to Average CPA of the ad group"
      label: "% of Ad Group Cost Per Conversion"
      view_label: "Keyword"
      type: number
      sql: ${ad_impressions.average_cost_per_conversion} / NULLIF(${average_cpa_of_ad_group},0);;
      value_format_name: percent_0
    }

    measure: conversion_rate_compared_to_average_for_ad_group {
      description: "Conversion rate compared to Average Conversions of the ad group"
      label: "% of Ad Group Conversion Rate"
      view_label: "Keyword"
      type: number
      sql: ${ad_impressions.average_conversion_rate} / NULLIF(${average_conversion_rate},0);;
      value_format_name: percent_0
    }
}
