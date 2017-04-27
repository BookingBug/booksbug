class Book < ApplicationRecord
  acts_as_paranoid

  belongs_to :section
  validates :title, :author, presence: true

  before_destroy :abort_if_checked_out

  def checked_out?
    last_action.is_checkout?
  end

  def available?
    !checked_out?
  end

private

  def last_action
    Action.where(book_id: self.id).order(:created_at, :id).last || Action.new(kind: :none)
  end

  def abort_if_checked_out
    raise HasToBeReturnedError if checked_out?
  end

end

class HasToBeReturnedError < StandardError; end