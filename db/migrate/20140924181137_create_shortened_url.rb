class CreateShortenedUrl < ActiveRecord::Migration
  def change
    create_table :shortened_urls do |t|
      t.integer :submitter_id
      t.string :long_url, :limit => 1000
      t.string :short_url

      t.timestamps
    end

    add_index :shortened_urls, :submitter_id
    add_index :shortened_urls, :short_url
  end
end
