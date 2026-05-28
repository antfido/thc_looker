include: "/marketing/views/1_raw/avg_products_per_order_2023.view.lkml"

view: +avg_products_per_order_2023 {
  hidden_by_default: yes

  dimension: year { }
  dimension: month { }
  dimension: avg_products_per_order { }
}