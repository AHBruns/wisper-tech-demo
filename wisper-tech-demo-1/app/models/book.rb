class Book < ApplicationRecord
  belongs_to :author
  
  validates :title, :author, presence: true
  
  before_validation :ensure_title_has_a_value, :ensure_description_is_sfw
  after_commit :sync_data_external_service
  after_create_commit :notify_fans_of_new_book, :update_create_stats
  after_destroy_commit :update_destroy_stats
  
  private
  
  def ensure_title_has_a_value
    self.title = "Untitled" if title.blank?
  end
  
  def ensure_description_is_sfw
    return if description.blank?
    self.description = description.gsub(/fuck/, "f***")
    self.description = description.gsub(/shit/, "s***")
    self.description = description.gsub(/ass/, "a**")
  end
  
  def sync_data_external_service
    BooksSynchronizationJob.perform_later id
  end
  
  def notify_fans_of_new_book
    NotifyFansOfNewBookJob.perform_later id
  end
  
  def update_create_stats
    BooksStatsBookkeepingJob.perform_later :create
  end
  
  def update_destroy_stats
    BooksStatsBookkeepingJob.perform_later :destroy
  end
end