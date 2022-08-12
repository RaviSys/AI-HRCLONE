class Document < ApplicationRecord
  belongs_to :user
  has_one_attached :doc
  validates :name, presence: true, uniqueness: true
end
