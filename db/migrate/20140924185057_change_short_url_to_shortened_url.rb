class ChangeShortUrlToShortenedUrl < ActiveRecord::Migration
  def change
    rename_column :shortened_urls, :short_url, :shortened_url
  end
end
