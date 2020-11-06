class User < ApplicationRecord
    has_many :messages
    has_many :channels, -> { distinct },through: :messages

    #testing

    validates :username, uniqueness: true, presence: true
end
