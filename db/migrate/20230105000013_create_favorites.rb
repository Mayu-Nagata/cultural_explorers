class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :Favorites do |t|
      t.references :post, foreign_key: true, null: false
      t.references :end_user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
