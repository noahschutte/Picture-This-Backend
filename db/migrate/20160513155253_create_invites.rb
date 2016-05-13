class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.references :round, null: false, index: true
      t.string :phone, null: false, unique: true, index: true
      t.string :email, null: false, unique: true, index: true

      t.timestamps null: false
    end
  end
end
