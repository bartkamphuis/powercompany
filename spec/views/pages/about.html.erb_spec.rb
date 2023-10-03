require 'rails_helper'

RSpec.describe 'pages/about.html.erb', type: :view do
  it 'displays the about page content' do
    @markdown = """
# About

This is the about page.
"""
    render
    expect(rendered).to match(/About/)
  end
end
