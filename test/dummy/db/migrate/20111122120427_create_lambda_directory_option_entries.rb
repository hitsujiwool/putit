class CreateLambdaDirectoryOptionEntries < ActiveRecord::Migration
  def change
    create_table :lambda_directory_option_entries do |t|
      t.string :image

      t.timestamps
    end
  end
end
