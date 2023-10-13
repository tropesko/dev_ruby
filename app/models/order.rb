# app/models/order.rb

class order < ApplicationModel
  belongs_to :customer
  enum status: { pending: 0, success: 1, failed: 2, rolled_back: 3 }
end
