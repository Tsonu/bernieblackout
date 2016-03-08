class ChangeHtmlToLongtext < ActiveRecord::Migration
  def change
    change_column :responses, :raw_html, :longtext
  end
end
