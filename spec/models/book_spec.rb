require 'rails_helper'

RSpec.describe Book do

  #let(:book) { create(:book) }

  it 'has a valid title' do
    # book.title = ''
    # expect(book).to be_invalid
  end

  it 'belongs to a section' do
  end

  it 'can be deleted' do
  end

  context 'while borrowed' do

    it 'cannot be borrowed' do
    end

    it 'can be returned' do
    end

  end

  context 'while not borrowed' do

    it 'can be borrowed' do
    end

  end



end