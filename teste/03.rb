# O problema com a query executada na action index do controlador
# é que ela pode causar um problema de N+1, o que significa que
# para cada registro de Customer, está sendo realizada uma consulta
# adicional para carregar o nome do operador e a lista de locais.
# Isso pode levar a um grande número de consultas ao banco de dados,
# o que é ineficiente.
#
# Para corrigir esse problema, podemos usar o método includes para
# pré-carregar os relacionamentos necessários junto com os clientes
# em uma única consulta. Aqui está a reescrita da query:

# app/controllers/customer_controller.rb
class CustomersController < ApplicationController
  def index
    # @customers = Customer.order(:name)
    @customers = Customer.includes(:operator, :locations).order(:name)
  end
end
