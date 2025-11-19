# frozen_string_literal: true

module SdrViewComponents
  module Elements
    module Forms
      # Component for form checkbox field
      class Checkbox2Component < BaseComponent
        # container_* args are passed as attributes to the container div
        # input_* args are passed as attributes to the input element
        # label_* args are passed as args to the LabelComponent
        # help_* args are passed as args to the HelpTextComponent
        # feedback_* args are passed as args to the InvalidFeedbackComponent
        def initialize(form:, field_name:, **args)
          @form = form
          @field_name = field_name
          @container_args = args_for(args:, prefix: 'container_')
          @container_classes = @container_args.delete(:classes)
          @input_args = args_for(args:, prefix: 'input_')
          @input_classes = @input_args.delete(:classes)
          @label_args = args_for(args:, prefix: 'label_')
          label_args[:default_class] = 'form-check-label'
          @help_args = args_for(args:, prefix: 'help_')
          @feedback_args = args_for(args:, prefix: 'feedback_')
          super()
        end

        attr_reader :form, :field_name, :container_args, :input_args, :label_args, :help_args, :feedback_args

        def container_classes
          merge_classes('form-check', @container_classes)
        end

        def input_classes
          merge_classes('form-check-input', @input_classes)
        end

        def aria_describedby
          return if help_args[:text].blank?

          form.field_id(field_name, 'help')
        end
      end
    end
  end
end
