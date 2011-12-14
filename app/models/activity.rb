class Activity < ActiveRecord::Base
  belongs_to :task
  belongs_to :to_person_id
end
