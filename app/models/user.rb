class User < ActiveRecord::Base
    has_secure_password
    has_many :bows
    has_many :makers, through: :bows
end