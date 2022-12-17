ingredients = Ingredient.create(
  [{name: "Butter", in_stock: true},
   {name: "Salt", in_stock: true},
   {name: "Garam Masala", in_stock: false},
   {name: "Chicken", in_stock: true}
  ]
)
Ingredient.create(name: "Chick Peas", in_stock: false)

recipe = Recipe.create(name: "Butter Chicken")
recipe.ingredients = ingredients

recipe.ingredients.find_by(name: "Butter").set_amount_for(recipe, "2 Tablespoons")
recipe.ingredients.find_by(name: "Salt").set_amount_for(recipe, "2 Teaspoons")
recipe.ingredients.find_by(name: "Garam Masala").set_amount_for(recipe, "1 Tablespoon")
recipe.ingredients.find_by(name: "Chicken").set_amount_for(recipe, "1 Pound")
