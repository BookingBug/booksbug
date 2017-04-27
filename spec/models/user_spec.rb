require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { create(:user) }
  
  context 'when validating' do

    it 'has a name' do
      user.name = ''
      expect(user).to be_invalid
    end

  end

  context 'when it has checked-out books' do

    before do
      create(:action, book: create(:book), user: user, kind: :checkout)
    end

    it 'cannot be deleted' do
      expect{ user.destroy! }.to raise_error(HasCheckedOutBooks)
    end

  end

  context 'when it has no checked out books' do

    it 'can be deleted' do
      expect{ user.destroy! }.to change{ user.deleted? }.from(false).to(true)
    end

  end

end