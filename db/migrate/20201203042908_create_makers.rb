class CreateMakers < ActiveRecord::Migration
  def change
    create_table :makers do |t|
      t.string :name
      t.string :nationality
      t.integer :year_born
      t.integer :year_died
      t.string :city
      t.string :bio
    end
  end
end
