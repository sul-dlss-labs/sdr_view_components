# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SdrViewComponents::Structure::HeaderComponent, type: :component do
  it 'renders title and subtitle' do
    render_inline(described_class.new(title: 'Test Header', subtitle: 'Test Subtitle'))

    expect(page).to have_text('Test Header')
    expect(page).to have_text('Test Subtitle')
  end

  context 'when subtitle is not provided' do
    it 'does not render subtitle element' do
      render_inline(described_class.new(title: 'Test Header'))

      expect(page).to have_text('Test Header')
      expect(page).to have_no_selector('span.h4')
    end
  end
end
