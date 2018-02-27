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
      "id":"S27G-8UMJ-LDSL-UOPN",
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
    {
      "user_id":"KZHR-1H35-2IH8-JXYN",
      "item":"Incredible Silk Bottle",
      "spend":"46.13"
    }
  ]

  describe "User data" do
    before do
      allow(api).to receive(:fetch_all_data).and_return(mocked_users)
      allow(api).to receive(:fetch_all_data).and_return(mocked_purchases)
    end

    it 'return the user\'s total spend' do
      stub_request(:get, "https://driftrock-dev-test.herokuapp.com/status").
           to_return(status: 200, body: "", headers: {})
      stub_request(:get, "https://driftrock-dev-test.herokuapp.com/users?page=1&per_page=100").
           to_return(status: 200, body: {data: mocked_users}.to_json, headers: {
              "Content-Type": "application/json"
             })
      stub_request(:get, "https://driftrock-dev-test.herokuapp.com/purchases?page=1&per_page=100").
          to_return(status: 200, body: {data: mocked_users}.to_json, headers: {
             "Content-Type": "application/json"
            })
      expect(subject.total_spend('schimmel_quincy@ernser.io')).to eq(87.16)
    end

  end
end
