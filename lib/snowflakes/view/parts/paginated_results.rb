require "dry/view/part"

module Snowflakes
  module View
    module Parts
      class PaginatedResults < Dry::View::Part
        attr_reader :pager

        def initialize(pager:, **part_args)
          @pager = pager
          super(**part_args)
        end

        def pagination(locals: {}, **options)
          pager.with(**options).render(:pagination, **locals)
        end
      end
    end
  end
end