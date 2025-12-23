# frozen_string_literal: true

module Rails
  module Snowflake
    module Types
      class Snowflake < ActiveRecord::Type::BigInteger
        def type
          :snowflake
        end

        def cast(value)
          return nil if value.nil?
          value.to_i
        end
      end
    end
  end
end
