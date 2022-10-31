# The name of this view in Looker is "Inventory"
view: inventory {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: mextoysales.inventory ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Product ID" in Explore.

  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.Product_ID ;;
  }

  dimension: stock_on_hand {
    type: number
    sql: ${TABLE}.Stock_On_Hand ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_stock_on_hand {
    type: sum
    sql: ${stock_on_hand} ;;
  }

  measure: average_stock_on_hand {
    type: average
    sql: ${stock_on_hand} ;;
  }

  dimension: store_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.Store_ID ;;
  }

  measure: count {
    type: count
    drill_fields: [stores.store_id, stores.store_name, products.product_id, products.product_name]
  }
}
