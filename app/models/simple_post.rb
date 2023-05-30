class SimplePost < ApplicationRecord
  validates :external_id, presence: true
end
