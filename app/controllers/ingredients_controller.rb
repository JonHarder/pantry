class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.order(in_stock: :desc)
  end

  def show
    @ingredient = Ingredient.find(params[:id])
    @recipes = []
  end

  def update_recipe_ingredients
    
  end
end
