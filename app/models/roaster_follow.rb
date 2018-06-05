class RoasterFollow < ApplicationRecord
  # Direct associations

  belongs_to :roaster,
             :counter_cache => true

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
