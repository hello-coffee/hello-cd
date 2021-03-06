class Review < ApplicationRecord

    belongs_to :product
    belongs_to :user

    # default_scope -> { order(id: :desc) }

    validates :review, presence: true
    validates :subject, presence: true
end
