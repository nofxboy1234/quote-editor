class Company < ApplicationRecord
  validate :name, presence: true
end
