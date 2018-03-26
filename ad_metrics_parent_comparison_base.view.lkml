view: ad_metrics_parent_comparison_base {
  extension: required

  dimension: cost_delta {
    type: number
    sql: IF(${parent_fact.cost} - ${fact.cost} <= 0, NULL, ${parent_fact.cost} - ${fact.cost}) ;;
    group_label: "Parent Comparisons"
  }
  measure: total_cost_delta {
    type: number
    sql: IF(${parent_fact.total_cost} - ${fact.total_cost} <= 0, NULL, ${parent_fact.total_cost} - ${fact.total_cost}) ;;
    group_label: "Parent Comparisons"
  }
  dimension: impressions_delta {
    type: number
    sql: IF(${parent_fact.impressions} - ${fact.impressions} <= 0, NULL, ${parent_fact.impressions} - ${fact.impressions}) ;;
    group_label: "Parent Comparisons"
  }
  measure: total_impressions_delta {
    type: number
    sql: IF(${parent_fact.total_impressions} - ${fact.total_impressions} <= 0, NULL, ${parent_fact.total_impressions} - ${fact.total_impressions}) ;;
    group_label: "Parent Comparisons"
  }
  dimension: clicks_delta {
    type: number
    sql: IF(${parent_fact.clicks} - ${fact.clicks} <= 0, NULL, ${parent_fact.clicks} - ${fact.clicks}) ;;
    group_label: "Parent Comparisons"
  }
  measure: total_clicks_delta {
    type: number
    sql: IF(${parent_fact.total_clicks} - ${fact.total_clicks} <= 0, NULL, ${parent_fact.total_clicks} - ${fact.total_clicks}) ;;
    group_label: "Parent Comparisons"
  }
  dimension: conversions_delta {
    type: number
    sql: IF(${parent_fact.conversions} - ${fact.conversions} <= 0, NULL, ${parent_fact.conversions} - ${fact.conversions}) ;;
    group_label: "Parent Comparisons"
  }
  measure: total_conversions_delta {
    type: number
    sql: IF(${parent_fact.total_conversions} - ${fact.total_conversions} <= 0, NULL, ${parent_fact.total_conversions} - ${fact.total_conversions}) ;;
    group_label: "Parent Comparisons"
  }
  dimension: conversionvalue_delta {
    type: number
    sql: IF(${parent_fact.conversionvalue} - ${fact.conversionvalue} <= 0, NULL, ${parent_fact.conversionvalue} - ${fact.conversionvalue}) ;;
    group_label: "Parent Comparisons"
  }
  measure: total_conversionvalue_delta {
    type: number
    sql: IF(${parent_fact.total_conversionvalue} - ${fact.total_conversionvalue} <= 0, NULL, ${parent_fact.total_conversionvalue} - ${fact.total_conversionvalue}) ;;
    group_label: "Parent Comparisons"
  }
  dimension: click_rate_ratio {
    type: number
    sql: ${fact.click_rate} / NULLIF(${parent_fact.click_rate},0) ;;
    group_label: "Parent Comparisons"
    value_format_name: decimal_2
  }
  measure: average_click_rate_ratio {
    type: number
    sql: ${fact.average_click_rate} / NULLIF(${parent_fact.average_click_rate},0) ;;
    group_label: "Parent Comparisons"
    value_format_name: decimal_2
  }
  dimension: conversion_rate_ratio {
    type: number
    sql: ${fact.conversion_rate} / NULLIF(${parent_fact.conversion_rate},0) ;;
    group_label: "Parent Comparisons"
    value_format_name: decimal_2
  }
  measure: average_conversion_rate_ratio {
    type: number
    sql: ${fact.average_conversion_rate} / NULLIF(${parent_fact.average_conversion_rate},0) ;;
    group_label: "Parent Comparisons"
    value_format_name: decimal_2
  }
  dimension: cost_per_conversion_delta {
    type: number
    sql: ${fact.cost_delta}*1.0 / NULLIF(${fact.conversions_delta},0) ;;
    group_label: "Parent Comparisons"
    value_format_name: usd
  }
  measure: average_cost_per_conversion_delta {
    type: number
    sql: ${fact.total_cost_delta}*1.0 / NULLIF(${fact.total_conversions_delta},0) ;;
    group_label: "Parent Comparisons"
    value_format_name: usd
  }
  dimension: cost_per_click_delta {
    type: number
    sql: ${fact.cost_delta}*1.0 / NULLIF(${fact.clicks_delta},0) ;;
    group_label: "Parent Comparisons"
    value_format_name: usd
  }
  measure: average_cost_per_click_delta {
    type: number
    sql: ${fact.total_cost_delta}*1.0 / NULLIF(${fact.total_clicks_delta},0) ;;
    group_label: "Parent Comparisons"
    value_format_name: usd
    drill_fields: [ad_impressions.date_date, campaign.campaign_name, average_cost_per_click]
  }
  dimension: cost_per_impression_delta {
    type: number
    sql: ${fact.cost_delta}*1.0 / NULLIF(${fact.impressions_delta},0) ;;
    group_label: "Parent Comparisons"
    value_format_name: usd
  }
  measure: average_cost_per_impression_delta {
    type: number
    sql: ${fact.total_cost_delta}*1.0 / NULLIF(${fact.total_impressions_delta},0) ;;
    group_label: "Parent Comparisons"
    value_format_name: usd
  }
  dimension: cost_per_conversion_delta_ratio {
    type: number
    sql: ${fact.cost_per_conversion} / NULLIF(${fact.cost_per_conversion_delta},0) ;;
    group_label: "Parent Comparisons"
    value_format_name: decimal_2
  }
  measure: average_cost_per_conversion_delta_ratio {
    type: number
    sql: ${fact.average_cost_per_conversion} / NULLIF(${fact.average_cost_per_conversion_delta},0) ;;
    group_label: "Parent Comparisons"
    value_format_name: decimal_2
  }
  dimension: cost_per_click_delta_ratio {
    type: number
    sql: ${fact.cost_per_click} / NULLIF(${fact.cost_per_click_delta},0) ;;
    group_label: "Parent Comparisons"
    value_format_name: decimal_2
  }
  measure: average_cost_per_click_delta_ratio {
    type: number
    sql: ${fact.average_cost_per_click} / NULLIF(${fact.average_cost_per_click_delta},0) ;;
    group_label: "Parent Comparisons"
    value_format_name: decimal_2
  }
  dimension: cost_per_impression_delta_ratio {
    type: number
    sql: ${fact.cost_per_impression} / NULLIF(${cost_per_impression_delta},0) ;;
    group_label: "Parent Comparisons"
    value_format_name: decimal_2
  }
  measure: average_cost_per_impression_delta_ratio {
    type: number
    sql: ${fact.average_cost_per_impression} / NULLIF(${average_cost_per_impression_delta},0) ;;
    group_label: "Parent Comparisons"
    value_format_name: decimal_2
  }
  dimension: click_rate_delta {
    type: number
    sql: ${fact.clicks_delta}*1.0/NULLIF(${fact.impressions_delta},0) ;;
    group_label: "Parent Comparisons"
    value_format_name: percent_2
  }
  measure: average_click_rate_delta {
    type: number
    sql: ${fact.total_clicks_delta}*1.0/NULLIF(${fact.total_impressions_delta},0) ;;
    group_label: "Parent Comparisons"
    value_format_name: percent_2
  }
  dimension: conversion_rate_delta {
    type: number
    sql: ${fact.conversions_delta}*1.0/NULLIF(${fact.clicks_delta},0) ;;
    group_label: "Parent Comparisons"
    value_format_name: percent_2
  }
  measure: average_conversion_rate_delta {
    type: number
    sql: ${fact.total_conversions_delta}*1.0/NULLIF(${fact.total_clicks_delta},0) ;;
    group_label: "Parent Comparisons"
    value_format_name: percent_2
  }
  dimension: click_rate_delta_ratio {
    type: number
    sql: ${fact.click_rate} / NULLIF(${click_rate_delta},0) ;;
    group_label: "Parent Comparisons"
    value_format_name: decimal_2
  }
  measure: average_click_rate_delta_ratio {
    type: number
    sql: ${fact.average_click_rate} / NULLIF(${average_click_rate_delta},0) ;;
    group_label: "Parent Comparisons"
    value_format_name: decimal_2
  }
  dimension: conversion_rate_delta_ratio {
    type: number
    sql: ${fact.conversion_rate} / NULLIF(${conversion_rate_delta},0) ;;
    group_label: "Parent Comparisons"
    value_format_name: decimal_2
  }
  measure: average_conversion_rate_delta_ratio {
    type: number
    sql: ${fact.average_conversion_rate} / NULLIF(${average_conversion_rate_delta},0) ;;
    group_label: "Parent Comparisons"
    value_format_name: decimal_2
  }
  dimension: click_rate_z_score {
    type: number
    sql:
    (
      (${fact.click_rate}) -
      (${fact.click_rate_delta})
    ) /
    NULLIF(SQRT(
      ${parent_fact.click_rate}  *
      (1 - ${parent_fact.click_rate}) *
      ((1 / NULLIF(${fact.impressions},0)) + (1 / NULLIF(${fact.impressions_delta},0)))
    ),0) ;;
    group_label: "Parent Comparisons"
    value_format_name: decimal_2
  }
  measure: average_click_rate_z_score {
    type: number
    sql:
    (
      (${fact.average_click_rate}) -
      (${fact.average_click_rate_delta})
    ) /
    NULLIF(SQRT(
      ${parent_fact.average_click_rate}  *
      (1 - ${parent_fact.average_click_rate}) *
      ((1 / NULLIF(${fact.total_impressions},0)) + (1 / NULLIF(${fact.total_impressions_delta},0)))
    ),0) ;;
    group_label: "Parent Comparisons"
    value_format_name: decimal_2
  }
  dimension: click_rate_significant {
    type: yesno
    sql:  (${fact.click_rate_z_score} > 1.96) OR
      (${fact.click_rate_z_score} < -1.96) ;;
    group_label: "Parent Comparisons"
  }
  measure: average_click_rate_significant {
    type: yesno
    sql:  (${fact.average_click_rate_z_score} > 1.96) OR
      (${fact.average_click_rate_z_score} < -1.96) ;;
    group_label: "Parent Comparisons"
  }
  dimension: click_rate_better {
    type: yesno
    sql:  ${fact.click_rate} > ${parent_fact.click_rate} ;;
    group_label: "Parent Comparisons"
  }
  measure: average_click_rate_better {
    type: yesno
    sql:  ${fact.average_click_rate} > ${parent_fact.average_click_rate} ;;
    group_label: "Parent Comparisons"
  }
  dimension: conversion_rate_z_score {
    type: number
    sql:
    (
      (${fact.conversion_rate}) -
      (${fact.conversion_rate_delta})
    ) /
    NULLIF(SQRT(
      ${parent_fact.conversion_rate} *
      (1 - ${parent_fact.conversion_rate}) *
      ((1 / NULLIF(${fact.clicks},0)) + (1 / NULLIF(${fact.clicks_delta},0)))
    ),0) ;;
    group_label: "Parent Comparisons"
    value_format_name: decimal_2
  }
  measure: average_conversion_rate_z_score {
    type: number
    sql:
    (
      (${fact.average_conversion_rate}) -
      (${fact.average_conversion_rate_delta})
    ) /
    NULLIF(SQRT(
      ${parent_fact.average_conversion_rate} *
      (1 - ${parent_fact.average_conversion_rate}) *
      ((1 / NULLIF(${fact.total_clicks},0)) + (1 / NULLIF(${fact.total_clicks_delta},0)))
    ),0) ;;
    group_label: "Parent Comparisons"
    value_format_name: decimal_2
  }
  dimension: conversion_rate_significant {
    type: yesno
    sql:  (${fact.conversion_rate_z_score} > 1.96) OR
      (${fact.conversion_rate_z_score} < -1.96) ;;
    group_label: "Parent Comparisons"
  }
  measure: average_conversion_rate_significant {
    type: yesno
    sql:  (${fact.average_conversion_rate_z_score} > 1.96) OR
      (${fact.average_conversion_rate_z_score} < -1.96) ;;
    group_label: "Parent Comparisons"
  }
  dimension: conversion_rate_better {
    type: yesno
    sql:  ${fact.conversion_rate} > ${parent_fact.conversion_rate} ;;
    group_label: "Parent Comparisons"
  }
  measure: average_conversion_rate_better {
    type: yesno
    sql:  ${fact.average_conversion_rate} > ${parent_fact.average_conversion_rate} ;;
    group_label: "Parent Comparisons"
  }

  measure: cost_per_conversion_count_good {
    type: count_distinct
    sql: ${key_base} ;;
    filters: {
      field: cost_per_conversion_delta_ratio
      value: "<.8"
    }
    filters: {
      field: average_position
      value: ">1"
    }
  }

  measure: conversion_rate_count_good {
    type: count_distinct
    sql: ${key_base} ;;
    filters: {
      field: conversion_rate_better
      value: "Yes"
    }
    filters: {
      field: conversion_rate_significant
      value: "Yes"
    }
  }

  measure: click_rate_count_good {
    type: count_distinct
    sql: ${key_base} ;;
    filters: {
      field: click_rate_better
      value: "Yes"
    }
    filters: {
      field: click_rate_significant
      value: "Yes"
    }
  }

  measure: cost_per_conversion_count_bad {
    type: count_distinct
    sql: ${key_base} ;;
    filters: {
      field: cost_per_conversion_delta_ratio
      value: ">1.2"
    }
  }

  measure: conversion_rate_count_bad {
    type: count_distinct
    sql: ${key_base} ;;
    filters: {
      field: conversion_rate_better
      value: "No"
    }
    filters: {
      field: conversion_rate_significant
      value: "Yes"
    }
  }

  measure: click_rate_count_bad {
    type: count_distinct
    sql: ${key_base} ;;
    filters: {
      field: click_rate_better
      value: "No"
    }
    filters: {
      field: click_rate_significant
      value: "Yes"
    }
  }

  set: ad_metrics_parent_comparison_measures_set {
    fields: [
      total_cost_delta,
      total_clicks_delta,
      total_conversions_delta,
      total_impressions_delta,
      total_conversionvalue_delta,
      average_click_rate_delta,
      average_click_rate_delta_ratio,
      average_click_rate_ratio,
      average_click_rate_z_score,
      average_click_rate_significant,
      average_click_rate_better,
      average_conversion_rate_delta,
      average_conversion_rate_delta_ratio,
      average_conversion_rate_ratio,
      average_conversion_rate_z_score,
      average_conversion_rate_significant,
      average_conversion_rate_better,
      average_cost_per_click_delta,
      average_cost_per_click_delta_ratio,
      average_cost_per_conversion_delta,
      average_cost_per_conversion_delta_ratio,
      average_cost_per_impression_delta,
      average_cost_per_impression_delta_ratio,
      cost_per_conversion_count_good,
      conversion_rate_count_good,
      click_rate_count_good
    ]
  }

}
