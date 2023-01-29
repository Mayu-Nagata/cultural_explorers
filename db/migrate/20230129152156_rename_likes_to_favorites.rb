class RenameLikesToFavorites < ActiveRecord::Migration[6.1]
  def up
    rename_table :likes, :favorites
  end

  def down
    rename_table :favorites, :likes
  end

end
