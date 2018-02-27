require 'httparty'

class API
  attr_reader :base_url, :params

  def initialize
    @base_url = "https://driftrock-dev-test.herokuapp.com/"
    @params = "?per_page=100&page="
  end

  def fetch_all_data(end_point)
    raise 'API is not working' unless status_correct?
    path = base_url + end_point + params
    current_page = 1
    results = []
    loop do
      response = HTTParty.get(path + current_page.to_s)
      break if response.empty?
      results.concat(response['data'])
      current_page += 1
    end
    results
  end

  def status_correct?
    HTTParty.get(@base_url + "status").code == 200
  end



end
