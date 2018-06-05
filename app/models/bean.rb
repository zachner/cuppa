class Bean < ApplicationRecord
  # Direct associations

  has_many   :bean_drinks,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :bean, :presence => true

end
