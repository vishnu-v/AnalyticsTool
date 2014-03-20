class CreateVisitsTable < ActiveRecord::Migration
  def up
  	  create_table :visits do |t|
      t.integer :website_id, null: false
      t.string :page, null: false
      t.date :visit_date, null: false
      t.integer :visit_count, null: false
      t.string :ip
      t.string :browser
      t.string :device
      t.timestamps
    end
  end

  def down
  	drop_table :visits
  end
end
