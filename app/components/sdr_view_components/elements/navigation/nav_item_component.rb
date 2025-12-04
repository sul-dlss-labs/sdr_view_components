# frozen_string_literal: true

module SdrViewComponents
  module Elements
    module Navigation
      # Component for navigation item link.
      class NavItemComponent < BaseComponent
        def initialize(text:, path:, data: {})
          @text = text
          @path = path
          @data = data
          super()
        end

        attr_reader :text, :path, :data

        def call
          tag.li class: 'nav-item' do
            link_to text, path, class: 'nav-link', data:
          end
        end
      end
    end
  end
end
