class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.references :creator, null: false, index: true
      t.references :prompt, null: false, index: true

      t.timestamps null: false
    end
  end
end
