class Post < ApplicationRecord
  has_many :images, dependent: :destroy
  accepts_attachments_for :images, attachment: :image
  has_many :tag_relations,dependent: :destroy, foreign_key: 'post_id'
  has_many :tags,through: :tag_relations
  has_many :post_comments, dependent: :destroy
  belongs_to :category
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  enum status: { published: 0, draft: 1 }

  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old|
      self.post_tags.delete TagRelation.find_by(name: old)
    end

    new_tags.each do |new|
     new_tag_relation = Tag.find_or_create_by(name: new)
      self.tags << new_tag_relation
    end
  end

  def review_percentage
      review.to_f*100/5
  end
end
