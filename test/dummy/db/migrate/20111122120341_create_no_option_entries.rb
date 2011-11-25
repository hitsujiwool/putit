class CreateNoOptionEntries < ActiveRecord::Migration
  def change
    create_table :no_option_entries do |t|
      t.string :image

      t.timestamps
    end
  end
end
