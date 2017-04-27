require 'rails_helper'

RSpec.describe Action, type: :model do

  let(:book) { create(:book) }
  let(:bob) { create(:user, name: 'Bob') }
  let(:joe) { create(:user, name: 'Joe') }
  let(:bobs_check_out) { create(:action, kind: :checkout, book: book, user: bob) }
  let(:joes_check_out) { create(:action, kind: :checkout, book: book, user: joe) }
  let(:bobs_return) { create(:action, kind: :return, book: book, user: bob) }

  context 'when validating' do

    let(:action) { create(:action) }

    it 'has an user' do
      action.user = nil
      expect(action).to be_invalid
    end

    it 'has a book' do
      action.book = nil
      expect(action).to be_invalid
    end

    it 'has a creation date' do
      action.created_at = nil
      expect(action).to be_invalid
    end

    it 'has a kind' do
      action.kind = nil
      expect(action).to be_invalid
    end

  end

  context 'when a book is already checked-out' do

    before do
      bobs_check_out
    end

    it 'can be returned' do
      expect{ bobs_return }.to change{ book.checked_out? }.from(true).to(false)
    end

    it 'cannot be checked-out again' do
      expect{ joes_check_out }.to raise_error(BookAlreadyCheckedOut)
    end

    it 'cannot be deleted' do
      expect{ book.destroy! }.to raise_error{ ActiveRecord::RecordNotDestroyed }
    end

  end

  context 'when a book is not checked-out' do

    it 'can be checked-out' do
      expect{ joes_check_out }.to change{ book.checked_out? }.from(false).to(true)
    end

    it 'cannot be returned' do
      expect{ bobs_return }.to raise_error(NotCheckedOut)
    end

  end

end