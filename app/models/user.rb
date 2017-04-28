class User < ApplicationRecord
  acts_as_paranoid

  before_destroy :if => :has_borrowed_books? { raise HasBorrowedBooks }
  validates :name, presence: true

private

  def has_borrowed_books?
    actions.borrows.count > actions.returns.count
  end

  def actions
    Action.of_user(self)
  end

end

class HasBorrowedBooks < StandardError; end