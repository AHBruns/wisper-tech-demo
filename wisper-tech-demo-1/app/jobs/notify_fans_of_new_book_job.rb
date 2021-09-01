class NotifyFansOfNewBookJob < ApplicationJob
  queue_as :default

  def perform(book_id)
    sleep(rand(3))
    Book.find(book_id).author.fans.each  do |i|
      sleep(rand(2))
      puts "Yo, #{i}, you've gotta read this!"
    end
  end
end
