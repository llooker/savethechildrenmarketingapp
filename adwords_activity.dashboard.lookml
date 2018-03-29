- dashboard: adwords_activity
  title: Change History This Month
  layout: newspaper
  embed_style:
    background_color: "#ffffff"
    show_title: true
    title_color: "#3a4245"
    show_filters_bar: false
    tile_text_color: "#3a4245"
    text_tile_text_color: ''
  elements:
  - title: Changes Over Time
    name: Changes Over Time
    model: looker_app_google_adwords
    explore: status_changes
    type: looker_column
    fields:
    - status_changes.count
    - status_changes.change_date
    - status_changes.content_type
    pivots:
    - status_changes.content_type
    filters:
      status_changes.change_date: 1 months
    sorts:
    - status_changes.change_date desc
    - status_changes.content_type
    limit: 500
    stacking: normal
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
    query_timezone: America/Los_Angeles
    show_null_points: true
    point_style: none
    interpolation: linear
    series_types: {}
    colors:
    - "#7869df"
    - "#6e98f9"
    - "#8ac8ca"
    - "#d06180"
    - "#dc9d4f"
    - "#4bb86a"
    - "#a4a6a9"
    - "#a6b7ff"
    - "#afe8fd"
    - "#ea9895"
    - "#f1e582"
    series_colors: {}
    column_spacing_ratio:
    y_axes:
    - label: "# Of Changes"
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: Ad
        name: Ad
        axisId: status_changes.count
        __FILE: app_marketing_analytics/adwords_activity.dashboard.lookml
        __LINE_NUM: 296
      - id: Ad Group
        name: Ad Group
        axisId: status_changes.count
        __FILE: app_marketing_analytics/adwords_activity.dashboard.lookml
        __LINE_NUM: 301
      - id: Campaign
        name: Campaign
        axisId: status_changes.count
        __FILE: app_marketing_analytics/adwords_activity.dashboard.lookml
        __LINE_NUM: 306
      - id: Keyword
        name: Keyword
        axisId: status_changes.count
        __FILE: app_marketing_analytics/adwords_activity.dashboard.lookml
        __LINE_NUM: 311
      __FILE: app_marketing_analytics/adwords_activity.dashboard.lookml
      __LINE_NUM: 284
    row: 0
    col: 0
    width: 20
    height: 9
  - title: Ad Changes
    name: Ad Changes
    model: looker_app_google_adwords
    explore: status_changes
    type: looker_line
    fields:
    - status_changes.count
    - status_changes.change_date
    filters:
      status_changes.change_date: 1 months
      status_changes.content_type: Ad
    sorts:
    - status_changes.change_date desc
    limit: 500
    stacking: normal
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
    show_null_points: true
    point_style: none
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    value_labels: legend
    label_type: labPer
    query_timezone: America/Los_Angeles
    series_types: {}
    colors:
    - "#7869df"
    - "#6e98f9"
    - "#8ac8ca"
    - "#d06180"
    - "#dc9d4f"
    - "#4bb86a"
    - "#a4a6a9"
    - "#a6b7ff"
    - "#afe8fd"
    - "#ea9895"
    - "#f1e582"
    series_colors: {}
    column_spacing_ratio:
    y_axes:
    - label: "# of Changes"
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: status_changes.count
        name: Status Changes
        axisId: status_changes.count
        __FILE: app_marketing_analytics/adwords_activity.dashboard.lookml
        __LINE_NUM: 392
      __FILE: app_marketing_analytics/adwords_activity.dashboard.lookml
      __LINE_NUM: 380
    row: 9
    col: 6
    width: 18
    height: 5
  - title: Keyword Changes
    name: Keyword Changes
    model: looker_app_google_adwords
    explore: status_changes
    type: looker_line
    fields:
    - status_changes.count
    - status_changes.change_date
    filters:
      status_changes.change_date: 1 months
      status_changes.content_type: Keyword
    sorts:
    - status_changes.change_date desc
    limit: 500
    stacking: normal
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
    show_null_points: true
    point_style: none
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    query_timezone: America/Los_Angeles
    series_types: {}
    colors:
    - "#6e98f9"
    - "#8ac8ca"
    - "#d06180"
    - "#dc9d4f"
    - "#4bb86a"
    - "#a4a6a9"
    - "#a6b7ff"
    - "#afe8fd"
    - "#ea9895"
    - "#f1e582"
    series_colors: {}
    column_spacing_ratio:
    column_group_spacing_ratio:
    y_axes:
    - label: "# of Changes"
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: status_changes.count
        name: Status Changes
        axisId: status_changes.count
        __FILE: app_marketing_analytics/adwords_activity.dashboard.lookml
        __LINE_NUM: 472
      __FILE: app_marketing_analytics/adwords_activity.dashboard.lookml
      __LINE_NUM: 460
    row: 14
    col: 6
    width: 18
    height: 5
  - title: Ad Changes
    name: Ad Changes Single Value
    model: looker_app_google_adwords
    explore: status_changes
    type: single_value
    fields:
    - status_changes.count
    filters:
      status_changes.change_date: 1 months
      status_changes.content_type: Ad
    limit: 500
    custom_color_enabled: true
    custom_color: "#7869df"
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    show_null_points: true
    point_style: none
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    row: 9
    col: 0
    width: 6
    height: 5
  - title: Keyword Changes
    name: Keyword Changes Single Value
    model: looker_app_google_adwords
    explore: status_changes
    type: single_value
    fields:
    - status_changes.count
    filters:
      status_changes.change_date: 1 months
      status_changes.content_type: Keyword
    limit: 500
    custom_color_enabled: true
    custom_color: "#6e98f9"
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    show_null_points: true
    point_style: none
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    row: 14
    col: 0
    width: 6
    height: 5
  - title: Ad Group Changes
    name: Ad Group Changes
    model: looker_app_google_adwords
    explore: status_changes
    type: single_value
    fields:
    - status_changes.count
    filters:
      status_changes.change_date: 1 months
      status_changes.content_type: Ad Group
    limit: 500
    custom_color_enabled: true
    custom_color: "#8ac8ca"
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    show_null_points: true
    point_style: none
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    row: 0
    col: 20
    width: 4
    height: 4
  - title: Campaign Changes
    name: Campaign Changes
    model: looker_app_google_adwords
    explore: status_changes
    type: single_value
    fields:
    - status_changes.count
    filters:
      status_changes.change_date: 1 months
      status_changes.content_type: Campaign
    limit: 500
    custom_color_enabled: true
    custom_color: "#d06180"
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    show_null_points: true
    point_style: none
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    row: 4
    col: 20
    width: 4
    height: 5
  - title: 25 Most Recent Changes
    name: 25 Most Recent Changes
    model: looker_app_google_adwords
    explore: status_changes
    type: table
    fields:
    - status_changes.change_date
    - campaign.campaign_name
    - ad_group.ad_group_name
    - status_changes.content_type
    - status_changes.change_type
    - status_changes.status_display
    filters:
      status_changes.change_date: 1 months
    sorts:
    - status_changes.change_date desc
    limit: 25
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: normal
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
    query_timezone: America/Los_Angeles
    show_null_points: true
    point_style: none
    interpolation: linear
    series_types: {}
    colors:
    - "#7869df"
    - "#6e98f9"
    - "#8ac8ca"
    - "#d06180"
    - "#dc9d4f"
    - "#4bb86a"
    - "#a4a6a9"
    - "#a6b7ff"
    - "#afe8fd"
    - "#ea9895"
    - "#f1e582"
    series_colors: {}
    column_spacing_ratio:
    y_axes:
    - label: "# Of Changes"
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: Ad
        name: Ad
        axisId: status_changes.count
        __FILE: app_marketing_analytics/adwords_activity.dashboard.lookml
        __LINE_NUM: 296
      - id: Ad Group
        name: Ad Group
        axisId: status_changes.count
        __FILE: app_marketing_analytics/adwords_activity.dashboard.lookml
        __LINE_NUM: 301
      - id: Campaign
        name: Campaign
        axisId: status_changes.count
        __FILE: app_marketing_analytics/adwords_activity.dashboard.lookml
        __LINE_NUM: 306
      - id: Keyword
        name: Keyword
        axisId: status_changes.count
        __FILE: app_marketing_analytics/adwords_activity.dashboard.lookml
        __LINE_NUM: 311
      __FILE: app_marketing_analytics/adwords_activity.dashboard.lookml
      __LINE_NUM: 284
    row: 19
    col: 0
    width: 24
    height: 13
