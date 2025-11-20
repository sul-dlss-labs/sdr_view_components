# frozen_string_literal: true

module SdrViewComponents
  module Forms
    # Component for form checkbox field
    class BasicCheckboxComponent < BaseComponent
      def initialize(form:, field_name:, **args)
        @form = form
        @field_name = field_name
        @args = args
        super()
      end

      attr_reader :args, :form, :field_name, :value

      def call
        form.check_box field_name, args
      end
    end
  end
end
