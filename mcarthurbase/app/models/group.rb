class Group < ActiveRecord::Base
  belongs_to :language
  has_many :word
end
