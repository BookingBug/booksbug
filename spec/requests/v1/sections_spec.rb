# require 'rails_helper'

# RSpec.describe 'Sections Requests', type: :request do

#   it 'returns a list of all sections' do
#     create_list(:section, 3)
#     get '/api/v1/sections'
#     expect(response).to be_success
#     expect(json.length).to eq(3)
#   end

#   it 'creates a section' do
#     post "/api/v1/sections?name=Terror"
#     expect(response).to be_success
#     expect(Section.find_by_name('Terror')).to be_truthy
#   end

#   it 'updates a section' do
#     section_id = create(:section).id
#     new_name = 'Science Fiction'
#     put "/api/v1/books/#{book_id}?name=#{new_name}"
#     expect(response).to be_success
#     expect(Section.find_by_name(new_name)).to be_truthy
#   end

#   it 'deletes a section' do
#     section = create(:section)
#     expect { delete "/api/v1/sections/#{section.id}" }.to change{ section.deleted? }.from(false).to(true)
#   end

#   it 'lists books by section' do
#     section = create(:section)
#     create_list(:book, 3, section: section)
#     get '/api/v1/sections/#{section.name}/books'
#     expect(response).to be_success
#     expect(json.length).to eq(3)
#   end

# end