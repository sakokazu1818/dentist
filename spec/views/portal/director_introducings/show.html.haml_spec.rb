# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'portal/director_introducings/show', type: :view do
  before(:each) do
    @portal_director_introducing = assign(:portal_director_introducing, Portal::DirectorIntroducing.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
