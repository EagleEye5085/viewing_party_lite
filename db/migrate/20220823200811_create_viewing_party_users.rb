class CreateViewingPartyUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :viewing_party_users do |t|
      t.references :viewing_party, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
