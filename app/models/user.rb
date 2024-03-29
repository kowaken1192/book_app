class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         mount_uploader :avatar, AvatarUploader
         has_many :reserves
         has_many :rooms
         def self.looks(search, word)
          if search == "perfect_match"
            @user = User.where("name LIKE?", "#{word}")
          elsif search == "forward_match"
            @user = User.where("name LIKE?","#{word}%")
          elsif search == "backward_match"
            @user = User.where("name LIKE?","%#{word}")
          elsif search == "partial_match"
            @user = User.where("name LIKE?","%#{word}%")
          else
            @user = User.all
          end
        end
end
