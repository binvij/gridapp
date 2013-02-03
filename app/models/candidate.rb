class Candidate < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :looking_for_change

  belongs_to :comment
end
