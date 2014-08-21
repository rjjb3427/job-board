class Favorite < ActiveRecord::Base
  validates_presence_of :user, :job

  # What field is this an error on if it isn't unique?
  # validates_uniqueness_of :user, scope: [:job]
  validates_uniqueness_of :job, scope: [:user]

  belongs_to :user # defines favorite.user
  belongs_to :job  # defines favorite.job
  # def job
  #   Job.find_by_id(self.job_id)
  # end
end
