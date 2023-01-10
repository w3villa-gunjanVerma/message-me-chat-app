class User < ApplicationRecord
    has_many :messages
    validates :username , presence: true , length: {minimum: 3 , maximum: 20}
    has_secure_password
end
