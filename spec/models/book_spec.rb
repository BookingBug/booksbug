require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:expected_response) { JSON.parse(file_fixture('google_api_response.json').read) }

  describe "fetch_details" do
    # Book.fetch_details(isbn) => {}
    it "accepts isbn as argument" do
      Book.fetch_details("")
    end

    it "returns with a hash" do
      expect(Book.fetch_details("")).to be_an_instance_of(Hash)
    end

    it "returns book details based on isbn" do
      expect(Book.fetch_details("0804820384")).to eq(expected_response)
    end
  end

  describe "book instance" do
    it "contains details taken from an external resource" do
      expect(Book.create(isbn: "0804820384").details).to eq(expected_response)
    end
  end
end
