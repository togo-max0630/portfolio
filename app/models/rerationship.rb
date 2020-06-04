class Rerationship < ApplicationRecord
  belongs_to :follower
  belongs_to :followed
end
