class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def ingredients
    @list = []
    dishes.each do |dish|
       dish.ingredients.reduce([]) do |list, ingredient|
        @list << ingredient
        @list
      end
    end
    @list
  end
end
