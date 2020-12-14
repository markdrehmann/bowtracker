class Bow < ActiveRecord::Base
    belongs_to :user
    belongs_to :maker, required: true

    validates :instrument, presence: true
end