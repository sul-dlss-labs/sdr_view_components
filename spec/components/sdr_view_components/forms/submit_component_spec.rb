# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SdrViewComponents::Forms::SubmitComponent, type: :component do
  let(:form) { ActionView::Helpers::FormBuilder.new(nil, test_form, vc_test_view_context, {}) }
  let(:form_class) { Class.new(ApplicationForm) }
  let(:test_form) { form_class.new }

  context 'with a label' do
    it 'renders the submit button' do
      render_inline(described_class.new(form:, label: 'Deposit'))
      expect(page).to have_button(value: 'Deposit', type: 'submit', name: 'commit')
    end
  end

  context 'with content and a value' do
    it 'renders the submit button' do
      render_inline(described_class.new(form:, value: 'deposit-value').with_content('Deposit'))
      expect(page).to have_button('Deposit', value: 'deposit-value', type: 'submit', name: 'commit')
    end
  end
end
