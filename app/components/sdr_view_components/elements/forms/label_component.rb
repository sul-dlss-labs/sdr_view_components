# frozen_string_literal: true

module SdrViewComponents
  module Elements
    module Forms
      # Component for rendering a form label.
      class LabelComponent < BaseComponent
        def initialize(form:, field_name:, label_text: nil, default_class: 'form-label', hidden: false, # rubocop:disable Metrics/ParameterLists
                       classes: [], tooltip: nil, caption: nil)
          @form = form
          @label_text = label_text
          @field_name = field_name
          @hidden_label = hidden
          @default_label_class = default_class
          @classes = classes
          @tooltip = tooltip
          @caption = caption
          super()
        end

        attr_reader :field_name, :form, :tooltip, :caption

        def label_text
          return field_name if @label_text.blank?

          @label_text
        end

        def classes
          merge_classes(@default_label_class, @classes, @hidden_label ? 'visually-hidden' : nil)
        end
      end
    end
  end
end
