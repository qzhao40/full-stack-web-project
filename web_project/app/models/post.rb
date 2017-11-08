class Post < ApplicationRecord
  belongs_to :user

  scope :published, ->{ where.not(published_at: nill) }
  scope :published, ->{ where(published_at: nill) }

end
