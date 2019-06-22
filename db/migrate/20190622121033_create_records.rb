class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.references :user, foreign_key: true
      t.date :r_date
      t.text :comment

      t.timestamps
    end
  end
end
