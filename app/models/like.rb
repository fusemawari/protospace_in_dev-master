class Like < ActiveRecord::Base
  belongs_to :prototype, counter_cache: :likes_count
  belongs_to :user
  validates_uniqueness_of :prototype_id, scope: :user_id
end
