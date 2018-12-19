class Tweet < ApplicationRecord
  belongs_to :user
  acts_as_votable
  validates :content,
    presence: true,
    length: {maximum: 50},
    on: :create,
    allow_nil: false

    include PgSearch
  pg_search_scope :global_search,
    against: [ :content ],
    associated_against: {
      user: [ :first_name, :last_name , :username]
    },
    using: {
      tsearch: { prefix: true }
    }

end

