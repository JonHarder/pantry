class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  def in_stock_str
    in_stock ? "Yes" : "No"
  end

  def amount_for(recipe)
    recipe_ingredients.find_by(recipe: recipe).amount
  end

  def set_amount_for(recipe, amount)
    recipe_ingredient = recipe_ingredients.find_by(recipe: recipe)
    unless recipe_ingredient.nil?
      recipe_ingredient.amount = amount
      recipe_ingredient.save
    end
  end
end
