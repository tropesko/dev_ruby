# 3. Dado um projeto Rails, abaixo descrevemos os models Customer e Order,
# o controller de customers e a view da sua action index. O código está
# simplificado, omitimos partes que não interessam para as questões a seguir.
#
# 3.1. Descreva o problema com a query executada na action index e
# reescreva a query, corrigindo o problema.
#
# Resposta: O problema com a query executada na action index do controlador
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

  def block
    @customer = Customer.find(params[:id])
    @customer.update(blocked: true)
    redirect_to @customer, notice: 'Cliente bloqueado com sucesso.'
  end
end

# Com essas alterações, você terá adicionado com sucesso a
# action block ao controlador de Customers e configurado a
# rota correspondente. Agora, você pode acessar a action block
# por meio de uma URL como /customers/1/block, onde 1 é o ID
# do cliente que você deseja bloquear.
