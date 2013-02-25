class Site < ActiveRecord::Base
  attr_accessible :desc, :key, :name, :url
  has_many :userSessions
  validates_presence_of  :key, :name, :url
  validates :key, :uniqueness => true
  def create_user_session(endtime, pagename, duration)
    user_session = UserSession.new()
    user_session.endtime = endtime
    user_session.duration = duration
    user_session.pagename = pagename
    user_session.site_id = id
    user_session.save
  end
  def pages
    UserSession.where(:site_id => id).find(:all, :select => "DISTINCT pagename")
  end
  def averageSite()
    UserSession.where(:site_id => id).average(:duration)
  end
  def averagePage(pagename)
    UserSession.where(:pagename => pagename, :site_id => id).average(:duration)
  end
  def pageVisits(pagename)
    UserSession.where(:pagename => pagename, :site_id => id).count
  end
  def siteVisits()
    UserSession.where(:site_id => id).count
  end
end
