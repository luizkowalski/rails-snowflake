# frozen_string_literal: true

module Rails
  module Snowflake
    module TableDefinition
      def primary_key(name, type = :primary_key, **options)
        if type == :snowflake
          options[:default] = snowflake_default_function
        end

        super
      end

      def snowflake(column_name, **options)
        if column_name == :id
          raise Error, "Cannot use t.snowflake :id directly. Use `create_table :table_name, id: :snowflake` instead."
        end

        unless @name
          raise Error, "Could not determine table name for Snowflake column. Make sure you're using it within a `create_table` block."
        end

        options[:default] = snowflake_default_function
        options[:index] ||= true

        column(column_name, :snowflake, **options)
      end

      private

      def snowflake_default_function
        -> { "timestamp_id('#{@name}'::text)" }
      end
    end
  end
end
