class Section < ApplicationRecord
  acts_as_paranoid

  has_many :books

  validates :name, presence: true
  before_destroy :if => :has_books? { raise SectionHasBooksError }

private

  def has_books?
    self.books.any?
  end

end

class SectionHasBooksError < StandardError; end