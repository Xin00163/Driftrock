require_relative 'api'

class App

  attr_reader :user_data, :api

  def initialize(api= API.new)
    @user_data = api.fetch_all_data("users")
    @purchase_data = api.fetch_all_data("purchases")
  end

  def total_spend(email)
    user = @user_data.select {|user| user["email"] == email}
    user_id = user[0].(['id'])
    items = @purchase_data.select{|purchase| purchase["user_id"] == user_id}
    spends = items.map{|item| item['spend'].to_f }
    spends.sum.round(2)
  end


end
