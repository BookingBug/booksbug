require 'rails_helper'

RSpec.describe Action, type: :model do

  let(:action) { create(:action) }

  context 'when validating' do


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

end