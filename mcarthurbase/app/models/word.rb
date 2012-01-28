class Word < ActiveRecord::Base
  belongs_to :group
  has_many :vocabulary_word
end
