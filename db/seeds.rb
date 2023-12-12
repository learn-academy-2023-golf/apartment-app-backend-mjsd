user1 = User.where(email: "test1@example.com").first_or_create(password: "password", password_confirmation: "password")

user2 = User.where(email: "test2@example.com").first_or_create(password: "password", password_confirmation: "password")

user1_apartments = [
    {
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
    }
]

user2_apartments = [
    {
        street: "Uvalde Road",
        unit: "7100",
        city: "Houston",
        state: "TX",
        square_footage: 1250,
        price: "1900",
        bedrooms: 2,
        bathrooms: 2,
        pets: "cats and dogs",
        image: "https://domaintowncenter.com/assets/images/b2_single1.svg"
    }
]

user1_apartments.each do |apartment| 
    user1.apartments.create(apartment)
    p "created: #{apartment}"
  end
  
  user2_apartments.each do |apartment| 
    user2.apartments.create(apartment)
    p "created: #{apartment}"
  end