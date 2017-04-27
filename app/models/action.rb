class Action < ApplicationRecord
  validates :user_id, :book_id, :kind, :created_at, presence: true

  belongs_to :user
  belongs_to :book

  before_create :is_already_checked_out?

  before_create :is_not_checked_out?

  def is_checkout?
    self.kind.to_sym == :checkout
  end

  def is_return?
    self.kind.to_sym == :return
  end

private

  def is_already_checked_out?
    raise BookAlreadyCheckedOut if is_checkout? && self.book.checked_out?
  end

  def is_not_checked_out?
    raise NotCheckedOut if is_return? && !self.book.checked_out?
  end

end

class BookAlreadyCheckedOut < StandardError; end
class NotCheckedOut < StandardError; end