class User < ApplicationRecord
    has_many :messages
    has_many :channels, through: :messages

    validates :username, uniqueness: true, presence: true
end
