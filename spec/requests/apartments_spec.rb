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

        it "cannot create an apartment without street" do 
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

        it "cannot create an apartment without unit" do 
            apartment_params = {
                apartment: {
                    street: "Auto Mall Parkway", 
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
            expect(apartment['unit']).to include "can't be blank"
        end

        it "cannot create an apartment without city" do 
            apartment_params = {
                apartment: {
                    street: "Auto Mall Parkway", 
                    unit: "113",
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
            expect(apartment['city']).to include "can't be blank"
        end

        it "cannot create an apartment without state" do 
            apartment_params = {
                apartment: {
                    street: "Auto Mall Parkway", 
                    unit: "113",
                    city: "D'Iberville",
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
            expect(apartment['state']).to include "can't be blank"
        end

        it "cannot create an apartment without square footage" do 
            apartment_params = {
                apartment: {
                    street: "Auto Mall Parkway", 
                    unit: "113",
                    city: "D'Iberville",
                    state: "MS",
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
            expect(apartment['square_footage']).to include "can't be blank"
        end

        it "cannot create an apartment without price" do 
            apartment_params = {
                apartment: {
                    street: "Auto Mall Parkway", 
                    unit: "113",
                    city: "D'Iberville",
                    state: "MS",
                    square_footage: 1200,
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
            expect(apartment['price']).to include "can't be blank"
        end

        it "cannot create an apartment without bedrooms" do 
            apartment_params = {
                apartment: {
                    street: "Auto Mall Parkway", 
                    unit: "113",
                    city: "D'Iberville",
                    state: "MS",
                    square_footage: 1200,
                    price: "1300",
                    bathrooms: 2,
                    pets: "cats and dogs",
                    image: "https://media.apts247.info/ce/ce9560e9239c4c3b8369663b0a699279/floorplans/1196_CoconutPalm_504586.jpg",
                    user_id: user.id
                }
            }
    
            post '/apartments', params: apartment_params
            apartment = JSON.parse(response.body)
            expect(response).to have_http_status(422)
            expect(apartment['bedrooms']).to include "can't be blank"
        end

        it "cannot create an apartment without bathrooms" do 
            apartment_params = {
                apartment: {
                    street: "Auto Mall Parkway", 
                    unit: "113",
                    city: "D'Iberville",
                    state: "MS",
                    square_footage: 1200,
                    price: "1300",
                    bedrooms: 2,
                    pets: "cats and dogs",
                    image: "https://media.apts247.info/ce/ce9560e9239c4c3b8369663b0a699279/floorplans/1196_CoconutPalm_504586.jpg",
                    user_id: user.id
                }
            }
        
            post '/apartments', params: apartment_params
            apartment = JSON.parse(response.body)
            expect(response).to have_http_status(422)
            expect(apartment['bathrooms']).to include "can't be blank"
        end

        it "cannot create an apartment without pets" do 
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
                    image: "https://media.apts247.info/ce/ce9560e9239c4c3b8369663b0a699279/floorplans/1196_CoconutPalm_504586.jpg",
                    user_id: user.id
                }
            }
    
            post '/apartments', params: apartment_params
            apartment = JSON.parse(response.body)
            expect(response).to have_http_status(422)
            expect(apartment['pets']).to include "can't be blank"
        end

        it "cannot create an apartment without image" do 
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
                    user_id: user.id
                }
            }
    
            post '/apartments', params: apartment_params
            apartment = JSON.parse(response.body)
            expect(response).to have_http_status(422)
            expect(apartment['image']).to include "can't be blank"
        end
    end

    describe "PATCH /update" do 
        it "updates an apartment" do 
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
    
          apartment = Apartment.first 
    
          updated_apartment_params = {
            apartment: {
                street: "Auto Mall Parkway",  
                unit: "313",
                city: "D'Iberville",
                state: "MS",
                square_footage: 1200,
                price: "1300",
                bedrooms: 2,
                bathrooms: 2,
                pets: "no pets allowed",
                image: "https://media.apts247.info/ce/ce9560e9239c4c3b8369663b0a699279/floorplans/1196_CoconutPalm_504586.jpg",
                user_id: user.id
            }
          }
    
          patch "/apartments/#{apartment.id}", params: updated_apartment_params
    
          expect(response).to have_http_status(200)
    
          updated_apartment = Apartment.find(apartment.id)
          expect(updated_apartment.unit).to eq "313"
          expect(updated_apartment.pets).to eq 'no pets allowed'
        end
      end

      describe "PATCH /update" do 
        it "cannot update an apartment without all valid attributes" do 
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
    
          apartment = Apartment.first 
    
          updated_apartment_params = {
            apartment: {
                street: "Auto Mall Parkway",
                unit: "",
                city: "Biloxi",
                state: "MS",
                square_footage: 1200,
                price: "1300",
                bedrooms: 2,
                bathrooms: 2,
                pets: "no pets allowed",
                image: "https://media.apts247.info/ce/ce9560e9239c4c3b8369663b0a699279/floorplans/1196_CoconutPalm_504586.jpg",
                user_id: user.id
            }
          }
    
          patch "/apartments/#{apartment.id}", params: updated_apartment_params
    
          expect(response).to have_http_status(422)
          apartment = JSON.parse(response.body)
          expect(apartment['unit']).to include "can't be blank"
        end
      end

      describe "DELETE /destroy" do 
        it "deletes an apartment" do 
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
    
          apartment = Apartment.first 
    
          delete "/apartments/#{apartment.id}"
    
          expect(response).to have_http_status(200)
          apartments = Apartment.all 
          expect(apartments).to be_empty
        end
      end
 end
