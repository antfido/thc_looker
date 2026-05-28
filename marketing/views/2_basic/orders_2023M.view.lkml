include: "/marketing/views/1_raw/orders_2023M.view.lkml"

view: +orders_2023M {

  fields_hidden_by_default: yes

  dimension: year { }
  dimension: month { }
  dimension: number_of_orders { }
}
