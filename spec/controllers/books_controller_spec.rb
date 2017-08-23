require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    context "no books" do
      it "returns empty array" do
        get :index

        expect(JSON.parse(response.body)).to eq []
      end
    end

    context "book exists" do
      it "returns array containing all book" do
        Book.create!(title: 'Foo two')
        Book.create!(title: 'Bar')

        get :index

        response_body = JSON.parse(response.body)
        expect(response_body.count).to eq Book.count
      end

      describe "response array item" do
        before do
          Book.create!(title: 'Bar')

          get :index
        end

        it "will have a author" do
          response_body = JSON.parse(response.body)
          book = response_body.first
          expect(book.has_key?('author')).to be true
        end

        it "will have a title" do
          response_body = JSON.parse(response.body)
          book = response_body.first
          expect(book.has_key?('title')).to be true
        end

        it "will have a isbn" do
          response_body = JSON.parse(response.body)
          book = response_body.first
          expect(book.has_key?('isbn')).to be true
        end
      end
    end
  end
end
