class User < ApplicationRecord
    has_many :messages, class_name: 'Message'
    has_many :comments
end
