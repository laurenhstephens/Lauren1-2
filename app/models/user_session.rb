class UserSession < ActiveRecord::Base
  attr_accessible :endtime, :pagename,  :duration
  belongs_to :site
  validates_presence_of  :endtime, :pagename, :duration
end
