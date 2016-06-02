class CreateDoses < ActiveRecord::Migration
  def change
    create_table :doses do |t|
      t.string :description

      t.timestamps null: false
    end
  end
end
