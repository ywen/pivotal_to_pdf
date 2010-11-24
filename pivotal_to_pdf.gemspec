# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{pivotal_to_pdf}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Yi Wen"]
  s.date = %q{2010-11-24}
  s.default_executable = %q{pivol_to_pdf}
  s.description = %q{Convert Pivotal Tracker Stories to 4x6 PDF for printing so that you can stick the card to your story board}
  s.email = %q{hayafirst@gmail.com}
  s.executables = ["pivol_to_pdf"]
  s.extra_rdoc_files = ["CHANGELOG", "README", "bin/pivol_to_pdf", "lib/pivotal_to_pdf.rb", "lib/pivotal_to_pdf/pdf_writer.rb", "lib/pivotal_to_pdf/story.rb"]
  s.files = ["CHANGELOG", "Manifest", "README", "Rakefile", "bin/pivol_to_pdf", "lib/pivotal_to_pdf.rb", "lib/pivotal_to_pdf/pdf_writer.rb", "lib/pivotal_to_pdf/story.rb", "pivotal_to_pdf.gemspec"]
  s.homepage = %q{https://github.com/ywen/pivotal_to_pdf}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Pivotal_to_pdf", "--main", "README"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{pivotal_to_pdf}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Convert Pivotal Tracker Stories to 4x6 PDF for printing}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activeresource>, [">= 0"])
      s.add_runtime_dependency(%q<prawn>, [">= 0"])
      s.add_runtime_dependency(%q<rainbow>, [">= 0"])
    else
      s.add_dependency(%q<activeresource>, [">= 0"])
      s.add_dependency(%q<prawn>, [">= 0"])
      s.add_dependency(%q<rainbow>, [">= 0"])
    end
  else
    s.add_dependency(%q<activeresource>, [">= 0"])
    s.add_dependency(%q<prawn>, [">= 0"])
    s.add_dependency(%q<rainbow>, [">= 0"])
  end
end
