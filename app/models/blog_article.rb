class BlogArticle < ApplicationRecord
  validates :title, :url, presence: true
end
