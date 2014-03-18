class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :page_id
      t.integer :visit_count
      t.date :visit_date
      t.string :browser
      t.string :device
      t.string :ip

      t.timestamps
    end
  end
end
