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
      allow(user).to receive(:checked_out_books) { build_list(:books, 2) }
    end

    it 'cannot be deleted' do
      expect{ user.destroy! }.to raise_error{ ActiveRecord::RecordNotDestroyed }
    end

  end

  context 'when it has no checked out books' do

    it 'can be deleted' do
      expect{ user.destroy! }.to change{ user.deleted? }.from(false).to(true)
    end

  end

end