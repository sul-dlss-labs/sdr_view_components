# frozen_string_literal: true

module SdrViewComponents
  module Elements
    module Navigation
      # Component for rendering a dropdown menu in the navigation bar.
      class DropdownMenuComponent < BaseComponent
        renders_many :items

        def initialize(text:)
          @text = text
          super()
        end

        attr_reader :text
      end
    end
  end
end
