require 'rails_helper'

RSpec.describe 'pages/home.html.erb', type: :view do
  it 'displays the home page content' do
    render
    expect(rendered).to match(/home/)
  end
end
