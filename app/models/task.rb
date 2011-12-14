class Task < ActiveRecord::Base
  belongs_to :person
  has_many :activities
  validates_presence_of :person

  def close
    ClosedActivity.create(:task => self,
                          :initiator_person => self.person) unless closed?
  end

  def closed?
    activities.where(:type => ClosedActivity).count == 1
  end

end
