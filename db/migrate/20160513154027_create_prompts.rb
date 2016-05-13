class CreatePrompts < ActiveRecord::Migration
  def change
    create_table :prompts do |t|
      t.references :deck, null: false, index: true
      t.string :body, null: false, unique: true, index: true

      t.timestamps null: false
    end
  end
end
