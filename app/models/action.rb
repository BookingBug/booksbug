class Action < ApplicationRecord
  validates :kind, :created_at, presence: true

  belongs_to :user
  belongs_to :book

  before_create :abort_if_unavailable, :if => :is_checkout?
  before_create :abort_if_available, :if => :is_return?

  def is_checkout?
    self.kind.to_sym == :checkout
  end

  def is_return?
    self.kind.to_sym == :return
  end

private

  def abort_if_unavailable
    raise BookAlreadyCheckedOutError if self.book.checked_out?
  end

  def abort_if_available
    raise BookAlreadyAvailableError if self.book.available?
  end

end

class BookAlreadyCheckedOutError < StandardError; end
class BookAlreadyAvailableError < StandardError; end