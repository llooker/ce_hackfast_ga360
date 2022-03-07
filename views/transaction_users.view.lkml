# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
explore: transaction_users {
  hidden: yes

  join: transaction_users__sales_by_category {
    view_label: "Transaction Users: Sales By Category"
    sql: LEFT JOIN UNNEST(${transaction_users.sales_by_category}) as transaction_users__sales_by_category ;;
    relationship: one_to_many
  }
}

# The name of this view in Looker is "Transaction Users"
view: transaction_users {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `looker-private-demo.google_gmp_customer_match.transaction_users`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Customer Ltv" in Explore.

  dimension: customer_ltv {
    type: number
    sql: ${TABLE}.customer_LTV ;;
  }

  measure: average_customer_ltv {
    type: average
    sql: ${customer_ltv} ;;
  }

  dimension: full_visitor_id {
    type: string
    sql: ${TABLE}.fullVisitorID ;;
    primary_key: yes
  }

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: sales_by_category {
    hidden: yes
    sql: ${TABLE}.sales_by_category ;;
  }

  dimension: total_items_purchased {
    type: number
    sql: ${TABLE}.total_items_purchased ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_total_items_purchased {
    type: sum
    sql: ${total_items_purchased} ;;
  }

  measure: average_total_items_purchased {
    type: average
    sql: ${total_items_purchased} ;;
  }

  dimension: user_key {
    type: number
    sql: ${TABLE}.user_key ;;
  }

  dimension: users_age {
    type: number
    sql: ${TABLE}.users_age ;;
  }

  dimension: users_city {
    type: string
    sql: ${TABLE}.users_city ;;
  }

  dimension: users_country {
    type: string
    sql: ${TABLE}.users_country ;;
  }

  dimension: users_email {
    type: string
    sql: ${TABLE}.users_email ;;
  }

  dimension: users_first_name {
    type: string
    sql: ${TABLE}.users_first_name ;;
  }

  dimension: users_gender {
    type: string
    sql: ${TABLE}.users_gender ;;
  }

  dimension: users_id {
    type: number
    sql: ${TABLE}.users_id ;;
  }

  dimension: users_last_name {
    type: string
    sql: ${TABLE}.users_last_name ;;
  }

  dimension: users_latitude {
    type: number
    sql: ${TABLE}.users_latitude ;;
  }

  dimension: users_longitude {
    type: number
    sql: ${TABLE}.users_longitude ;;
  }

  dimension: users_state {
    type: string
    sql: ${TABLE}.users_state ;;
  }

  dimension: users_zip {
    type: string
    sql: ${TABLE}.users_zip ;;
  }

  measure: count {
    type: count
    drill_fields: [users_last_name, users_first_name]
  }
}

# The name of this view in Looker is "Transaction Users Sales By Category"
view: transaction_users__sales_by_category {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Category" in Explore.

  dimension: category {
    type: string
    sql: category ;;
  }

  dimension: total_revenue {
    type: number
    sql: total_revenue ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_total_revenue {
    type: sum
    sql: ${total_revenue} ;;
  }

  measure: average_total_revenue {
    type: average
    sql: ${total_revenue} ;;
  }

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: transaction_users__sales_by_category {
    type: string
    hidden: yes
    sql: transaction_users__sales_by_category ;;
  }
}
