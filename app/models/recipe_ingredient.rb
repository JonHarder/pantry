class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient

  def name
    ingredient.name
  end

  def in_stock
    ingredient.in_stock
  end
end
