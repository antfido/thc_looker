include: "/marketing/views/1_raw/sales_forecast.view.lkml"

view: +sales_forecast {

    dimension_group: date {hidden: no }
    measure: forecasted_revenue {hidden: no }
    measure: lower_bound {hidden: no }
    measure: upper_bound {hidden: no }
  }
