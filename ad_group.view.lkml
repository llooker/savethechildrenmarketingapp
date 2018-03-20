include: "campaign.view"
include: "customer.view"
include: "date_base.view"
include: "google_adwords_base.view"

explore: ad_group {
  hidden: yes
  join: campaign {
    view_label: "Campaign"
    sql_on: ${ad_group.campaign_id} = ${campaign.campaign_id} AND
      ${ad_group.date_date} = ${campaign.date_date};;
    relationship: many_to_one
  }
  join: customer {
    view_label: "Customer"
    sql_on: ${ad_group.external_customer_id} = ${customer.external_customer_id} AND
      ${ad_group.date_date} = ${customer.date_date} ;;
    relationship: many_to_one
  }
}

view: ad_group {
  extends: [date_base, google_adwords_base]
  sql_table_name: {{ _user_attributes["google_adwords_schema"] }}.AdGroup_{{ _user_attributes["google_adwords_customer_id"] }} ;;

  dimension: ad_group_desktop_bid_modifier {
    type: number
    sql: ${TABLE}.AdGroupDesktopBidModifier ;;
    hidden: yes
  }

  dimension: ad_group_id {
    primary_key: yes
    sql: ${TABLE}.AdGroupId ;;
    hidden: yes
  }

  dimension: ad_group_mobile_bid_modifier {
    type: number
    sql: ${TABLE}.AdGroupMobileBidModifier ;;
    hidden: yes
  }

  dimension: ad_group_name {
    type: string
    sql: ${TABLE}.AdGroupName ;;
    link: {
      label: "Ad Group Dashboard"
      url: "/dashboards/looker_app_google_adwords::ad_performance?Ad%20Group%20Name={{ value | encode_uri }}&Campaign%20Name={{ campaign.campaign_name._value | encode_uri }}"
      icon_url: "http://www.looker.com/favicon.ico"
    }
    link: {
      label: "View on Adwords"
      icon_url: "https://www.google.com/s2/favicons?domain=www.adwords.google.com"
      url: "https://adwords.google.com/aw/ads?campaignId={{ campaign_id._value }}&adGroupId={{ ad_group_id._value }}"
    }
    link: {
      label: "Pause Ad Group"
      icon_url: "https://www.google.com/s2/favicons?domain=www.adwords.google.com"
      url: "https://adwords.google.com/aw/ads?campaignId={{ campaign_id._value }}&adGroupId={{ ad_group_id._value }}"
    }
    link: {
      url: "https://adwords.google.com/aw/ads?campaignId={{ campaign_id._value }}&adGroupId={{ ad_group_id._value }}"
      icon_url: "https://www.gstatic.com/awn/awsm/brt/awn_awsm_20171108_RC00/aw_blend/favicon.ico"
      label: "Change Bid"
    }
    required_fields: [campaign.campaign_name]
  }

  dimension: ad_group_status {
    type: string
    sql: ${TABLE}.AdGroupStatus ;;
  }

  dimension: ad_group_tablet_bid_modifier {
    type: number
    sql: ${TABLE}.AdGroupTabletBidModifier ;;
    hidden: yes
  }

  dimension: bid_type {
    type: string
    sql: ${TABLE}.BidType ;;
  }

  dimension: bidding_strategy_id {
    sql: ${TABLE}.BiddingStrategyId ;;
    hidden: yes
  }

  dimension: bidding_strategy_name {
    type: string
    sql: ${TABLE}.BiddingStrategyName ;;
  }

  dimension: bidding_strategy_source {
    type: string
    sql: ${TABLE}.BiddingStrategySource ;;
  }

  dimension: bidding_strategy_type {
    type: string
    sql: ${TABLE}.BiddingStrategyType ;;
  }

  dimension: campaign_id {
    sql: ${TABLE}.CampaignId ;;
    hidden: yes
  }

  dimension: content_bid_criterion_type_group {
    type: string
    sql: ${TABLE}.ContentBidCriterionTypeGroup ;;
    hidden: yes
  }

  dimension: cpc_bid {
    type: string
    sql: (${TABLE}.CpcBid / 1000000) ;;
  }

  dimension: cpm_bid {
    type: number
    sql: (${TABLE}.CpmBid / 1000000) ;;
  }

  dimension: cpv_bid {
    type: string
    sql: (${TABLE}.CpvBid / 1000000) ;;
  }

  dimension: enhanced_cpc_enabled {
    type: yesno
    sql: ${TABLE}.EnhancedCpcEnabled ;;
    hidden: yes
  }

  dimension: enhanced_cpv_enabled {
    type: yesno
    sql: ${TABLE}.EnhancedCpvEnabled ;;
    hidden: yes
  }

  dimension: label_ids {
    type: string
    sql: ${TABLE}.LabelIds ;;
    hidden: yes
  }

  dimension: labels {
    type: string
    sql: ${TABLE}.Labels ;;
  }

  dimension: target_cpa {
    type: number
    sql: (${TABLE}.TargetCpa / 1000000) ;;
  }

  dimension: target_cpa_bid_source {
    type: string
    sql: ${TABLE}.TargetCpaBidSource ;;
  }

  dimension: tracking_url_template {
    type: string
    sql: ${TABLE}.TrackingUrlTemplate ;;
    hidden: yes
  }

  dimension: url_custom_parameters {
    type: string
    sql: ${TABLE}.UrlCustomParameters ;;
    hidden: yes
  }

  measure: count {
    type: count_distinct
    sql: ${ad_group_id} ;;
    drill_fields: [detail*]
  }

  # ----- Detail ------
  set: detail {
    fields: [ad_group_id, ad_group_name, ad_group_status, cpc_bid, ad.count, keyword.count]
  }
}
