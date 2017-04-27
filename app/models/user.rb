class User < ApplicationRecord
  acts_as_paranoid

  validates :name, presence: true
  before_destroy :abort_having_checked_out_books

  def checked_out_books
    Action.where(user_id: self.id, kind: :checkout)
  end

private

  def abort_having_checked_out_books
    raise HasCheckedOutBooks if checked_out_books.any?
  end

end

class HasCheckedOutBooks < StandardError; end