require 'json'

class Book < ApplicationRecord

  def self.fetch_details(isbn)
    JSON.parse(HTTParty.get("https://www.googleapis.com/books/v1/volumes?q=isbn:#{isbn}").body)
  end

  def details
    self.class.fetch_details(isbn)
  end
end
