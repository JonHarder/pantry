require "test_helper"

class RecipesControllerTest < ActionDispatch::IntegrationTest
  test "should get all recipes" do
    get recipes_path
    assert_response :success
  end

  test "should get one recipe" do
    recipe = Recipe.find_by(name: "Butter Chicken")
    get recipe_path(recipe)
    assert_response :success
  end
end
