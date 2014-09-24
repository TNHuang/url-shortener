class Visit < ActiveRecord::Base
  validates :visitor_id, :url_id, presence: true

  belongs_to :visitor,
  class_name: "User",
  foreign_key: :visitor_id,
  primary_key: :id

  belongs_to :visited_shortened_url,
  class_name: "ShortenedUrl",
  foreign_key: :url_id,
  primary_key: :id

end