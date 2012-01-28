class Vocabulary < ActiveRecord::Base
  belongs_to :subject
  belongs_to :language
  has_many :vocabulary_word
end
