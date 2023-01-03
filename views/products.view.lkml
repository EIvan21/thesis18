# The name of this view in Looker is "Products"
view: products {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: mextoysales.products ;;
  drill_fields: [product_id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: product_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Product_ID ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Product Category" in Explore.

  dimension: product_category {
    type: string
    sql: ${TABLE}.Product_Category ;;
  }

  dimension: product_cost {
    type: string
    sql: ${TABLE}.Product_Cost ;;
  }
  dimension_group: start {

    type: time
    timeframes: [time, hour, hour_of_day, day_of_week, day_of_year, date, week, month, month_num, month_name, quarter, day_of_month, year, raw, week_of_year]
    datatype: date
    sql: ${TABLE} ;;

  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.Product_Name ;;
  }

  dimension: product_price {
    type: string
    sql: ${TABLE}.Product_Price ;;
  }

  measure: count {
    type: count
    drill_fields: [product_id, product_name, inventory.count, sales.count]
  }
}
