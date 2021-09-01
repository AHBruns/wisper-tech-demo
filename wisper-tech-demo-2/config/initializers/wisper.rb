# Make all Active Record models emit events automatically.
Wisper::ActiveRecord.extend_all

# stats
Book.subscribe(StatsListener.new, on: :create_book_successful, with: :create)
Book.subscribe(StatsListener.new, on: :destroy_book_successful, with: :destroy)
# Author.subscribe(StatsListener.new, on: :create_author_successful, with: :create)
# Author.subscribe(StatsListener.new, on: :destroy_author_successful, with: :destroy)

# notifications
Book.subscribe(NotificationsListener.new, on: :create_book_successful, with: :notify_author)
Book.subscribe(NotificationsListener.new, on: :create_book_successful, with: :notify_fans)