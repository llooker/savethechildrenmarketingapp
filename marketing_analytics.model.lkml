connection: "looker_app"
label: "Marketing Analytics"

# include all the views
include: "account_fact.view"
include: "ad_impressions.view"
include: "ad_fact.view"
include: "ad_group_fact.view"
include: "campaign_budget_date_fact.view"
include: "campaign_fact.view"
include: "keyword_fact.view"
include: "period_fact.view"
include: "recent_changes.view"

include: "combined_ad_impressions.view"
include: "combined_ad_group_fact.view"

# include all the dashboards
include: "adwords_activity.dashboard"
include: "adwords_overview.dashboard"
include: "campaign_metrics_base.dashboard"
include: "campaign_metrics_conversion_rate.dashboard"
include: "campaign_metrics_conversions.dashboard"
include: "campaign_metrics_cpa.dashboard"
include: "campaign_metrics_cpc.dashboard"
include: "campaign_metrics_ctr.dashboard"
include: "campaign_metrics_spend.dashboard"
include: "combined_overview.dashboard"
include: "campaign_metrics_roas.dashboard"

# include all fb views
include: "fb_*.view"
# include all fb dashboards
include: "fb_*.dashboard"

datagroup: etl_datagroup {
  sql_trigger: SELECT MAX(CONCAT(CAST(_DATA_DATE as STRING), format(" %02d", HourOfDay))) FROM adwords_v201609.HourlyAccountStats_6747157124 ;;
  max_cache_age: "24 hours"
}

persist_with: etl_datagroup