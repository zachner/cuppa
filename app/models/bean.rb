class Bean < ApplicationRecord
  # Direct associations

  belongs_to :roaster,
             :counter_cache => true

  has_many   :likes,
             :class_name => "BeanLike",
             :dependent => :destroy

  has_many   :bean_drinks,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :bean, :presence => true

end
