class Book < ApplicationRecord
  acts_as_paranoid

  belongs_to :section
  validates :title, :author, presence: true

  before_destroy :is_checked_out?

  def checked_out?
    last_action && last_action.is_checkout?
  end

private

  def last_action
    Action.where(book_id: self.id).order(:created_at, :id).last || false
  end

  def is_checked_out?
    throw(:abort) if checked_out?
  end

end
