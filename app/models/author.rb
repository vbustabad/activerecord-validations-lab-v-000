class Author < ActiveRecord::Base
  validates :name, presence: true
  validates :password, length: { minimum: 10 }
end
