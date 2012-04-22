# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "pivotal_to_pdf/version"

Gem::Specification.new do |s|
  s.name        = "pivotal_to_pdf"
  s.version     = PivotalToPdf::VERSION
  s.authors     = ["Yi Wen"]
  s.email       = ["hayafirst@gmail.com"]
  s.summary     = %q{Convert Pivotal Tracker Stories to 4x6 PDF cards}
  s.description    = "Convert Pivotal Tracker Stories to 4x6 PDF for printing so that you can stick the card to your story board"

  s.files         = `git ls-files`.split("\n")
  s.executables   = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]
  s.author         = "Yi Wen"
  s.add_runtime_dependency(%q<activeresource>, "3.0.9")
  s.add_runtime_dependency(%q<prawn>, "0.12.0")
  s.add_runtime_dependency(%q<rainbow>, ">= 0")
  s.add_runtime_dependency(%q<thor>, ">= 0")
  s.add_development_dependency(%q<rspec>)
  s.homepage = "https://github.com/ywen/pivotal_to_pdf"
end
