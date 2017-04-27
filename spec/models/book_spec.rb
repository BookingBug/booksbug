require 'rails_helper'

RSpec.describe Book, type: :model do

  let(:book) { create(:book) }

  context 'when validating' do

    it 'has a title' do
      book.title = ''
      expect(book).to be_invalid
    end

    it 'has an author' do
      book.author = ''
      expect(book).to be_invalid
    end

    it 'belongs to a section' do
      book.section = nil
      expect(book).to be_invalid
    end

  end

end