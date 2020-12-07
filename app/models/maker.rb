class Maker < ActiveRecord::Base
    has_many :bows
    has_many :users, through: :bows

    validates :name, presence: true
end