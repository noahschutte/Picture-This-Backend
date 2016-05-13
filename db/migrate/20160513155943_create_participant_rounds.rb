class CreateParticipantRounds < ActiveRecord::Migration
  def change
    create_table :participant_rounds do |t|
      t.references :round, null: false, index: true, foreign_key: true
      t.references :participant, null: false, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
