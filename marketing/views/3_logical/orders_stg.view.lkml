include: "/marketing/views/2_basic/orders_stg.view.lkml"

view: +orders_stg {

      measure: number_of_customers {hidden: no description:"Number of customers that made at least 1 order" sql:${customers_id};; type: count_distinct}
      measure: number_of_orders {hidden: no description:"Number of orders" sql:${orders_id};; type: count_distinct}
      measure: avg_number_of_orders_per_customer {hidden: no sql: COUNT(DISTINCT(${orders_id}))/COUNT(DISTINCT(${customers_id}));; value_format_name: decimal_1 type: number}
      measure: total_net_sales {hidden: no sql:SUM(${net_sales});; value_format: "$#.##" type: number}
      measure: avg_net_sales_per_customer {hidden: no sql: SUM(${net_sales})/NULLIF(${number_of_customers},0);; value_format: "$#.##" type: number}

      }
