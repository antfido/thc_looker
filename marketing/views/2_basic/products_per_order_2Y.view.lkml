include: "/marketing/views/1_raw/products_per_order_2Y.view.lkml"

view: +products_per_order_2Y {
  hidden_by_default: yes

  dimension_group: date_date { }
  dimension: order_id { }
  dimension: qty_product { }
}