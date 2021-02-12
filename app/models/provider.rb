class Provider < ApplicationRecord
  belongs_to :user
  serialize :hash
  validates :name, uniqueness: {scope: [:user_id] }# user id primary key
end
