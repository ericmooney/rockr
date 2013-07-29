class CreateConcerts < ActiveRecord::Migration
  def change
    create_table :concerts do |t|
      t.string :artist_name
      t.datetime :date
      t.references :venue

      t.timestamps
    end
    add_index :concerts, :venue_id
  end
end
