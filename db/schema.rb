# db/schema.rb
create_table "orders" do |t|
  t.integer "operator_id", null: false
  t.integer "customer_id", null: false
  t.integer "location_id", null: false
  t.decimal "value", precision: 10, scale: 2, null: false
  t.integer "status", default: 0, null: false
end
