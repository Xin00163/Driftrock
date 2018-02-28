require_relative 'api'

class App

  attr_reader :user_data, :api

  def initialize(api: API.new)
    @user_data = api.fetch_all_data("users")
    @purchase_data = api.fetch_all_data("purchases")
  end

  def total_spend(email)
    user = @user_data.select {|user| user["email"] == email}
    user_id = user[0]["id"]
    items = @purchase_data.select{|purchase| purchase["user_id"] == user_id}
    spends = items.map{|item| item['spend'].to_f }
    spends.sum.round(2)
  end


  def most_sold
    most_sold = item_popularity.max_by{|item, popularity| popularity}
    most_sold[0]
  end


  def most_loyal
    most_loyal_id = user_frequency.max_by { |user, frequency| frequency }
    user = @user_data.select { |user| user['id'] == most_loyal_id[0]}
    user[0]['email']
  end

  private

  def item_popularity
    popularity = Hash.new(0)
    @purchase_data.each { |purchase| popularity[purchase['item']] += 1 }
    popularity
  end

  def user_frequency
    frequency = Hash.new(0)
    @purchase_data.each { |purchase| frequency[purchase['user_id']] += 1 }
    frequency
  end

end
