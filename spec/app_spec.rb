require 'httparty'
require 'app'

describe App do
  let (:api) { double :api }
  let (:app) { double :app }

  mocked_users = [
    {"id":"KZHR-1H35-2IH8-JXYN",
      "first_name":"Quincy",
      "last_name":"Schimmel",
      "phone":"186.301.6921 x948",
      "email":"schimmel_quincy@ernser.io"
    },
    {
      "id":"KZHR-2H37-2IH8-JXXN",
      "first_name":"Henry",
      "last_name":"Terry",
      "phone":"636-387-6074 x690",
      "email":"terry_henry@doyle.io"
    }
  ]
  mocked_purchases = [
    {"user_id":"KZHR-1H35-2IH8-JXYN",
      "item":"Enormous Linen Plate",
      "spend":"87.16"
    },
    {"user_id":"KABG-1H35-2IH8-JXYN",
      "item":"Enormous Linen Plate",
      "spend":"87.16"
    },
    {
      "user_id":"KZHR-2H37-2IH8-JXXN",
      "item":"Incredible Silk Bottle",
      "spend":"46.13"
    },
    {
      "user_id":"KZHR-2H37-2IH8-JXXN",
      "item":"something",
      "spend":"46.13"
    }
  ]

  describe "User data" do
    users_url_page_1 = "https://driftrock-dev-test.herokuapp.com/users?per_page=100&page=1"
    users_url_page_2 = "https://driftrock-dev-test.herokuapp.com/users?per_page=100&page=2"
    purchases_url_page_1 = "https://driftrock-dev-test.herokuapp.com/purchases?per_page=100&page=1"
    purchases_url_page_2 = "https://driftrock-dev-test.herokuapp.com/purchases?per_page=100&page=2"
    before do
      allow(api).to receive(:fetch_all_data).and_return(mocked_users)
      allow(api).to receive(:fetch_all_data).and_return(mocked_purchases)
      stub_request(:get, "https://driftrock-dev-test.herokuapp.com/status").
           to_return(status: 200, body: "", headers: {})

      stub_request(:get, users_url_page_1).
           to_return(status: 200, body: {data: mocked_users}.to_json, headers: {
              "Content-Type": "application/json"
             })
      stub_request(:get, users_url_page_2).
          to_return(status: 200, body: {}.to_json, headers: {
             "Content-Type": "application/json"
            })
      stub_request(:get, purchases_url_page_1).
          to_return(status: 200, body: {data: mocked_purchases}.to_json, headers: {
             "Content-Type": "application/json"
            })
      stub_request(:get, purchases_url_page_2).
          to_return(status: 200, body: {}.to_json, headers: {
             "Content-Type": "application/json"
            })
    end


    it 'return the user\'s total spend' do
      expect(subject.total_spend('schimmel_quincy@ernser.io')).to eq(87.16)
    end

    it 'return the most sold item' do
      expect(subject.most_sold).to eq("Enormous Linen Plate")
    end

    it 'return the most loyal customer' do
      expect(subject.most_loyal).to eq("terry_henry@doyle.io")
    end
  end
end
