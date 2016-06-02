class AddIngredientToDose < ActiveRecord::Migration
  def change
    add_reference :doses, :ingredient, index: true, foreign_key: true
  end
end
