class RecipesController < ApplicationController
  def index
    logger.info "showing all recipes"
    with_ingredients = params[:with_ingredients]
    if !with_ingredients.nil?
      rec_ing = RecipeIngredient.where(ingredient: with_ingredients).group(:recipe)
      @recipes = rec_ing.map(&:recipe)
    else
      @recipes = Recipe.all
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name)
  end
end
