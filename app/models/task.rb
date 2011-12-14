class Task < ActiveRecord::Base
  belongs_to :person
  has_many :activities
  def close
      ClosedActivity.create(:task => self) unless closed?
  end
  def closed?
    activities.where(:type => ClosedActivity).count == 1
  end
end
