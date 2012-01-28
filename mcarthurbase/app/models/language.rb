class Language < ActiveRecord::Base
  has_many :group
  has_many :vocabulary
end
