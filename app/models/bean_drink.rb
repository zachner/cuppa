class BeanDrink < ApplicationRecord
  # Direct associations

  belongs_to :drink,
             :required => false,
             :counter_cache => true

  belongs_to :bean

  # Indirect associations

  # Validations

end
