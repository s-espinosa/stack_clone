class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :text
      t.references :user, foreign_key: true
      t.integer :commentable_id
      t.string :commentable_type

      t.timestamps
    end
  end
end
