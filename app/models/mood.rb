class Mood < ApplicationRecord
  validates :name, :emoji, :reason, presence: true
end
