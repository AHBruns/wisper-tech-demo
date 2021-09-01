class BooksStatsBookkeepingJob < ApplicationJob
  queue_as :default
  
  def perform(operation)
    sleep(rand(3))
    case operation
      when :destroy
        puts "Decrement the existing books counter somewhere."
        puts "Increment the destroyed books counter somewhere."
      when :create
        puts "Increment the existing books counter somewhere."
        puts "Increment the created books counter somewhere."
      else
        raise "unknown operation"
    end
  end
end
