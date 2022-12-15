class AddDefaultValueToIngredientInStock < ActiveRecord::Migration[7.0]
  def change
    change_column_default :ingredients, :in_stock, from: nil, to: true
  end
end
