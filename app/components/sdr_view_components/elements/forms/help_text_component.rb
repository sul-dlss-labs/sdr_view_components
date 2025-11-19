# frozen_string_literal: true

# Component for rendering help text for form fields.
module SdrViewComponents
  module Elements
    module Forms
      # Component for rendering help text for form fields.
      class HelpTextComponent < BaseComponent
        # this component can take plain text via 'help_text' or a block (which can contain html)
        # it will render the help_text if provided, else it will render the block content
        def initialize(form:, field_name:, text: nil, **args)
          @form = form
          @field_name = field_name
          @help_text = text
          @args = args
          args.delete(:classes)
          super()
        end

        attr_reader :help_text, :args, :form, :field_name

        def id
          @id ||= form.field_id(field_name, 'help')
        end

        def render?
          help_text.present? || content.present?
        end
      end
    end
  end
end
