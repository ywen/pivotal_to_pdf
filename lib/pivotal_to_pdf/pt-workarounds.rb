# PivotalTracker has a bug in API v3 that breaks ActiveResource
# For more info, see http://community.pivotaltracker.com/pivotal/topics/activeresource_client_throws_error

class Hash
  class << self
    alias_method :from_xml_original, :from_xml
    def from_xml(xml)
      scrubbed = scrub_attributes(xml)
      from_xml_original(scrubbed)
    end
    def scrub_attributes(xml)
      xml.gsub(/<stories.*>/, "<stories type=\"array\">")
    end
  end
end
