class Drink < ApplicationRecord
  # Direct associations

  has_many   :bean_drinks,
             :dependent => :destroy

  # Indirect associations

  has_many   :beans,
             :through => :bean_drinks,
             :source => :bean

  # Validations

end
