class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.datetime :response_time
      t.text :raw_html
      t.belongs_to :source, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
