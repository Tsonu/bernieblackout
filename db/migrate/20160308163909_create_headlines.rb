class CreateHeadlines < ActiveRecord::Migration
  def change
    create_table :headlines do |t|
      t.text :headline_text
      t.boolean :is_repeat
      t.boolean :is_primary
      t.boolean :has_moved
      t.belongs_to :response, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
