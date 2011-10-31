module PivotalToPdf
  class Pivotal < ActiveResource::Base
    def self.inherited(sub)
      base_dir = ENV["PIVOTAL_TO_PDF_CONFIG_DIR"] || "~"
      info = YAML.load_file File.expand_path("#{base_dir}/.pivotal.yml")
      sub.site = %Q|https://www.pivotaltracker.com/services/v3/projects/#{info['project_id']}|
      sub.headers['X-TrackerToken'] = info["token"]
    end

  end
end
