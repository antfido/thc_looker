include: "/marketing/views/1_raw/orders_segmented.view.lkml"

view: +orders_segmented {
  hidden_by_default: yes

  dimension: orders_id { }
  dimension: segment { }
}