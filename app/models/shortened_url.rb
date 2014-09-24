class ShortenedUrl < ActiveRecord::Base
   validates :shortened_url, :presence => true, :uniqueness => true
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

   belongs_to :submitter,
   class_name: "User",
   foreign_key: :submitter_id,
   primary_key: :id



end