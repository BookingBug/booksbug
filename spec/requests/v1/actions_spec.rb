# require 'rails_helper'

# RSpec.describe 'Actions' do

#   let(:book) { create(:book) }
#   let(:user) { create(:user) }
#   let(:user_check_out) { create(:action, kind: :checkout, book: book, user: user) }

#   it 'checks out a book' do
#     post "/api/v1/books/#{book.id}/checkout?user_id=#{user.id}"
#     expect(response).to be_success
#     book.reload
#     expect(book.check_out?).to be_truthy
#   end

#   it 'returns out a book' do
#     user_check_out
#     post "/api/v1/books/#{book.id}/checkout?user_id=#{user.id}"
#     expect(response).to be_success
#     book.reload
#     expect(book.check_out?).to be_falsey
#   end

# end