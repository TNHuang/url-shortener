class ShortenedUrl < ActiveRecord::Base
   validates :shortened_url, :presence => true,
   :uniqueness => true, length: { maximum: 1000 }

   validate :is_spammer?

   belongs_to :submitter,
   class_name: "User",
   foreign_key: :submitter_id,
   primary_key: :id

   has_many :visits,
   class_name: "Visit",
   foreign_key: :url_id,
   primary_key: :id

   has_many :visitors, Proc.new { distinct },
           through: :visits, source: :visitor

   has_many :taggings,
   class_name: "Tagging",
   foreign_key: :url_id,
   primary_key: :id

   has_many :tags, through: :taggings, source: :tag_topic

   def self.random_code
     new_url = SecureRandom::urlsafe_base64(16)
     while self.exists?(:shortened_url => new_url)
       new_url = SecureRandom::urlsafe_base64(16)
     end
     new_url
   end

   def self.create_for_user_and_long_url!(user, long_url)
     self.create!({submitter_id: user.id,
       long_url: long_url,
       shortened_url: self.random_code})
   end

   def num_clicks
     self.visits.select("visitor_id").count
   end

   def num_uniques
     self.visitors.count
   end

   def num_recent_uniques
     self.visits.select("visitor_id").
     where("visits.updated_at >= ?", 10.minutes.ago).
     distinct.count
   end

   def num_of_tags
     self.tags.count
   end

   def is_spammer?

     if (self.submitter.submitted_urls.
     where("shortened_urls.created_at > ?",
     10.minutes.ago).count > 5)
     errors[:base] << "stop spammer!, stop!"
     end
   end
end