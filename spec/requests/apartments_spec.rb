require 'rails_helper'

RSpec.describe "Apartments", type: :request do
  let(:user) { User.create(
    email: 'test@example.com',
    password: 'password',
    password_confirmation: 'password'
    )
  }

  describe "GET /index" do
    it 'gets a list of apartments' do
      apartment = user.apartments.create(
        street: "Auto Mall Parkway",
        unit: "113",
        city: "D'Iberville",
        state: "MS",
        square_footage: 1200,
        price: "1300",
        bedrooms: 2,
        bathrooms: 2,
        pets: "cats and dogs",
        image: "https://media.apts247.info/ce/ce9560e9239c4c3b8369663b0a699279/floorplans/1196_CoconutPalm_504586.jpg"
      )
      get '/apartments'

      apartment = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(apartment.first['street']).to eq('Auto Mall Parkway')
    end
  end
end
