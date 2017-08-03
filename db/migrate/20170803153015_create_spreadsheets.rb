class CreateSpreadsheets < ActiveRecord::Migration
  def change
    create_table :spreadsheets do |t|

      t.timestamps null: false
    end
  end
end
