require "test_helper"

class RecipeTest < ActiveSupport::TestCase
  def setup
    @recipe = Recipe.find_by(name: "Butter Chicken")
  end

  
  test "should find all recipes" do
    assert_equal 2, Recipe.count
  end

  test "recipe with 2 ingredients should have 2 ingredients" do
    assert_equal 2, @recipe.ingredients.count
  end

  test "should respond true when all ingredients are in stock" do
    assert @recipe.in_stock
  end

  test "should respond false when an ingredient is not in stock" do
    r = Recipe.find_by(name: "Poison Death")
    assert !r.in_stock
  end
end
