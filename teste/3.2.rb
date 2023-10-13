# 3.2. O controller de customers somente possui as actions CRUD, geradas
# pelo scaffold (tirando a de index, as demais foram omitidas da listagem
# acima). A configuração em config/routes.rb é a seguinte:
#  resources :customers
#
# É necessario adicionar uma nova action chamada block. Como o nome já
# diz, essa action vai bloquear um customer. Altere a configuração de
# config/routes.rb para considerar essa nova action.

# config/routes.rb
resources :customers do
  resources :orders, only: [:index]
  member do
    post :block
  end
end
