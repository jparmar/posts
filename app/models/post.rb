class Post < ApplicationRecord
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :tags

  validates_presence_of :title, :body
  validates :title, length: { maximum: 50 }
  validates :body, length: { maximum: 200 }

  STATES = ["draft", "published", "archived"]
  scope :draft, -> { where(state: 'draft') }
  scope :published, -> { where(state: 'published') }
  scope :archived, -> { where(state: 'archived') }

  def activable?
    self.state == "draft"
  end
end
