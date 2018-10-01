class Tweet < ApplicationRecord
  belongs_to :user
  acts_as_votable
  validates :content,
    presence: true,
    length: {maximum: 50},
    on: :create,
    allow_nil: false
end
