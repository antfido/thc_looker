include: "/marketing/views/1_raw/order_segmentation.view.lkml"

view: +order_segmentation {

  fields_hidden_by_default: yes

  dimension_group: date_date { }
  dimension: customers_id { }
  dimension: orders_id { }
  dimension: prior_orders_12m { }
  dimension: segment {hidden: no description:"Depending on how many orders customer made prior to this order he would be categorized as: NEW - first order in the past 12 months, RETURNING - between 2 and 4 orders (1-3 prior to this one), VIP - 5 or more (at least 4 orders in the past 12 months)"  }
}
