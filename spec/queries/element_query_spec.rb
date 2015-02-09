require 'rails_helper'

describe ElementQuery do

  let(:element) { create(:element) }
  let(:params) { { search: { direction: 'south' } } }
  let(:element_query) { ElementQuery.new(params) }

  context '#search' do
    it { expect(element_query.search).to eq([]) }
  end
end