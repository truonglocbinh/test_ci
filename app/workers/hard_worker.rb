require 'faker'
class HardWorker
  include Sidekiq::Worker

  def perform
    Book.create(title: Faker::Book.title, author: Faker::Book.author, publication_year: 2021)
  end
end
