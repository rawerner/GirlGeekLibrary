

FactoryGirl.define do


  sequence(:author) { |n| "book_author#{n}" }
  sequence(:cover_thumbnail) { |n| "book_cover_thumbnail#{n}" }
  sequence(:cover_image) { |n| "book_cover_image#{n}" }
  sequence(:publisher) { |n| "book_publisher#{n}" }
  sequence(:publish_date) { |n| "book_publish_date#{n}" }
  sequence(:description) { |n| "book_description#{n}" }
  sequence(:owner) { |n| "book_owner#{n}" }



  factory :book do
    sequence(:title) { |n| "book_title#{n}" }


  end

  # factory :user do |f|
  #   f.name "Rachel Werner"
  #   f.email "rachel@ghotmail.com"
  #   f.password "password2"
  # end

  # factory :invalid_user, parent: :user do |f|
  #   f.email nil
  # end
end