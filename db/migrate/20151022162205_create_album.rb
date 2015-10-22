class CreateAlbum < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.integer :band_id, null: false
      t.string :title, null: false, unique: true
      t.string :format, null: false
    end

    add_index :albums, :band_id
  end
end
