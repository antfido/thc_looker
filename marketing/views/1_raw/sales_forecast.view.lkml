view: sales_forecast {
  sql_table_name: `astrafy-dbt-demo.transformed.sales_forecast` ;;

  dimension_group: date {
    type: time
    timeframes: [raw, date, week, month]
    datatype: timestamp
    sql: ${TABLE}.date ;;
    label: "Forecast Week"
  }

  measure: forecasted_revenue {
    type: max
    sql: ${TABLE}.forecasted_revenue ;;
    label: "Forecasted Revenue"
    description: "Weekly revenue predicted by BigQuery ML AI.FORECAST"
    value_format_name: decimal_2
  }

  measure: lower_bound {
    type: max
    sql: ${TABLE}.lower_bound ;;
    label: "Lower Bound (90% CI)"
    value_format_name: decimal_2
  }

  measure: upper_bound {
    type: max
    sql: ${TABLE}.upper_bound ;;
    label: "Upper Bound (90% CI)"
    value_format_name: decimal_2
  }
}
