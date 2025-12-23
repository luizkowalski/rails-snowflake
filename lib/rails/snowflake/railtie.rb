# frozen_string_literal: true

require_relative "types/snowflake"
require_relative "table_definition"
require_relative "native_database_type"

module Rails
  module Snowflake
    class Railtie < ::Rails::Railtie
      initializer "snowflake.register_table_definitions" do
        ActiveSupport.on_load(:active_record) do
          ActiveRecord::Type.register(:snowflake, Rails::Snowflake::Types::Snowflake, adapter: :postgresql)

          ActiveRecord::ConnectionAdapters::PostgreSQLAdapter.prepend(Rails::Snowflake::NativeDatabaseType)
          ActiveRecord::ConnectionAdapters::TableDefinition.prepend(Rails::Snowflake::TableDefinition)
          ActiveRecord::ConnectionAdapters::Table.prepend(Rails::Snowflake::TableDefinition)
        end
      end

      rake_tasks do
        load "rails/snowflake/database_tasks.rb"
      end
    end
  end
end
