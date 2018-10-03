connection: "snowlooker"
label: "Projecto Vendas"

# include all the views
include: "*.view"

##include dashboard
include: "*.dashboard.lookml"


datagroup: anaritasilva_proj3_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: anaritasilva_proj3_default_datagroup



explore: order_items {
  label: "(1) Orders, Items, Inventory and Users"
  join: users {
    type: left_outer
    sql_on: ${order_items.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: order_items_factos{
    relationship: many_to_one
    type: full_outer
    sql_on: ${order_items.order_id} = ${order_items_factos.order_id} ;;
  }

}
