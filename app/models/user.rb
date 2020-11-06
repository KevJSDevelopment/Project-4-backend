class User < ApplicationRecord
    has_many :messages
    has_many :channels, -> { distinct },through: :messages

    validates :username, uniqueness: true, presence: true
end
