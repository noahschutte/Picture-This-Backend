class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.references :round, null: false, index: true
      t.references :user, null: false, index: true
      t.references :prompt, null: false, index: true

      t.timestamps null: false
    end
  end
end
