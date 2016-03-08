class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.datetime :timestamp
      t.string :code
      t.text :message

      t.timestamps null: false
    end
  end
end
