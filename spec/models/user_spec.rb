require 'rails_helper'

RSpec.describe User, type: :model do

  let(:bob) { create(:user) }
  
  context 'when validating' do

    it 'has a name' do
      bob.name = ''
      expect(bob).to be_invalid
    end

  end

  context 'when it has checked-out books' do

    let (:moby_dick) { create(:book, title: 'Moby Dick') }
    let (:blue_lagoon) { create(:book, title: 'Blue Lagoon') }

    before do
      create(:action, book: moby_dick, user: bob, kind: :borrow)
      create(:action, book: moby_dick, user: bob, kind: :return)
      create(:action, book: blue_lagoon, user: bob, kind: :borrow)
    end

    it 'cannot be deleted' do
      expect{ bob.destroy! }.to raise_error(HasBorrowedBooks)
    end

  end

  context 'when it has no checked out books' do

    it 'can be deleted' do
      expect{ bob.destroy! }.to change{ bob.deleted? }.from(false).to(true)
    end

  end

end