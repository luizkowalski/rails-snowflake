# frozen_string_literal: true

module Rails
  module Snowflake
    module Types
      class Snowflake < ActiveRecord::Type::BigInteger
        def type
          :snowflake
        end
      end
    end
  end
end
