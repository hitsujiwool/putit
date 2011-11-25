class CreateArrayDirectoryOptionEntries < ActiveRecord::Migration
  def change
    create_table :array_directory_option_entries do |t|
      t.string :image

      t.timestamps
    end
  end
end
