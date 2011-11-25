class CreateStringDirectoryOptionEntries < ActiveRecord::Migration
  def change
    create_table :string_directory_option_entries do |t|
      t.string :image

      t.timestamps
    end
  end
end
