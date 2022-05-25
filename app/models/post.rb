class Post < ApplicationRecord
  attachment :image
  has_many :tag_relations,dependent: :destroy, foreign_key: 'post_id'
  has_many :tags,through: :tag_relations
  belongs_to :category

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
end
