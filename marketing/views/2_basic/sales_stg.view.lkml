include: "/marketing/views/1_raw/sales_stg.view.lkml"

view: +sales_stg {
  hidden_by_default: yes

  dimension_group: date_date { }
  dimension: customer_id { }
  dimension: order_id { }
  dimension: products_id { }
  dimension: net_sales { }
  dimension: qty { }
  dimension: year { }
  dimension: month { }
}