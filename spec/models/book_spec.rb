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

  describe 'Book actions' do

    let(:bob) { create(:user, name: 'Bob') }
    let(:joe) { create(:user, name: 'Joe') }
    let(:bob_borrows) { create(:action, kind: :borrow, book: book, user: bob) }
    let(:joe_borrows) { create(:action, kind: :borrow, book: book, user: joe) }
    let(:bobs_returns) { create(:action, kind: :return, book: book, user: bob) }

    context 'when it is borrowed' do

      before do
        bob_borrows
      end

      it 'can be returned' do
        expect{ bobs_returns }.to change{ book.available? }.from(false).to(true)
      end

      it 'cannot borrow twice' do
        expect{ joe_borrows }.to raise_error(AlreadyBorrowedError)
      end

      it 'cannot be deleted' do
        expect{ book.destroy! }.to raise_error(HasToBeReturnedError)
      end

    end

    context 'when it is available' do

      it 'can be borrowed' do
        expect{ joe_borrows }.to change{ book.borrowed? }.from(false).to(true)
      end

      it 'cannot be returned' do
        expect{ bobs_returns }.to raise_error(NotBorrowedError)
      end

    end

  end

end