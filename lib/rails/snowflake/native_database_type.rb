# frozen_string_literal: true

module Rails
  module Snowflake
    module NativeDatabaseType
      def native_database_types
        super.merge(
          snowflake: { name: "bigint" }
        )
      end
    end
  end
end
