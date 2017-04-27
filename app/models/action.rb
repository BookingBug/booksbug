class Action < ApplicationRecord

  belongs_to :user
  belongs_to :book

  before_create :if => :return? { raise NotBorrowedError if self.book.available? }
  before_create :if => :borrow? { raise AlreadyBorrowedError if self.book.borrowed? }
  validates :kind, :created_at, presence: true

  scope :of_user, ->(user) { where(user_id: user.id) }
  scope :of_book, ->(book) { where(book_id: book.id) }
  scope :order_by_newest, -> { order(:created_at, :id) }
  scope :borrows, -> { where(kind: :borrow) }
  scope :returns, -> { where(kind: :return) }

  def borrow?
    self.kind.to_sym == :borrow
  end

  def return?
    self.kind.to_sym == :return
  end

  def self.status_of(book)
    Action.of_book(book).order_by_newest.last || Action.new(kind: :none)
  end

end

class NotBorrowedError < StandardError; end
class AlreadyBorrowedError < StandardError; end