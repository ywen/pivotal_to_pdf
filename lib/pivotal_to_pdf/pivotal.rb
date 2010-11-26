class Pivotal < ActiveResource::Base
  def self.inherited(sub)
    info = YAML.load_file File.expand_path("~/.pivotal.yml")
    sub.site = %Q|https://www.pivotaltracker.com/services/v3/projects/#{info['project_id']}|
    sub.headers['X-TrackerToken'] = info["token"]
  end

end
