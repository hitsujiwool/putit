class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :thumbnail
      t.string :image

      t.timestamps
    end
  end
end
