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
    it "#fav_ingredients" do
      expect(@chef1.fav_ingredients).to eq([@ingredient2.name, @ingredient1.name, @ingredient3.name])
    end
    it "#popular" do
      chef1 = Chef.create!(name: "Boy R Dee")
      dish1 = chef1.dishes.create!(name: "Ravioli", description: "Like a an explosion of flavor")
      ingredient1 = Ingredient.create!(name: "Pasta", calories: 1_000)
      ingredient2 = Ingredient.create!(name: "Cheese", calories: 500)
      ingredient3 = Ingredient.create!(name: "Sauce", calories: 10)
      ingredient4 = Ingredient.create!(name: "Butter", calories: 10_000)
      ingredient5 = Ingredient.create!(name: "Spinach", calories: 0)
      DishIngredient.create!(ingredient: ingredient1, dish: dish1)
      DishIngredient.create!(ingredient: ingredient2, dish: dish1)
      DishIngredient.create!(ingredient: ingredient3, dish: dish1)
      DishIngredient.create!(ingredient: ingredient4, dish: dish1)
      DishIngredient.create!(ingredient: ingredient5, dish: dish1)
      dish2 = chef1.dishes.create!(name: "Mac and Cheese", description: "Tasty cheese all up in this b")
      DishIngredient.create!(ingredient: ingredient1, dish: dish2)
      DishIngredient.create!(ingredient: ingredient2, dish: dish2)
      DishIngredient.create!(ingredient: ingredient3, dish: dish2)

      expect(chef1.popular).to eq([@ingredient1, @ingredient2, @ingredient3])
    end
  end
end
