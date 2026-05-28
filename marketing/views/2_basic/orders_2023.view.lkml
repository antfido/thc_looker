include: "/marketing/views/1_raw/orders_2023.view.lkml"

view: +orders_2023 {

  fields_hidden_by_default: yes

  dimension: year { }
  dimension: number_of_orders { }
}
