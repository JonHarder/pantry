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
