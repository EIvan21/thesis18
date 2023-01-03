# The name of this view in Looker is "Sales"
view: sales {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: mextoysales.sales ;;
  drill_fields: [sale_id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: sale_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Sale_ID ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Date ;;
  }
  dimension_group: start {

    type: time
    timeframes: [time, hour, hour_of_day, day_of_week, day_of_year, date, week, month, month_num, month_name, quarter, day_of_month, year, raw, week_of_year]
    datatype: date
    sql: ${TABLE}.Date ;;

  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Product ID" in Explore.

  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.Product_ID ;;
  }

  dimension: store_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.Store_ID ;;
  }

  dimension: units {
    type: number
    sql: ${TABLE}.Units ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_units {
    type: sum
    sql: ${units} ;;
  }

  measure: average_units {
    type: average
    sql: ${units} ;;
  }

  measure: count {
    type: count
    drill_fields: [sale_id, stores.store_id, stores.store_name, products.product_id, products.product_name]
  }
}
