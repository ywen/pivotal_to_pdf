class Story < ActiveResource::Base
  info = YAML.load_file File.expand_path("~/.pivotal.yml")
  self.site = %Q|https://www.pivotaltracker.com/services/v3/projects/#{info['project_id']}|
  headers['X-TrackerToken'] = info["token"]
end
