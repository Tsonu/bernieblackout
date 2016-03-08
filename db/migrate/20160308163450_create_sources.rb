class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.text :url
      t.string :main_header_id
      t.string :main_header_class
      t.string :sub_header_id
      t.string :sub_header_class

      t.timestamps null: false
    end
  end
end
