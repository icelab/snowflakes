require "hanami/cli"
require "snowpack"
require_relative "commands"

module Snowpack
  module CLI
    module Application
      class CLI < Hanami::CLI
        attr_reader :application

        def initialize(application: Snowpack.application, commands: Commands)
          super(commands)
          @application = application
        end

        private

        # TODO: we should make a prepare_command method upstream
        def parse(result, out)
          command, arguments = super

          if command.respond_to?(:with_application)
            application.config.env = arguments[:env] if arguments[:env]
            [command.with_application(application), arguments]
          else
            [command, arguments]
          end
        end
      end
    end
  end
end
