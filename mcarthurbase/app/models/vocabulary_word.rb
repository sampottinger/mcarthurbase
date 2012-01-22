class VocabularyWord < ActiveRecord::Base
  belongs_to :vocabulary
  belongs_to :word
end
