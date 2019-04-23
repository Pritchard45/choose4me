class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.integer :value
      t.references :user, foreign_key: true
      t.references :option, foreign_key: true

      t.timestamps
    end
  end
end
