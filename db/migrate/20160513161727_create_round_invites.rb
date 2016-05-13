class CreateRoundInvites < ActiveRecord::Migration
  def change
    create_table :round_invites do |t|
      t.references :round, null: false, index: true
      t.references :invite, null: false, index: true

      t.timestamps null: false
    end
  end
end
