class Vocabulary < ActiveRecord::Base
  belongs_to :subject
  belongs_to :language
end
