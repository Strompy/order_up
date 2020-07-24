require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end
  describe "instance methods" do
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
    it "#ingredients" do
      expect(@chef1.ingredients).to eq([@ingredient1, @ingredient2, @ingredient3])
    end
  end
end
