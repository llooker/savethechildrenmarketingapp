- dashboard: adwords_overview
  title: This Quarter vs Last Quarter
  layout: newspaper
  elements:
  - title: Spend
    name: Spend
    model: google_adwords
    explore: kpis_this_period
    type: single_value
    fields:
    - kpis_last_period.total_cost_last_period
    - kpis_this_period.total_cost_this_period
    limit: 500
    dynamic_fields:
    - table_calculation: change
      label: Change
      expression: "${kpis_this_period.total_cost_this_period} - ${kpis_last_period.total_cost_last_period}"
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    hidden_fields:
    - kpis_last_period.total_cost_last_period
    single_value_title: Spend
    listen:
      This Timeframe: kpis_this_period.this_timeframe
      Last Timeframe: kpis_last_period.last_timeframe
    row: 0
    col: 0
    width: 10
    height: 2
  - title: Conversions
    name: Conversions
    model: google_adwords
    explore: kpis_this_period
    type: single_value
    fields:
    - kpis_last_period.conversions_last_period
    - kpis_this_period.conversions_this_period
    limit: 500
    dynamic_fields:
    - table_calculation: change
      label: Change
      expression: "${kpis_this_period.conversions_this_period} - ${kpis_last_period.conversions_last_period}"
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    hidden_fields:
    - kpis_last_period.conversions_last_period
    single_value_title: ''
    listen:
      This Timeframe: kpis_this_period.this_timeframe
      Last Timeframe: kpis_last_period.last_timeframe
    row: 0
    col: 10
    width: 4
    height: 2
  - title: Cost Per Conversion
    name: Cost Per Conversion
    model: google_adwords
    explore: kpis_this_period
    type: single_value
    fields:
    - kpis_last_period.cost_per_conversion_last_period
    - kpis_this_period.cost_per_conversion_this_period
    limit: 500
    dynamic_fields:
    - table_calculation: change
      label: Change
      expression: "(${kpis_this_period.cost_per_conversion_this_period} - ${kpis_last_period.cost_per_conversion_last_period})/${kpis_last_period.cost_per_conversion_last_period}"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    hidden_fields:
    - kpis_last_period.cost_per_conversion_last_period
    single_value_title: Per Conversion
    listen:
      This Timeframe: kpis_this_period.this_timeframe
      Last Timeframe: kpis_last_period.last_timeframe
    row: 0
    col: 14
    width: 5
    height: 2
  - title: Conversion Rate
    name: Conversion Rate
    model: google_adwords
    explore: kpis_this_period
    type: single_value
    fields:
    - kpis_this_period.avg_conversion_rate_this_period
    - kpis_last_period.avg_conversion_rate_last_period
    limit: 500
    dynamic_fields:
    - table_calculation: change
      label: Change
      expression: "(${kpis_this_period.avg_conversion_rate_this_period} - ${kpis_last_period.avg_conversion_rate_last_period})/${kpis_last_period.avg_conversion_rate_last_period}"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    hidden_fields:
    - kpis_last_period.avg_conversion_rate_last_period
    single_value_title: ''
    listen:
      This Timeframe: kpis_this_period.this_timeframe
      Last Timeframe: kpis_last_period.last_timeframe
    row: 0
    col: 19
    width: 5
    height: 2
  - title: Conversion Trends
    name: Conversion Trends
    model: google_adwords
    explore: master_stats
    type: looker_area
    fields:
    - master_stats._data_week
    - master_stats.total_conversions
    - master_stats.average_cost_per_conversion
    - master_stats.average_conversion_rate
    sorts:
    - master_stats._data_week desc
    limit: 500
    column_limit: 50
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: time
    y_axis_scale_mode: linear
    show_null_points: false
    point_style: none
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    label: Average Cost per Conversion
    ordering: none
    show_null_labels: false
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    barColors:
    - red
    - blue
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    series_types:
      master_stats.average_cost_per_conversion: line
      master_stats.total_impressions: line
      master_stats.total_clicks: line
      master_stats.average_conversion_rate: line
    show_dropoff: true
    y_axes:
    - label: ''
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom:
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: master_stats.average_cost_per_conversion
        name: Cost per Conversion
        __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
        __LINE_NUM: 311
        axisId: master_stats.average_cost_per_conversion
      __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
      __LINE_NUM: 299
    - label:
      maxValue:
      minValue:
      orientation: right
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom:
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: master_stats.total_conversions
        name: Conversions
        axisId: master_stats.total_conversions
        __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
        __LINE_NUM: 330
      __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
      __LINE_NUM: 318
    - label: ''
      maxValue:
      minValue:
      orientation: right
      showLabels: false
      showValues: false
      tickDensity: default
      tickDensityCustom:
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: master_stats.average_conversion_rate
        name: Conversion Rate
        axisId: master_stats.average_conversion_rate
        __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
        __LINE_NUM: 349
      __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
      __LINE_NUM: 337
    discontinuous_nulls: false
    focus_on_hover: false
    reference_lines: []
    trend_lines:
    - color: "#000000"
      label_position: right
      period: 7
      regression_type: linear
      series_index: 1
      show_label: false
      label_type: string
      __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
      __LINE_NUM: 360
    colors:
    - 'palette: Looker Classic'
    series_colors: {}
    hidden_series:
    - master_stats.average_conversion_rate
    series_labels:
      master_stats.total_cost_usd: Spend
      master_stats.total_clicks: Interactions
    hidden_fields: []
    row: 2
    col: 10
    width: 14
    height: 9
  - title: Spend To Date
    name: Spend To Date
    model: google_adwords
    explore: master_stats
    type: looker_area
    fields:
    - master_stats._data_day_of_quarter
    - master_stats._data_quarter
    - master_stats.cumulative_spend
    pivots:
    - master_stats._data_quarter
    filters:
      master_stats._data_quarter: 2 quarters
      master_stats._data_date: 2 quarters
    sorts:
    - master_stats._data_quarter desc
    - master_stats._data_day_of_quarter
    limit: 500
    column_limit: 50
    stacking: ''
    show_value_labels: false
    label_density: 1
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: false
    point_style: none
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    label: Average Cost per Conversion
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    barColors:
    - red
    - blue
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    series_types: {}
    show_dropoff: false
    y_axes:
    - label: ''
      maxValue:
      minValue:
      orientation: left
      showLabels: false
      showValues: false
      tickDensity: default
      tickDensityCustom:
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: master_stats.average_cost_per_conversion
        name: Cost per Conversion
        __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
        __LINE_NUM: 794
        axisId: master_stats.average_cost_per_conversion
      __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
      __LINE_NUM: 782
    - label:
      maxValue:
      minValue:
      orientation: left
      showLabels: false
      showValues: false
      tickDensity: default
      tickDensityCustom:
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: master_stats.total_conversions
        name: Conversions
        axisId: master_stats.total_conversions
        __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
        __LINE_NUM: 813
      __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
      __LINE_NUM: 801
    - label: ''
      maxValue:
      minValue:
      orientation: left
      showLabels: false
      showValues: false
      tickDensity: default
      tickDensityCustom:
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: master_stats.total_impressions
        name: Impressions
        axisId: master_stats.total_impressions
        __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
        __LINE_NUM: 832
      __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
      __LINE_NUM: 820
    - label: ''
      maxValue:
      minValue:
      orientation: left
      showLabels: false
      showValues: false
      tickDensity: default
      tickDensityCustom:
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: master_stats.total_cost_usd
        name: Cost
        axisId: master_stats.total_cost_usd
        __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
        __LINE_NUM: 851
      __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
      __LINE_NUM: 839
    - label: ''
      maxValue:
      minValue:
      orientation: left
      showLabels: false
      showValues: false
      tickDensity: default
      tickDensityCustom:
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: master_stats.total_clicks
        name: Clicks
        axisId: master_stats.total_clicks
        __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
        __LINE_NUM: 870
      __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
      __LINE_NUM: 858
    discontinuous_nulls: false
    focus_on_hover: false
    reference_lines: []
    trend_lines:
    - color: "#000000"
      label_position: right
      period: 7
      regression_type: linear
      series_index: 1
      show_label: false
      label_type: string
      __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
      __LINE_NUM: 881
    colors:
    - "#a9c574"
    - "#c5c5c5"
    - "#929292"
    - "#9fdee0"
    - "#1f3e5a"
    - "#90c8ae"
    - "#92818d"
    - "#c5c6a6"
    - "#82c2ca"
    - "#cee0a0"
    - "#928fb4"
    - "#9fc190"
    series_colors: {}
    hidden_series:
    - master_stats.average_cost_per_conversion
    series_labels:
      master_stats.total_cost_usd: Spend
      master_stats.total_clicks: Interactions
    hidden_fields: []
    column_group_spacing_ratio: 0
    column_spacing_ratio: 0
    row: 2
    col: 0
    width: 10
    height: 9
  - title: Campaigns
    name: Campaigns
    model: google_adwords
    explore: master_stats
    type: table
    fields:
    - campaign.campaign_name
    - master_stats.total_cost_usd
    - master_stats.total_conversions
    - master_stats.average_cost_per_conversion
    - master_stats.average_conversion_rate
    - master_stats.average_cost_per_interaction
    - master_stats.average_interaction_rate
    - master_stats.average_cost_per_click
    sorts:
    - master_stats.total_conversions desc
    limit: 10
    column_limit: 50
    label: Campaign Details
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields:
    series_labels:
      master_stats.total_cost_usd: Spend
    row: 17
    col: 0
    width: 24
    height: 7
  - title: Per Click
    name: Per Click
    model: google_adwords
    explore: kpis_this_period
    type: single_value
    fields:
    - kpis_last_period.cost_per_click_last_period
    - kpis_this_period.cost_per_click_this_period
    limit: 500
    dynamic_fields:
    - table_calculation: change
      label: Change
      expression: "(${kpis_this_period.cost_per_click_this_period} - ${kpis_last_period.cost_per_click_last_period})/${kpis_last_period.cost_per_click_last_period}"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    hidden_fields: []
    single_value_title: ''
    listen:
      This Timeframe: kpis_this_period.this_timeframe
      Last Timeframe: kpis_last_period.last_timeframe
    row: 11
    col: 0
    width: 5
    height: 3
  - title: Click Rate
    name: Click Rate
    model: google_adwords
    explore: kpis_this_period
    type: single_value
    fields:
    - kpis_last_period.avg_click_rate_last_period
    - kpis_this_period.avg_click_rate_this_period
    limit: 500
    dynamic_fields:
    - table_calculation: change
      label: Change
      expression: "(${kpis_this_period.avg_click_rate_this_period} - ${kpis_last_period.avg_click_rate_last_period})/${kpis_last_period.avg_click_rate_last_period}"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    hidden_fields: []
    single_value_title: ''
    listen:
      This Timeframe: kpis_this_period.this_timeframe
      Last Timeframe: kpis_last_period.last_timeframe
    row: 14
    col: 0
    width: 5
    height: 3
  - title: Funnel
    name: Funnel
    model: google_adwords
    explore: account_quarter_stats
    type: looker_column
    fields:
    - account_quarter_stats.total_impressions
    - account_quarter_stats.total_clicks
    - account_quarter_stats.total_conversions
    filters:
      account_quarter_stats._data_quarter: 1 quarters
    limit: 500
    column_limit: 50
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: []
    label: Conversion Rate QTD
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    series_types: {}
    single_value_title: Conversion Rate
    comparison_label: ''
    y_axes:
    - label: ''
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: log
      unpinAxis: false
      valueFormat:
      series:
      - id: account_quarter_stats.total_impressions
        name: Impressions
        axisId: account_quarter_stats.total_impressions
        __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
        __LINE_NUM: 581
      - id: account_quarter_stats.total_clicks
        name: Clicks
        axisId: account_quarter_stats.total_clicks
        __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
        __LINE_NUM: 586
      - id: account_quarter_stats.total_conversions
        name: Conversions
        axisId: account_quarter_stats.total_conversions
        __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
        __LINE_NUM: 591
      __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
      __LINE_NUM: 569
    show_dropoff: true
    row: 11
    col: 16
    width: 8
    height: 6
  - title: Click Trend
    name: Click Trend
    model: google_adwords
    explore: master_stats
    type: looker_line
    fields:
    - master_stats._data_week
    - master_stats.average_cost_per_click
    - master_stats.average_click_rate
    sorts:
    - master_stats._data_week desc
    limit: 500
    column_limit: 50
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: time
    y_axis_scale_mode: linear
    show_null_points: false
    point_style: none
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    label: Average Cost per Conversion
    ordering: none
    show_null_labels: false
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    barColors:
    - red
    - blue
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    series_types: {}
    show_dropoff: true
    y_axes:
    - label: ''
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom:
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: master_stats.average_cost_per_click
        name: Cost per Click
        __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
        __LINE_NUM: 456
        axisId: master_stats.average_cost_per_click
      __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
      __LINE_NUM: 444
    - label:
      maxValue:
      minValue:
      orientation: right
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom:
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: master_stats.average_click_rate
        name: Click Through Rate
        axisId: master_stats.average_click_rate
        __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
        __LINE_NUM: 475
      __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
      __LINE_NUM: 463
    discontinuous_nulls: false
    focus_on_hover: false
    reference_lines: []
    trend_lines:
    - color: "#000000"
      label_position: right
      period: 7
      regression_type: linear
      series_index: 1
      show_label: false
      label_type: string
      __FILE: app_marketing_analytics/adwords_overview.dashboard.lookml
      __LINE_NUM: 486
    colors:
    - "#a9c574"
    - "#929292"
    - "#62bad4"
    - "#9fdee0"
    - "#1f3e5a"
    - "#90c8ae"
    - "#92818d"
    - "#c5c6a6"
    - "#82c2ca"
    - "#cee0a0"
    - "#928fb4"
    - "#9fc190"
    series_colors: {}
    hidden_series:
    - master_stats.average_cost_per_conversion
    series_labels:
      master_stats.total_cost_usd: Spend
      master_stats.total_clicks: Interactions
    hidden_fields: []
    y_axis_reversed: false
    row: 11
    col: 5
    width: 11
    height: 6
  filters:
  - name: This Timeframe
    title: This Timeframe
    type: field_filter
    default_value: this quarter
    model: google_adwords
    explore: kpis_this_period
    field: kpis_this_period.this_timeframe
    listens_to_filters: []
    allow_multiple_values: true
    required: false
  - name: Last Timeframe
    title: Last Timeframe
    type: field_filter
    default_value: 1 quarter ago
    model: google_adwords
    explore: kpis_this_period
    field: kpis_last_period.last_timeframe
    listens_to_filters: []
    allow_multiple_values: true
    required: false
