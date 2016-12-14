class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    has_many :messages, class_name: 'Message'
    has_many :comments

    def email_required?
        false
    end

    def email_changed?
        false
    end


end
