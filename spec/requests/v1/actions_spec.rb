# require 'rails_helper'

# RSpec.describe 'Actions' do
#   skip
#   let(:book) { create(:book) }
#   let(:bob) { create(:user) }
#   let(:bob_borrows) { create(:action, kind: :borrow, book: book, user: bob) }

#   it 'checks out a book' do
#     post "/api/v1/books/#{book.id}/borrow?user_id=#{bob.id}"
#     expect(response).to be_success
#     book.reload
#     expect(book.check_out?).to be_truthy
#   end

#   it 'returns out a book' do
#     bob_borrows
#     post "/api/v1/books/#{book.id}/checkout?user_id=#{bob.id}"
#     expect(response).to be_success
#     book.reload
#     expect(book.check_out?).to be_falsey
#   end

# end