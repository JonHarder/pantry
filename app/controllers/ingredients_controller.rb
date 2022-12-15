class IngredientsController < ApplicationController
  before_action :get_recipe, only: [:show, :update, :new, :create, :destroy]

  def index
    @ingredients = Ingredient.all
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    @ingredient.update(ingredient_params)
    if @ingredient.save
      redirect_to @ingredient
    end
  end

  def new
    @ingredient = @recipe.ingredients.build
  end

  def create
    @ingredient = Ingredient.find_by(ingredient_params)

    if @ingredient.nil?
      logger.info "ingredient not found in pantry, creating"
      @ingredient = Ingredient.build(ingredient_params)
      @ingredient.in_stock = true
      @ingredient.save
    end

    @recipe.ingredients << @ingredient

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

  def get_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end
end
