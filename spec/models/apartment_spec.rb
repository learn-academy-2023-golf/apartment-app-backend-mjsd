require 'rails_helper'

RSpec.describe Apartment, type: :model do
  let(:user) { User.create(
    email: 'test@example.com',
    password: 'password',
    password_confirmation: 'password'
    )
  }

  it 'should validate street' do
    apartment = user.apartments.create(
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
    expect(apartment.errors[:street]).to include("can't be blank")
  end

  it 'should validate unit' do
    apartment = user.apartments.create(
      street: "Auto Mall Parkway",
      city: "D'Iberville",
      state: "MS",
      square_footage: 1200,
      price: "1300",
      bedrooms: 2,
      bathrooms: 2,
      pets: "cats and dogs",
      image: "https://media.apts247.info/ce/ce9560e9239c4c3b8369663b0a699279/floorplans/1196_CoconutPalm_504586.jpg"
    )
    expect(apartment.errors[:unit]).to include("can't be blank")
  end

  it 'should validate city' do
    apartment = user.apartments.create(
      street: "Auto Mall Parkway",
      unit: "113",
      state: "MS",
      square_footage: 1200,
      price: "1300",
      bedrooms: 2,
      bathrooms: 2,
      pets: "cats and dogs",
      image: "https://media.apts247.info/ce/ce9560e9239c4c3b8369663b0a699279/floorplans/1196_CoconutPalm_504586.jpg"
    )
    expect(apartment.errors[:city]).to include("can't be blank")
  end

  it 'should validate state' do
    apartment = user.apartments.create(
      street: "Auto Mall Parkway",
      unit: "113",
      city: "D'Iberville",
      square_footage: 1200,
      price: "1300",
      bedrooms: 2,
      bathrooms: 2,
      pets: "cats and dogs",
      image: "https://media.apts247.info/ce/ce9560e9239c4c3b8369663b0a699279/floorplans/1196_CoconutPalm_504586.jpg"
    )
    expect(apartment.errors[:state]).to include("can't be blank")
  end

  it 'should validate square_footage' do
    apartment = user.apartments.create(
      street: "Auto Mall Parkway",
      unit: "113",
      city: "D'Iberville",
      state: "MS",
      price: "1300",
      bedrooms: 2,
      bathrooms: 2,
      pets: "cats and dogs",
      image: "https://media.apts247.info/ce/ce9560e9239c4c3b8369663b0a699279/floorplans/1196_CoconutPalm_504586.jpg"
    )
    expect(apartment.errors[:square_footage]).to include("can't be blank")
  end

  it 'should validate price' do
    apartment = user.apartments.create(
      street: "Auto Mall Parkway",
      unit: "113",
      city: "D'Iberville",
      state: "MS",
      square_footage: 1200,
      bedrooms: 2,
      bathrooms: 2,
      pets: "cats and dogs",
      image: "https://media.apts247.info/ce/ce9560e9239c4c3b8369663b0a699279/floorplans/1196_CoconutPalm_504586.jpg"
    )
    expect(apartment.errors[:price]).to include("can't be blank")
  end

  it 'should validate bedrooms' do
    apartment = user.apartments.create(
      street: "Auto Mall Parkway",
      unit: "113",
      city: "D'Iberville",
      state: "MS",
      square_footage: 1200,
      price: "1300",
      bathrooms: 2,
      pets: "cats and dogs",
      image: "https://media.apts247.info/ce/ce9560e9239c4c3b8369663b0a699279/floorplans/1196_CoconutPalm_504586.jpg"
    )
    expect(apartment.errors[:bedrooms]).to include("can't be blank")
  end

  it 'should validate bathrooms' do
    apartment = user.apartments.create(
      street: "Auto Mall Parkway",
      unit: "113",
      city: "D'Iberville",
      state: "MS",
      square_footage: 1200,
      price: "1300",
      bedrooms: 2,
      pets: "cats and dogs",
      image: "https://media.apts247.info/ce/ce9560e9239c4c3b8369663b0a699279/floorplans/1196_CoconutPalm_504586.jpg"
    )
    expect(apartment.errors[:bathrooms]).to include("can't be blank")
  end

  it 'should validate pets' do
    apartment = user.apartments.create(
      street: "Auto Mall Parkway",
      unit: "113",
      city: "D'Iberville",
      state: "MS",
      square_footage: 1200,
      price: "1300",
      bedrooms: 2,
      bathrooms: 2,
      image: "https://media.apts247.info/ce/ce9560e9239c4c3b8369663b0a699279/floorplans/1196_CoconutPalm_504586.jpg"
    )
    expect(apartment.errors[:pets]).to include("can't be blank")
  end

  it 'should validate image' do
    apartment = user.apartments.create(
      street: "Auto Mall Parkway",
      unit: "113",
      city: "D'Iberville",
      state: "MS",
      square_footage: 1200,
      price: "1300",
      bedrooms: 2,
      bathrooms: 2,
      pets: "cats and dogs"
    )
    expect(apartment.errors[:image]).to include("can't be blank")
  end
end
