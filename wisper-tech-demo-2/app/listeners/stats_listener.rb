class StatsListener
  def create(subject)
    puts "increment the existing #{subject.class.name.pluralize.downcase} counter somewhere."
    puts "increment the created #{subject.class.name.pluralize.downcase} counter somewhere."
  end
  
  def destroy(subject)
    puts "decrement the existing #{subject.class.name.pluralize.downcase} counter somewhere."
    puts "increment the destroyed #{subject.class.name.pluralize.downcase} counter somewhere."
  end
end
