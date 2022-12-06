class ShoppingController < ApplicationController
  def index
    recipe = params[:for_recipe] ? Recipe.find(params[:for_recipe]) : nil
    if recipe
      ingredients = recipe.ingredients.where(in_stock: false)
    else
      ingredients = Ingredient.where(in_stock: false)
    end
    render json: ingredients
  end
end
