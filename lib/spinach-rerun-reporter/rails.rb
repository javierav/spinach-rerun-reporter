module SpinachRerunReporter
  class Rails < ::Rails::Railtie
    rake_tasks do
      load File.expand_path('../../../tasks/spinach_rerun.rake', __FILE__)
    end
  end
end
