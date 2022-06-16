class CreateMissions < ActiveRecord::Migration[7.0]
  def change
    create_table :missions do |t|
      t.string :name
      t.integer :scientist_id
      t.integer :planet_id

      # t.belongs_to :scientist, null: false, foreign_key: true
      # t.belongs_to :planet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
