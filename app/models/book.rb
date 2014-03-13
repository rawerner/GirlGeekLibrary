class Book < ActiveRecord::Base
  # validates :user_id, presence: true

  belongs_to :user

  attr_accessible :title, :author, :cover_thumbnail, :cover_image,
                  :content_version, :publisher, :published_date,
                  :description, :categories, :average_rating,
                  :ratings_count, :user_id

end

