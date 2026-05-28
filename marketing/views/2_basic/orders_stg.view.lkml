include: "/marketing/views/1_raw/orders_stg.view.lkml"

view: +orders_stg {
  hidden_by_default: yes

  dimension_group: date_date { }
  dimension: customers_id { }
  dimension: orders_id { }
  dimension: net_sales { }
  dimension: year { }
  dimension: month { }
}