class Book < ApplicationRecord
  belongs_to :owner, polymorphic: true
end
