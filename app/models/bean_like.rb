class BeanLike < ApplicationRecord
  # Direct associations

  belongs_to :bean,
             :counter_cache => :likes_count

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
