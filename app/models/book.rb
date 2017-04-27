class Book < ApplicationRecord
  acts_as_paranoid

  belongs_to :section

  validates :title, :author, presence: true
  before_destroy :if => :borrowed? { raise HasToBeReturnedError }

  def borrowed?
    Action.status_of(self).borrow?
  end

  def available?
    !borrowed?
  end

end

class HasToBeReturnedError < StandardError; end