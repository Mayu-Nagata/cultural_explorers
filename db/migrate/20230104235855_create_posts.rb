class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :end_user, foreign_key: true, null: false
      t.string :title, null: false
      t.text :text, null: false
      t.text :comment, null: false


      t.timestamps
    end
  end
end
