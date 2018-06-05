class Roaster < ApplicationRecord
  # Direct associations

  has_many   :beans,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
