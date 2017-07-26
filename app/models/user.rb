class User < ApplicationRecord
  has_many :books, as: :owner
end
