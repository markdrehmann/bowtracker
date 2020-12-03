class CreateBows < ActiveRecord::Migration
  def change
    create_table :bows do |t|
      t.integer :user_id
      t.integer :maker_id
      t.string :instrument
      t.string :brand
      t.integer :last_sold_price
      t.string :last_sold_date
      t.string :year_made
      t.string :weight
      t.string :balance
      t.string :length
      t.string :strength
      t.string :materials
      t.string :shape
      t.string :notes
    end
  end
end
