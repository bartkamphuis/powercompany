require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the PagesHelper. For example:

RSpec.describe PagesHelper, type: :helper do
  describe 'string concat' do
    it 'concatenates two strings with spaces' do
      expect(helper.concat_strings('this', 'that')).to eq('this that')
    end
  end
end
