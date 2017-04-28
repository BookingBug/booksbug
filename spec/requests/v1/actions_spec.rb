require 'rails_helper'

RSpec.describe 'Actions' do

  let(:book) { create(:book) }
  let(:bob) { create(:user) }

  it 'borrows a book' do
    post "/api/v1/books/#{book.id}/borrow?user_id=#{bob.id}"
    expect(response).to be_success
    book.reload
    expect(book.borrowed?).to be_truthy
  end

  it 'returns out a book' do
    create(:action, kind: :borrow, book: book, user: bob)
    post "/api/v1/books/#{book.id}/return?user_id=#{bob.id}"
    expect(response).to be_success
    book.reload
    expect(book.available?).to be_falsey
  end

end