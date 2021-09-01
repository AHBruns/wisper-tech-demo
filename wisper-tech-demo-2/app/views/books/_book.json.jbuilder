json.extract! book, :id, :author_id, :title, :description, :created_at, :updated_at
json.url book_url(book, format: :json)
