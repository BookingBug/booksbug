require 'rails_helper'

RSpec.describe 'Section', type: :model do

  let(:section) { create(:section) }

  context 'when validating' do

    it 'has a name' do
      section.name = ''
      expect(section).to be_invalid
    end

  end

  context 'when it has no books' do

    it 'can be deleted' do
      expect{ section.destroy! }.to change{ section.deleted? }.from(false).to(true)
    end

  end

  context 'when it has at least one book' do

    before do
      create(:book, section: section)
    end

    it 'cannot be deleted' do
      expect{ section.destroy! }.to raise_error(SectionHasBooksError)
    end

  end

end