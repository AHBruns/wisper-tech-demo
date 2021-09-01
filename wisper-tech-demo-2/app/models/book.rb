# NOTES
# - imagine puts is putting a job on some ActiveJob queue instead of just printing text

# class Book < ApplicationRecord
#   belongs_to :author
#
#   validates :title, presence: true
#
#   before_validation :ensure_title_has_a_value
#   after_create :notify_fans, :notify_author, :update_create_stats
#   after_destroy :update_destroy_stats
#
#   private
#
#     def ensure_title_has_a_value
#       self.title = "Untitled" if title.blank?
#     end
#
#     def notify_fans
#       (1..10).each do |i|
#         puts "Yo fan #{i}! You've gotta read this!"
#       end
#     end
#
#     def notify_author
#       puts "Hey, #{self.author.first_name}, your book was successfully created. Noice!"
#     end
#
#     def update_create_stats
#       update_stats(:create)
#     end
#
#     def update_destroy_stats
#       update_stats(:destroy)
#     end
#
#     def update_stats(type)
#       case type
#         when :create
#           puts "increment the existing books counter somewhere."
#           puts "increment the created books counter somewhere."
#         when :destroy
#           puts "decrement the existing books counter somewhere."
#           puts "increment the destroyed books counter somewhere."
#         else
#           puts "wtf"
#       end
#     end
# end

# class Book < ApplicationRecord
#   belongs_to :author
#
#   validates :title, presence: true
#
#   before_validation :ensure_title_has_a_value
#   after_create :notify_fans, :notify_author, :update_create_stats
#   after_destroy :update_destroy_stats
#
#   private
#
#     # internal -> good
#     def ensure_title_has_a_value
#       self.title = "Untitled" if title.blank?
#     end
#
#     # side effect -> bad
#     def notify_fans
#       (1..10).each do |i|
#         puts "Yo fan #{i}! You've gotta read this!"
#       end
#     end
#
#     # side effect -> bad
#     def notify_author
#       puts "Hey, #{self.author.first_name}, your book was successfully created. Noice!"
#     end
#
#     # side effect -> bad
#     def update_create_stats
#       update_stats(:create)
#     end
#
#     # side effect -> bad
#     def update_destroy_stats
#       update_stats(:destroy)
#     end
#
#     # side effect -> bad
#     def update_stats(type)
#       case type
#         when :create
#           puts "increment the existing books counter somewhere."
#           puts "increment the created books counter somewhere."
#         when :destroy
#           puts "decrement the existing books counter somewhere."
#           puts "increment the destroyed books counter somewhere."
#         else
#           puts "wtf"
#       end
#     end
# end

class Book < ApplicationRecord
  belongs_to :author

  validates :title, presence: true

  before_validation :ensure_title_has_a_value

  private

    def ensure_title_has_a_value
      self.title = "Untitled" if title.blank?
    end
end