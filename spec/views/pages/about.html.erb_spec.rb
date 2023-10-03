require 'rails_helper'

RSpec.describe 'pages/about.html.erb', type: :view do
  it 'displays the about page content' do
    render
    expect(rendered).to match(/about/)
  end
end
