module PivotalToPdf
  class Configure
    def initialize
      base_dir = ENV["PIVOTAL_TO_PDF_CONFIG_DIR"] || "~"
      info = YAML.load_file File.expand_path("#{base_dir}/.pivotal.yml")
      info.each do |key, value|
        self.class.send :define_method, key do
          value
        end
      end
    end
  end
end
