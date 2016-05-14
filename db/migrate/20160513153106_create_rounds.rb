class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.references :creator, null: false, index: true
      t.references :prompt, null: false, index: true
      t.datetime :end_time

      t.timestamps null: false
    end
  end
end
