class User < ApplicationRecord
  acts_as_paranoid

  before_destroy :if => :has_borrowed_books? { raise HasBorrowedBooks }
  validates :name, presence: true

private

  def has_borrowed_books?
    (borrowed_books_ids - returned_books_ids).any?
  end

  def borrowed_books_ids
    actions.borrows.pluck(:book_id)
  end

  def returned_books_ids
    actions.returns.pluck(:book_id)
  end

  def actions
    Action.of_user(self)
  end

end

class HasBorrowedBooks < StandardError; end