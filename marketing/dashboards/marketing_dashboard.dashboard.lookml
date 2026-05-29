---
- dashboard: marketing__orders__sales
  title: Marketing — Orders & Sales
  description: Daily performance dashboard for the e-commerce marketing team. Tracks
    revenue, orders, customer segmentation and basket metrics (2022–2023).
  preferred_slug: tytHoLrXVJEeIJ45Q2BFZ8
  layout: newspaper
  tabs:
  - name: ''
    label: ''
  elements:
  - title: Total Revenue
    name: Total Revenue
    model: marketing
    explore: mkt_orders
    type: single_value
    fields: [orders_stg.total_net_sales]
    limit: 500
    query_timezone: Europe/Warsaw
    font_size: medium
    show_comparison: false
    listen:
      Date Range: orders_stg.date_date_date
    row: 6
    col: 0
    width: 8
    height: 6
    tab_name: ''
  - title: Total Orders
    name: Total Orders
    model: marketing
    explore: mkt_orders
    type: single_value
    fields: [orders_stg.number_of_orders]
    limit: 500
    query_timezone: Europe/Warsaw
    font_size: medium
    show_comparison: false
    listen:
      Date Range: orders_stg.date_date_date
    row: 0
    col: 8
    width: 8
    height: 6
    tab_name: ''
  - title: Average Order Value
    name: Average Order Value
    model: marketing
    explore: mkt_orders
    type: single_value
    fields: [sales_stg.avg_basket_value]
    limit: 500
    query_timezone: Europe/Warsaw
    font_size: medium
    show_comparison: false
    listen:
      Date Range: orders_stg.date_date_date
    row: 0
    col: 16
    width: 8
    height: 6
    tab_name: ''
  - title: Active Customers
    name: Active Customers
    model: marketing
    explore: mkt_orders
    type: single_value
    fields: [orders_stg.number_of_customers]
    limit: 500
    query_timezone: Europe/Warsaw
    font_size: medium
    show_comparison: false
    listen:
      Date Range: orders_stg.date_date_date
    row: 0
    col: 0
    width: 8
    height: 6
    tab_name: ''
  - title: Monthly Revenue Trend
    name: Monthly Revenue Trend
    model: marketing
    explore: mkt_orders
    type: looker_line
    fields: [orders_stg.date_date_month, orders_stg.total_net_sales]
    sorts: [orders_stg.date_date_month asc]
    limit: 500
    query_timezone: Europe/Warsaw
    show_value_labels: false
    show_x_axis_label: false
    show_y_axis_labels: true
    x_axis_gridlines: false
    interpolation: monotone
    point_style: none
    show_view_names: false
    y_axis_gridlines: true
    legend_position: center
    listen:
      Date Range: orders_stg.date_date_date
    row: 6
    col: 8
    width: 8
    height: 6
    tab_name: ''
  - title: Revenue Year-over-Year
    name: Revenue Year-over-Year
    model: marketing
    explore: mkt_orders
    type: looker_line
    fields: [orders_stg.total_net_sales, orders_stg.date_date_month_num, orders_stg.date_date_year]
    pivots: [orders_stg.date_date_year]
    fill_fields: [orders_stg.date_date_year, orders_stg.date_date_month_num]
    sorts: [orders_stg.date_date_year, orders_stg.date_date_month_num]
    limit: 500
    column_limit: 50
    query_timezone: Europe/Warsaw
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Date Range: orders_stg.date_date_date
    row: 6
    col: 16
    width: 8
    height: 6
    tab_name: ''
  - title: Monthly Orders
    name: Monthly Orders
    model: marketing
    explore: mkt_orders
    type: looker_column
    fields: [orders_stg.date_date_month, orders_stg.number_of_orders]
    sorts: [orders_stg.date_date_month asc]
    limit: 500
    query_timezone: Europe/Warsaw
    show_value_labels: false
    show_view_names: false
    show_x_axis_label: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    legend_position: center
    listen:
      Date Range: orders_stg.date_date_date
    row: 18
    col: 0
    width: 8
    height: 6
    tab_name: ''
  - title: Customer Segment Mix
    name: Customer Segment Mix
    model: marketing
    explore: mkt_orders
    type: looker_pie
    fields: [order_segmentation.segment, orders_stg.number_of_customers]
    sorts: [orders_stg.number_of_customers desc]
    limit: 500
    query_timezone: Europe/Warsaw
    pie_inner_radius: 40
    show_value_labels: true
    show_view_names: false
    label_type: labPer
    legend_position: right
    listen:
      Date Range: orders_stg.date_date_date
    row: 12
    col: 0
    width: 8
    height: 6
    tab_name: ''
  - title: Revenue by Segment
    name: Revenue by Segment
    model: marketing
    explore: mkt_orders
    type: looker_bar
    fields: [order_segmentation.segment, orders_stg.total_net_sales, orders_stg.number_of_orders]
    sorts: [orders_stg.total_net_sales desc]
    limit: 500
    query_timezone: Europe/Warsaw
    y_axis_gridlines: true
    legend_position: center
    show_value_labels: true
    show_view_names: false
    x_axis_gridlines: false
    listen:
      Date Range: orders_stg.date_date_date
    row: 12
    col: 16
    width: 8
    height: 6
    tab_name: ''
  - title: Customer Segment Trend
    name: Customer Segment Trend
    model: marketing
    explore: mkt_orders
    type: looker_area
    fields: [orders_stg.date_date_month, order_segmentation.number_of_customers_new,
      order_segmentation.number_of_customers_returning, order_segmentation.number_of_customers_VIP]
    sorts: [orders_stg.date_date_month asc]
    limit: 500
    query_timezone: Europe/Warsaw
    legend_position: center
    point_style: none
    show_value_labels: false
    show_x_axis_label: false
    stacking: normal
    x_axis_gridlines: false
    interpolation: monotone
    show_view_names: false
    y_axis_gridlines: true
    listen:
      Date Range: orders_stg.date_date_date
    row: 12
    col: 8
    width: 8
    height: 6
    tab_name: ''
  - title: Average Order Value Trend
    name: Average Order Value Trend
    model: marketing
    explore: mkt_orders
    type: looker_line
    fields: [orders_stg.date_date_month, sales_stg.avg_basket_value]
    sorts: [orders_stg.date_date_month asc]
    limit: 500
    query_timezone: Europe/Warsaw
    interpolation: monotone
    legend_position: center
    point_style: circle
    show_value_labels: false
    show_x_axis_label: false
    x_axis_gridlines: false
    show_view_names: false
    y_axis_gridlines: true
    listen:
      Date Range: orders_stg.date_date_date
    row: 18
    col: 8
    width: 8
    height: 6
    tab_name: ''
  - title: Basket Size & Distinct Products per Order
    name: Basket Size & Distinct Products per Order
    model: marketing
    explore: mkt_orders
    type: looker_line
    fields: [orders_stg.date_date_month, sales_stg.avg_basket_size, sales_stg.avg_different_products_per_order]
    sorts: [orders_stg.date_date_month asc]
    limit: 500
    query_timezone: Europe/Warsaw
    interpolation: monotone
    legend_position: center
    point_style: none
    show_view_names: false
    show_x_axis_label: false
    y_axis_gridlines: true
    show_value_labels: false
    x_axis_gridlines: false
    listen:
      Date Range: orders_stg.date_date_date
    row: 18
    col: 16
    width: 8
    height: 6
    tab_name: ''
  - title: Top 10 Products by Revenue
    name: Top 10 Products by Revenue
    model: marketing
    explore: mkt_orders
    type: looker_bar
    fields: [sales_stg.products_id, sales_stg.total_net_sales, sales_stg.number_of_products]
    sorts: [sales_stg.total_net_sales desc]
    limit: 10
    query_timezone: Europe/Warsaw
    legend_position: center
    show_value_labels: true
    show_view_names: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    listen:
      Date Range: orders_stg.date_date_date
    row: 24
    col: 0
    width: 8
    height: 6
    tab_name: ''
  - title: Forecasted Revenue
    name: Forecasted Revenue
    model: marketing
    explore: forecast_revenue
    type: looker_line
    fields: [sales_forecast.date_date, sales_forecast.forecasted_revenue]
    filters:
      sales_forecast.forecasted_revenue: NOT NULL
    sorts: [sales_forecast.date_date desc]
    limit: 500
    column_limit: 50
    query_timezone: UTC
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: sales_forecast.forecasted_revenue,
            id: sales_forecast.forecasted_revenue, name: Forecasted Revenue}], showLabels: true,
        showValues: true, tickDensity: default, tickDensityCustom: 5, type: linear,
        unpinAxis: true}]
    x_axis_zoom: true
    y_axis_zoom: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 24
    col: 8
    width: 16
    height: 6
    tab_name: ''
  filters:
  - name: Date Range
    title: Date Range
    type: date_filter
    default_value: 2022/07/01 to 2023/12/31
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
  - name: Year
    title: Year
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: marketing
    explore: mkt_orders
    listens_to_filters: []
    field: orders_stg.year
  - name: Segment
    title: Customer Segment
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: marketing
    explore: mkt_orders
    listens_to_filters: []
    field: order_segmentation.segment
