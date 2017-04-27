class Section < ApplicationRecord
  acts_as_paranoid

  validates :name, presence: true
  has_many :books

  before_destroy :abort_having_books

private

  def abort_having_books
    raise SectionHasBooksError if self.books.any?
  end

end

class SectionHasBooksError < StandardError; end