include: "/*/*.view.lkml"
include: "/Google_Analytics/*.view.lkml"

explore: ga_sessions {
  label: "Google Analytics Sessions"
  description: "Explores Google Analytics sessions data."

  join: audience_cohorts {
    type: left_outer
    sql_on: ${ga_sessions.audience_trait} = ${audience_cohorts.audience_trait} ;;
    relationship: many_to_one
  }

  join: hits {
    type: left_outer
    sql: LEFT JOIN UNNEST(${ga_sessions.hits}) AS hits ;;
    relationship: one_to_many
  }

  join: time_on_page {
    view_label: "Behavior"
    type: left_outer
    sql_on: ${hits.id} = ${time_on_page.hit_id} ;;
    relationship: one_to_one
  }

  join: page_facts {
    type: left_outer
    sql_on: ${ga_sessions.id} = ${page_facts.session_id}
      AND (${hits.hit_number} BETWEEN ${page_facts.hit_number} AND COALESCE(${page_facts.next_page_hit_number}-1, ${page_facts.hit_number}));;
    relationship: one_to_one
  }

  join: session_flow {
    type: left_outer
    sql_on: ${ga_sessions.id} = ${session_flow.session_id};;
    relationship: one_to_one
  }

  join: transaction_users {
    type: left_outer
    sql_on: ${ga_sessions.full_visitor_id} = ${transaction_users.full_visitor_id} ;;
    relationship: many_to_one
  }

}
