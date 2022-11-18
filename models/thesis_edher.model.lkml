# Define the database connection to be used for this model.
connection: "jpr_mextoys"

# include all the views
include: "/views/**/*.view"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: thesis_edher_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: thesis_edher_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Thesis Edher"

explore: inventory {
  join: stores {
    type: left_outer
    sql_on: ${inventory.store_id} = ${stores.store_id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${inventory.product_id} = ${products.product_id} ;;
    relationship: many_to_one
  }

}

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

explore: products {}

explore: sales {
  join: stores {
    type: left_outer
    sql_on: ${sales.store_id} = ${stores.store_id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${sales.product_id} = ${products.product_id} ;;
    relationship: many_to_one
  }

  join: inventory {
    type: left_outer
    sql_on: ${products.product_id}=${inventory.product_id} ;;
    relationship: many_to_one
  }
}

explore: stores {}
