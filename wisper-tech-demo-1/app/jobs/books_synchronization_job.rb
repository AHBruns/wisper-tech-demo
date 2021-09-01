class BooksSynchronizationJob < ApplicationJob
  queue_as :default
  
  def perform(book_id)
    sleep(rand(3))
    puts "Synchronizing book: #{Book.find(book_id).to_json}"
  rescue ActiveRecord::RecordNotFound
    puts "Synchronizing deletion of book with id #{book_id}"
  end
end
