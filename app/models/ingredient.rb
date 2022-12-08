class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  def in_stock_str
    in_stock ? "Yes" : "No"
  end
end
