include: "/marketing/views/2_basic/sales_stg.view.lkml"

view: +sales_stg {

      measure: number_of_diffrent_products {hidden: no sql: COUNT(DISTINCT(${products_id}));; type: number}
      measure: number_of_products {hidden: no sql: SUM(${qty});; type: number}
      measure: total_net_sales {hidden: no sql: SUM(${net_sales});; value_format: "$#.##" type: number}
      measure: avg_basket_size {hidden: no sql: SUM(${qty})/NULLIF(COUNT(DISTINCT(${order_id})),0);; value_format_name: decimal_2 type: number}
      measure: avg_basket_value {hidden: no sql: SUM(${net_sales})/NULLIF(COUNT(DISTINCT(${order_id})),0);; value_format: "$#.##" type: number}
      measure: avg_different_products_per_order {hidden: no sql:COUNT(DISTINCT(${products_id}))/NULLIF(COUNT(DISTINCT(${order_id})),0);; value_format_name: decimal_2 type: number }


      }
