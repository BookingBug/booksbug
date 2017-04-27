class Section < ApplicationRecord
  acts_as_paranoid

  validates :name, presence: true
  has_many :books

  before_destroy :has_books?

private

  def has_books?
    throw(:abort) if self.books.any?
  end

end
