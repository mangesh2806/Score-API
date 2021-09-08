class Score < ApplicationRecord
  validates :playerName, presence: true
  validates :score, presence: true
  validates :time, presence: true
  validates :created_at, presence: false
  validates :updated_at, presence: false
end
