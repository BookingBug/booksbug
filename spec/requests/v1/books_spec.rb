# require 'rails_helper'

# RSpec.describe 'Books Requests', type: :request do

#   let (:book) { create(:book) }

#   it 'shows details of a book' do
#     get '/api/v1/books/' + book.id
#     expect(response).to be_success
#     expect(json.length).to eq(1)
#   end

#   it 'returns a list of all books' do
#     create_list(:book, 3)
#     get '/api/v1/books'
#     expect(response).to be_success
#     expect(json.length).to eq(3)
#   end

#   it 'creates a book' do
#     book = build(:book)
#     post "/api/v1/books?title=#{book.title}&author=#{book.author}"
#     expect(response).to be_success
#     expect(Book.find_by_title(book.title)).to be_truthy
#   end

#   it 'updates a book' do
#     new_title = 'The Blue Lagoon'
#     new_author = 'Henry De Vere Stacpoole'
#     put "/api/v1/books/#{book.id}?title=#{new_title}&author=#{new_author}"
#     expect(response).to be_success
#     book.reload
#     expect(book.name).to eq(new_title)
#     expect(book.author).to eq(new_author)
#   end

#   it 'deletes a book' do
#     book = create(:book)
#     expect { delete "/api/v1/books/#{book.id}" }.to change{ book.deleted? }.from(false).to(true)
#   end

#   it 'finds a book by title' do
#     skip
#   end

# end