module PivotalToPdf
  class Pivotal < ActiveResource::Base
    def self.inherited(sub)
      config = Configure.new
      sub.site = %Q|https://www.pivotaltracker.com/services/v3/projects/#{config.project_id}|
      sub.headers['X-TrackerToken'] = config.token
    end

  end
end
