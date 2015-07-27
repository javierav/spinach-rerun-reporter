module Spinach
  class Reporter
    class Rerun < Stdout
      def before_run(*args)
        super(*args)

        # reset rerun.txt file
        File.delete('tmp/spinach-rerun.txt') if File.file?('tmp/spinach-rerun.txt')

        # create tmp folder if not exists
        Dir.mkdir('tmp', 0755) unless Dir.exist?('tmp')

        # rerun list of failing scenarios
        @rerun = []
      end

      def after_run(success)
        super success

        # save rerun scenarios in a file
        File.open('tmp/spinach-rerun.txt', 'w') { |f| f.write @rerun.join("\n") } unless success
      end

      def on_failed_step(step, failure, step_location, step_definitions = nil)
        super step, failure, step_location, step_definitions

        # save feature file and scenario line
        @rerun << "#{current_feature.filename}:#{current_scenario.line}"
      end

      def on_error_step(step, failure, step_location, step_definitions = nil)
        super step, failure, step_location, step_definitions

        # save feature file and scenario line
        @rerun << "#{current_feature.filename}:#{current_scenario.line}"
      end
    end
  end
end
