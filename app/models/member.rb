class Member < ActiveRecord::Base
  belongs_to :user
  belongs_to :team
end
