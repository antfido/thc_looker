include: "/marketing/views/1_raw/sales_stg.view.lkml"

view: +sales_stg {

  fields_hidden_by_default: no

  dimension_group: date_date { }
  dimension: customer_id { }
  dimension: order_id { }
  dimension: products_id { }
  dimension: year { }
  dimension: month { }
  dimension: net_sales { }
  dimension: qty { }
}
