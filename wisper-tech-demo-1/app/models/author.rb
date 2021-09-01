class Author < ApplicationRecord
  has_many :books
  
  def fans
    ["Alice", "Bob", "Joe", "John", "Annie", "Laura"]
  end
end
