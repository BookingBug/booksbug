class User < ApplicationRecord
  acts_as_paranoid

  before_destroy :if => :has_borrowed_books? { raise HasBorrowedBooks }
  validates :name, presence: true

private

  def has_borrowed_books?
    borrowed_books_ids = Action.of_user(self).of_kind(:borrow).pluck(:book_id)
    returned_books_ids = Action.of_user(self).of_kind(:return).pluck(:book_id)
    (borrowed_books_ids - returned_books_ids).any?
  end

end

class HasBorrowedBooks < StandardError; end