class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def fav_ingredients
    dishes.joins(:ingredients).distinct.pluck('ingredients.name')
  end

  def popular
    dishes.joins(:ingredients).select('ingredients.name').limit(3)
    # require "pry"; binding.pry
  end
end
