class ClosedActivity < Activity
  belongs_to :initiator_person, :class_name => "Person"
  validates_presence_of :initiator_person
end
