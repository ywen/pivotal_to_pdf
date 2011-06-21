# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{pivotal_to_pdf}
  s.version = "0.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Yi Wen}]
  s.date = %q{2011-06-21}
  s.description = %q{Convert Pivotal Tracker Stories to 4x6 PDF for printing so that you can stick the card to your story board}
  s.email = %q{hayafirst@gmail.com}
  s.executables = [%q{pivotal_to_pdf}]
  s.extra_rdoc_files = [%q{CHANGELOG}, %q{README.md}, %q{bin/pivotal_to_pdf}, %q{lib/pivotal_to_pdf.rb}, %q{lib/pivotal_to_pdf/iteration.rb}, %q{lib/pivotal_to_pdf/pdf_writer.rb}, %q{lib/pivotal_to_pdf/pivotal.rb}, %q{lib/pivotal_to_pdf/story.rb}, %q{tasks/spec.rb}]
  s.files = [%q{CHANGELOG}, %q{Gemfile}, %q{Gemfile.lock}, %q{Manifest}, %q{README.md}, %q{Rakefile}, %q{bin/pivotal_to_pdf}, %q{lib/pivotal_to_pdf.rb}, %q{lib/pivotal_to_pdf/iteration.rb}, %q{lib/pivotal_to_pdf/pdf_writer.rb}, %q{lib/pivotal_to_pdf/pivotal.rb}, %q{lib/pivotal_to_pdf/story.rb}, %q{pivotal_to_pdf.gemspec}, %q{spec/pivotal_to_pdf/story_spec.rb}, %q{spec/pivotal_to_pdf_bin_spec.rb}, %q{spec/spec_helper.rb}, %q{tasks/spec.rb}]
  s.homepage = %q{https://github.com/ywen/pivotal_to_pdf}
  s.rdoc_options = [%q{--line-numbers}, %q{--inline-source}, %q{--title}, %q{Pivotal_to_pdf}, %q{--main}, %q{README.md}]
  s.require_paths = [%q{lib}]
  s.rubyforge_project = %q{pivotal_to_pdf}
  s.rubygems_version = %q{1.8.5}
  s.summary = %q{Convert Pivotal Tracker Stories to 4x6 PDF for printing}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activeresourceprawn>, ["= 0.11.1rainbowthor"])
    else
      s.add_dependency(%q<activeresourceprawn>, ["= 0.11.1rainbowthor"])
    end
  else
    s.add_dependency(%q<activeresourceprawn>, ["= 0.11.1rainbowthor"])
  end
end
