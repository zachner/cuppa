class Drink < ApplicationRecord
  # Direct associations

  has_many   :bean_drinks,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
