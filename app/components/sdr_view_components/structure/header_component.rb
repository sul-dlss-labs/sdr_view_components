# frozen_string_literal: true

module SdrViewComponents
  module Structure
    # Component for rendering page header.
    class HeaderComponent < BaseComponent
      renders_many :primary_navigation_links
      renders_many :secondary_navigation_links

      VARIANT_MASTHEAD_CLASS = {
        light: 'bg-light',
        dark: 'bg-dark sky-dark',
        white: 'border-bottom'
      }.freeze

      VARIANT_NAVBAR_CLASS = {
        light: 'bg-light',
        dark: 'bg-dark sky-dark'
      }.freeze

      # param title [String] The main application title text.
      # param subtitle [String, nil] An optional subtitle text.
      # param variant [Symbol] One of :light, :dark, :white - determines color scheme.
      # param background_color [String, nil] Optional RGB color value for background (i.e. '1, 104, 149').
      #                                      Used only when variant is :dark.
      def initialize(title:, subtitle: nil, variant: :light, background_color: nil)
        @title = title
        @subtitle = subtitle
        @variant = variant
        @background_color = background_color
        super()
      end

      attr_reader :variant, :background_color

      def masthead_classes
        merge_classes('masthead', VARIANT_MASTHEAD_CLASS[variant])
      end

      def navbar_classes
        merge_classes('navbar navbar-expand-md', VARIANT_NAVBAR_CLASS[variant])
      end

      def style_override
        return render SdrViewComponents::Structure::StyleOverrideLightComponent.new unless variant == :dark

        render SdrViewComponents::Structure::StyleOverrideDarkComponent.new(background_color:)
      end

      def subtitle
        return if @subtitle.blank?

        tag.span @subtitle, class: 'h4 d-block my-1'
      end

      def title
        tag.div(class: 'h1 my-0') do
          link_to @title, '/'
        end
      end
    end
  end
end
