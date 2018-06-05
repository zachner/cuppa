class Roaster < ApplicationRecord
  # Direct associations

  has_many   :roaster_follows,
             :dependent => :destroy

  has_many   :beans,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
