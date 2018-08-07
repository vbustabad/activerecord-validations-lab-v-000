class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validates :is_the_title_clickbait?

  clickbait_content = ["Won't Believe", "Secret", "Top[0-10]", "Guess"]

  def is_the_title_clickbait?
    if clickbait_content.includes?(title)
      true
    else
      errors.add(:title, "The title must be clickbait.")
    end
  end

end
