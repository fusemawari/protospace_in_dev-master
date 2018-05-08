class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :captured_images, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments,dependent: :destroy
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps, dependent: :destroy

  accepts_nested_attributes_for :captured_images, reject_if: :reject_sub_images
  accepts_nested_attributes_for :tags, reject_if: :reject_tags, allow_destroy: true

  validates :title,
            :catch_copy,
            :concept,
            presence: true

def reject_tags(attributes)
    exists = attributes[:id].present?
    empty = attributes[:name].blank?
    attributes.merge!(_destroy: 1) if exists && empty
    !exists && empty
  end

  def reject_sub_images(attributed)
    attributed['content'].blank?
  end

  def set_main_thumbnail
    captured_images.main.first.content
  end

  def posted_date
    created_at.strftime('%b %d %a')
  end

  def like_user(user_id)
   likes.find_by(user_id: user_id)
  end

   def save_tags(name_tags)
    current_tags = Tag.pluck(:name) unless Tag.nil?
    old_tags = current_tags - name_tags.pluck(:name)
    new_tags = name_tags.pluck(:name) - current_tags

    # Destroy old taggings:
    old_tags.each do |old_name|
      name_tags.pluck(:name).delete Tag.find_by(name:old_name)
    end

    # Create new taggings:
    new_tags.each do |new_name|
      prototype_tag = Tag.find_or_create_by(name:new_name)
      name_tags << prototype_tag
    end
  end
end
