class CreateValidateOptionEntries < ActiveRecord::Migration
  def change
    create_table :validate_option_entries do |t|
      t.string :image

      t.timestamps
    end
  end
end
