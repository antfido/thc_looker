include: "/marketing/views/1_raw/orders_stg.view.lkml"

view: +orders_stg {

  fields_hidden_by_default: no
  view_label: "Orders"

  dimension_group: date_date { }
  dimension: customers_id { }
  dimension: orders_id {primary_key: yes }
  # dimension: year { }
  # dimension: month { }
  dimension: net_sales { }
}
