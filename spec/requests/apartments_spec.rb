require 'rails_helper'

RSpec.describe "Apartments", type: :request do
    let(:user) {User.create(
        email: "test1@example.com",
        password: "password",
        password_confirmation: "password"
      )}
    
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
          expect(apartment.first['street']).to eq "Auto Mall Parkway"
        end
    end

     describe "POST /create" do 
        it 'should create apartment' do
            apartment_params = {
            apartment: {
            street: "Auto Mall Parkway",  
            unit: "113",
            city: "D'Iberville",
            state: "MS",
            square_footage: 1200,
            price: "1300",
            bedrooms: 2,
            bathrooms: 2,
            pets: "cats and dogs",
            image: "https://media.apts247.info/ce/ce9560e9239c4c3b8369663b0a699279/floorplans/1196_CoconutPalm_504586.jpg",
            user_id: user.id
        }
    }

            post '/apartments', params: apartment_params
            expect(response).to have_http_status(200)

            apartment = Apartment.first

            expect(apartment.street).to eq "Auto Mall Parkway"  
            expect(apartment.unit).to eq "113"
            expect(apartment.city).to eq "D'Iberville"
            expect(apartment.state).to eq "MS"
            expect(apartment.square_footage).to eq 1200
            expect(apartment.price).to eq "1300"
            expect(apartment.bedrooms).to eq 2
            expect(apartment.bathrooms).to eq 2
            expect(apartment.pets).to eq "cats and dogs"
            expect(apartment.image).to eq "https://media.apts247.info/ce/ce9560e9239c4c3b8369663b0a699279/floorplans/1196_CoconutPalm_504586.jpg"
        end

        it "cannot create an apartment" do 
            apartment_params = {
            apartment: {
            unit: "113",
            city: "D'Iberville",
            state: "MS",
            square_footage: 1200,
            price: "1300",
            bedrooms: 2,
            bathrooms: 2,
            pets: "cats and dogs",
            image: "https://media.apts247.info/ce/ce9560e9239c4c3b8369663b0a699279/floorplans/1196_CoconutPalm_504586.jpg",
            user_id: user.id
          }
    }
    
            post '/apartments', params: apartment_params
            apartment = JSON.parse(response.body)
            expect(response).to have_http_status(422)
            expect(apartment['street']).to include "can't be blank"
        end
    end
 end
