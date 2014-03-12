class User < ActiveRecord::Base


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :books


  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :location, :bio, :photo, :book_title

  mount_uploader :photo, PhotoUploader

end
