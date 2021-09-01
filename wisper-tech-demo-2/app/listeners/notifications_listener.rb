class NotificationsListener
  def notify_author(subject)
    puts "Hey, #{subject.author.first_name}, your book was successfully created. Noice!"
  end
  
  def notify_fans(subject)
    (1..10).each do |i|
      puts "Yo fan #{i}! You've gotta read this!"
    end
  end
end
