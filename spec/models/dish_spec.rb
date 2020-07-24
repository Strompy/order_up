require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :dish_ingredients}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end
  describe "instance methods" do
    before :each do
      @chef = Chef.create!(name: "Boy R Dee")
      @dish1 = @chef.dishes.create!(name: "Ravioli", description: "Like a an explosion of flavor")
      @ingredient1 = Ingredient.create!(name: "Pasta", calories: 1_000)
      @ingredient2 = Ingredient.create!(name: "Cheese", calories: 500)
      @ingredient3 = Ingredient.create!(name: "Sauce", calories: 10)
      DishIngredient.create!(ingredient: @ingredient1, dish: @dish1)
      DishIngredient.create!(ingredient: @ingredient2, dish: @dish1)
      DishIngredient.create!(ingredient: @ingredient3, dish: @dish1)
    end
    it "#total_calories" do
      expect(@dish1.total_calories).to eq(1_510)
    end
  end
end
