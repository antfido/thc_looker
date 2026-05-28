include: "/marketing/views/2_basic/order_segmentation.view.lkml"

view: +order_segmentation {

    measure: number_of_customers_VIP {hidden: no sql: ${customers_id};; filters:[segment: "VIP"] type: count_distinct }
    measure: number_of_customers_returning {hidden: no sql: ${customers_id};; filters:[segment: "Returning"] type: count_distinct }
    measure: number_of_customers_new {hidden: no sql: ${customers_id};; filters:[segment: "New"] type: count_distinct }
    measure: number_of_orders_VIP {hidden: no sql: ${orders_id};; filters:[segment: "VIP"] type: count_distinct}
    measure: number_of_orders_returning {hidden: no sql: ${orders_id};; filters:[segment: "Returning"] type: count_distinct }
    measure: number_of_orders_new {hidden: no sql: ${orders_id};; filters:[segment: "New"] type: count_distinct }

    }
