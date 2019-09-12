class JobQueue < ApplicationRecord
  has_many :images, dependent: :delete_all
  before_save :default_values

  def default_values
    self.status ||= false
  end
end
