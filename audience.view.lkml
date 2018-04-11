include: "/app_marketing_analytics_adapter/audience.view"
include: "date_base.view"
include: "google_adwords_base.view"

view: audience {
  extends: [date_base, google_adwords_base, audience_adapter]

  dimension: ad_group_id {
    sql: ${TABLE}.AdGroupId ;;
    hidden:  yes
  }

  dimension: base_ad_group_id {
    sql: ${TABLE}.BaseAdGroupId ;;
    hidden:  yes
  }

  dimension: base_campaign_id {
    sql: ${TABLE}.BaseCampaignId ;;
    hidden:  yes
  }

  dimension: bid_modifier {
    type: number
    sql: ${TABLE}.BidModifier ;;
  }

  dimension: bid_type {
    type: string
    sql: ${TABLE}.BidType ;;
  }

  dimension: campaign_id {
    sql: ${TABLE}.CampaignId ;;
    hidden:  yes
  }

  dimension: cpc_bid {
    type: string
    sql: ${TABLE}.CpcBid ;;
  }

  dimension: cpc_bid_source {
    type: string
    sql: ${TABLE}.CpcBidSource ;;
  }

  dimension: cpm_bid {
    type: number
    sql: ${TABLE}.CpmBid ;;
  }

  dimension: cpm_bid_source {
    type: string
    sql: ${TABLE}.CpmBidSource ;;
  }

  dimension: criteria {
    type: string
    sql: ${TABLE}.Criteria ;;
  }

  dimension: criteria_destination_url {
    type: string
    sql: ${TABLE}.CriteriaDestinationUrl ;;
  }

  dimension: criterion_id {
    sql: ${TABLE}.CriterionId ;;
    hidden:  yes
  }

  dimension: final_app_urls {
    type: string
    sql: ${TABLE}.FinalAppUrls ;;
  }

  dimension: final_mobile_urls {
    type: string
    sql: ${TABLE}.FinalMobileUrls ;;
  }

  dimension: final_urls {
    type: string
    sql: ${TABLE}.FinalUrls ;;
  }

  dimension: is_negative {
    type: yesno
    sql: ${TABLE}.IsNegative ;;
  }

  dimension: is_restrict {
    type: yesno
    sql: ${TABLE}.IsRestrict ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.Status ;;
  }

  dimension: tracking_url_template {
    type: string
    sql: ${TABLE}.TrackingUrlTemplate ;;
  }

  dimension: url_custom_parameters {
    type: string
    sql: ${TABLE}.UrlCustomParameters ;;
  }

  dimension: user_list_name {
    type: string
    sql: ${TABLE}.UserListName ;;
  }

  measure: count {
    type: count_distinct
    sql:  ${criterion_id} ;;
    drill_fields: [detail*]
  }

  # ----- Detail ------
  set: detail {
    fields: [criteria]
  }
}
