class User < ApplicationRecord
  acts_as_paranoid

  validates :name, presence: true
  before_destroy :has_checkedout_books?

private

  def checked_out_books
    #Action.where(user_id: self.id, kind: :checkout)
  end

  def has_checkedout_books?
    throw(:abort) if checked_out_books && checked_out_books.any?
  end

end