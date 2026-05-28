include: "/marketing/views/1_raw/order_segmentation.view.lkml"

view: +order_segmentation {
  hidden_by_default: yes

  dimension_group: date_date { }
  dimension: customers_id { }
  dimension: orders_id { }
  dimension: prior_orders_12m { }
  dimension: segment { }
}