class CreateTagMaps < ActiveRecord::Migration
  def change
    create_table :tag_maps do |t|
      t.references :prototype, foreign_key: :true
      t.references :tag, foreign_key: :true

      t.timestamps
    end
  end
end
