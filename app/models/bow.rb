class Bow < ActiveRecord::Base
    belongs_to :user
    belongs_to :maker
end