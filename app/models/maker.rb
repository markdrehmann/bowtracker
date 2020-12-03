class Maker < ActiveRecord::Base
    has_many :bows
    has_many :users, through: :bows
end