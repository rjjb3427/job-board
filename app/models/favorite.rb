class Favorite < ActiveRecord::Base
  validates_presence_of :user, :job

  belongs_to :user # defines favorite.user
  belongs_to :job  # defines favorite.job
  # def job
  #   Job.find_by_id(self.job_id)
  # end
end
