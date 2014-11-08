require 'corundum/tasklibs'

module Corundum
  register_project(__FILE__)

  tk = Toolkit.new do |tk|
    tk.file_lists.project = [__FILE__]
    tk.file_lists.test << FileList["spec2/**/*.rb"]
  end

  tk.in_namespace do
    GemspecFiles.new(tk)
    %w{debug profanity racism ableism sexism issues}.each do |type|
      QuestionableContent.new(tk) do |qc|
        qc.type = type
      end
    end

    rspec = RSpec.new(tk) do |rspec|
      rspec.rspec_opts << "-O rspec2.conf"
      rspec.files_to_run = "spec2"
    end
    SimpleCov.new(tk, rspec) do |cov|
      cov.threshold = 75
    end

    gem = GemBuilding.new(tk)

    GemCutter.new(tk,gem)
    Git.new(tk) do |vc|
      vc.branch = "master"
    end
  end
end

task :default => [:release, :publish_docs]
