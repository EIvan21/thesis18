# The name of this view in Looker is "Stores"
view: stores {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: mextoysales.stores ;;
  drill_fields: [store_id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: store_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Store_ID ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Store City" in Explore.

  dimension: store_city {
    type: string
    sql: ${TABLE}.Store_City ;;
  }

  dimension: store_location {
    type: string
    sql: ${TABLE}.Store_Location ;;
  }

  dimension: store_name {
    type: string
    sql: ${TABLE}.Store_Name ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: store_open {
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
    sql: ${TABLE}.Store_Open_Date ;;
  }

  measure: count {
    type: count
    drill_fields: [store_id, store_name, inventory.count, sales.count]
  }
}
