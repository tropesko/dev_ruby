# 3.3. Precisamos agora ter uma página HTML para listar os pedidos (orders)
# de um determinado customer. Descreva como você resolveria esse
# problema. Forneça o código necessário para exemplificar.

# db/schema.rb
create_table "orders" do |t|
  t.integer "operator_id", null: false
  t.integer "customer_id", null: false
  t.integer "location_id", null: false
  t.decimal "value", precision: 10, scale: 2, null: false
  t.integer "status", default: 0, null: false
end

# app/controllers/orders_controller.rb
class OrdersController < ApplicationController
  def index
    @customer = Customer.find(params[:customer_id])
    @orders = @customer.orders
  end
end

# app/views/customer/index.html.erb
<table>
<thead>
  <tr>
    <th>Cliente</th>
    <th>Operador</th>
    <th>Locais</th>
    <th>Pedidos</th>
  </tr>
</thead>
<tbody>
  <% @customers.each do |customer| %>
    <tr>
      <td><%= customer.name %></td>
      <td><%= customer.operator.name %></td>
      <td><%= customer.locations.map(&:name).join(', ') %></td>
      <td><%= link_to 'Ver Pedidos', customer_orders_path(customer) %></td>
    </tr>
  <% end %>
</tbody>
</table>
