class IngredientsController < ApplicationController
  before_action :get_recipe, only: [:show, :new, :create, :destroy]

  def index
    @ingredients = Ingredient.all
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    recipe_ingredient = RecipeIngredient.find(params[:recipe_id])
    recipe_ingredient.update(ingredient_amount_params)
    recipe_ingredient.save
    redirect_to edit_recipe_path(recipe_ingredient.recipe)
  end

  def new
    @ingredient = @recipe.ingredients.build
  end

  def create
    @ingredient = Ingredient.find_by(ingredient_params)

    if @ingredient.nil?
      logger.info "ingredient not found in pantry, creating, then adding to recipe"
      @ingredient = Ingredient.new ingredient_params
      @ingredient.in_stock = true
      @ingredient.save
    else
      logger.info "ingredient already in pantry, adding to recipe"
    end

    @recipe.ingredients << @ingredient
    ri = RecipeIngredient.find_by(recipe: @recipe, ingredient: @ingredient)
    ri.amount = params[:recipe_ingredient][:amount]
    ri.save

    redirect_to edit_recipe_path(@recipe)
  end

  def destroy
    ingredient = Ingredient.find(params[:id])
    @recipe.ingredients.delete(ingredient)
    redirect_to edit_recipe_path(@recipe)
  end

  private
  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
  
  def ingredient_amount_params
    params.require(:recipe_ingredient).permit(:amount)
  end

  def get_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end
end
