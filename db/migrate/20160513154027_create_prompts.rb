class CreatePrompts < ActiveRecord::Migration
  def change
    create_table :prompts do |t|
      t.references :deck, null: false, index: true, foreign_key: true
      t.string :body, null: false, unique: true, index: true

      t.timestamps null: false
    end
  end
end
