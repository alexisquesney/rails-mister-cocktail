class AddCocktailToDose < ActiveRecord::Migration
  def change
    add_reference :doses, :cocktail, index: true, foreign_key: true
  end
end
