require 'snowflakes/commands/database_config'

module Snowflakes
  module Commands
    module Db
      class Drop < DatabaseConfig
        def start
          `dropdb #{db_name} -h #{hostname} -p #{port} #{username_flag}`
          puts "=> database #{db_name} dropped"
        end
      end
    end
  end
end
