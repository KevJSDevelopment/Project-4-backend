class User < ApplicationRecord
    has_many :messages
    has_many :channels, -> { distinct },through: :messages
    has_secure_password


    validates :username, uniqueness: true, presence: true
    validates :username, uniqueness: { case_sensitive: false }

end
