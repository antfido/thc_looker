include: "/marketing/models/marketing.model.lkml"

include: "/marketing/views/1_raw/*.view.lkml"
include: "/marketing/views/2_basic/*.view.lkml"
include: "/marketing/views/3_logical/*.view.lkml"

explore: mkt_orders {

    hidden: no
    view_name: orders_stg
    label: "Orders"

    join: sales_stg {
      view_label: "Sales"
      relationship: one_to_many
      sql_on: ${orders_stg.orders_id}=${sales_stg.order_id} ;;
    }

    join: order_segmentation {
      view_label: "Orders"
      relationship: one_to_many
      sql_on: ${orders_stg.orders_id}=${order_segmentation.orders_id} ;;
    }



}


# Covers 8 weeks ahead from 2024-01-01 with 90% confidence intervals
explore: forecast_revenue {

    label: "Revenue Forecast"
    view_name: sales_forecast
    hidden: yes
}
