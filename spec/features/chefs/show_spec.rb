require 'rails_helper'

RSpec.describe "Chef Show Page" do
  before :each do
    @chef1 = Chef.create!(name: "Boy R Dee")
    @dish1 = @chef1.dishes.create!(name: "Ravioli", description: "Like a an explosion of flavor")
    @ingredient1 = Ingredient.create!(name: "Pasta", calories: 1_000)
    @ingredient2 = Ingredient.create!(name: "Cheese", calories: 500)
    @ingredient3 = Ingredient.create!(name: "Sauce", calories: 10)
    DishIngredient.create!(ingredient: @ingredient1, dish: @dish1)
    DishIngredient.create!(ingredient: @ingredient2, dish: @dish1)
    DishIngredient.create!(ingredient: @ingredient3, dish: @dish1)
  end

  it "shows a chef's name and link to ingredients" do
    visit "/chefs/#{@chef1.id}"

    expect(page).to have_content(@chef1.name)
    expect(page).to have_link("Favorite Ingredients")
  end
  it "chef's ingredient index shows a list of all ingredients chef uses" do
    visit "/chefs/#{@chef1.id}"
    click_on "Favorite Ingredients"
    expect(page).to have_content(@ingredient1.name)
    expect(page).to have_content(@ingredient2.name)
    expect(page).to have_content(@ingredient3.name)
    expect(page).to have_content(@chef1.name)
  end
end
