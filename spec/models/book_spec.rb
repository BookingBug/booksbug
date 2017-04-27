require 'rails_helper'

RSpec.describe Book, type: :model do

  let(:book) { create(:book) }
  let(:bob) { create(:user, name: 'Bob') }
  let(:joe) { create(:user, name: 'Joe') }
  let(:bobs_check_out) { create(:action, kind: :checkout, book: book, user: bob) }
  let(:joes_check_out) { create(:action, kind: :checkout, book: book, user: joe) }
  let(:bobs_return) { create(:action, kind: :return, book: book, user: bob) }

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

  context 'when it is checked-out' do

    before do
      bobs_check_out
    end

    it 'can be returned' do
      expect{ bobs_return }.to change{ book.available? }.from(false).to(true)
    end

    it 'cannot be checked-out again' do
      expect{ joes_check_out }.to raise_error(BookAlreadyCheckedOutError)
    end

    it 'cannot be deleted' do
      expect{ book.destroy! }.to raise_error(HasToBeReturnedError)
    end

  end

  context 'when it is available' do

    it 'can be checked-out' do
      expect{ joes_check_out }.to change{ book.checked_out? }.from(false).to(true)
    end

    it 'cannot be returned' do
      expect{ bobs_return }.to raise_error(BookAlreadyAvailableError)
    end

  end

end