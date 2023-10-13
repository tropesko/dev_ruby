# app/models/customer.rb

class Customer < ApplicationModel
  belongs_to :operator
  has_many :locations
  has_many :orders
end
