class Book < ApplicationRecord
  after_create_commit { broadcast_prepend_to :books }
  after_update_commit { broadcast_replace_to "book_#{id}" }
  validates :title, :description, presence: true
end
