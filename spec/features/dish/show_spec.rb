require 'rails_helper'

RSpec.describe "Dish Show Page" do
  it "shows a list of ingredients and the chef's name" do
    @chef = Chef.create!(name: "Boy R Dee")
    @dish1 = @chef.dishes.create!(name: "Ravioli", description: "Like a an explosion of flavor")
    @ingredient1 = Ingredient.create!(name: "Pasta", calories: 1_000)
    @ingredient2 = Ingredient.create!(name: "Cheese", calories: 500)
    @ingredient3 = Ingredient.create!(name: "Sauce", calories: 10)
    DishIngredient.create!(ingredient: @ingredient1, dish: @dish1)
    DishIngredient.create!(ingredient: @ingredient2, dish: @dish1)
    DishIngredient.create!(ingredient: @ingredient3, dish: @dish1)

    visit "/dish/#{@dish1.id}"
    
    expect(page).to have_content(@ingredient1.name)
    expect(page).to have_content(@ingredient2.name)
    expect(page).to have_content(@ingredient3.name)
    expect(page).to have_content(@chef.name)
  end
end

# Story 1 of 3
# As a visitor
# When I visit a dish's show page
# I see a list of ingredients for that dish
# and the chef's name
