require 'httparty'
require 'api'

describe API do
  let (:api) { API.new }

  it 'returns the 200 response' do
    stub_request(:get, "https://driftrock-dev-test.herokuapp.com/status").
         to_return(status: 200, body: "", headers: {})
    expect(api.status_correct?).to eq(true)
  end

  it 'should raise error' do
    stub_request(:get, "https://driftrock-dev-test.herokuapp.com/status").
         to_return(status: 400, body: "", headers: {})
    expect{api.fetch_all_data('users')}.to raise_error 'API is not working'
  end
end
