# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Portal::AboutsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/portal/abouts').to route_to('portal/abouts#index')
    end

    it 'routes to #new' do
      expect(get: '/portal/abouts/new').to route_to('portal/abouts#new')
    end

    it 'routes to #show' do
      expect(get: '/portal/abouts/1').to route_to('portal/abouts#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/portal/abouts/1/edit').to route_to('portal/abouts#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/portal/abouts').to route_to('portal/abouts#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/portal/abouts/1').to route_to('portal/abouts#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/portal/abouts/1').to route_to('portal/abouts#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/portal/abouts/1').to route_to('portal/abouts#destroy', id: '1')
    end
  end
end
