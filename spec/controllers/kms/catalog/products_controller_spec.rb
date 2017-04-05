require 'spec_helper'

module Kms
  module Catalog
    describe ProductsController, type: :controller do
      routes { Kms::Catalog::Engine.routes }
      login_user
      describe 'GET index' do
        it 'returns products json representation' do
          FactoryGirl.create(:product)
          get :index, format: :json

          expect(response).to be_success
          expect(json.length).to eq(1)
          expect(json[0].keys).to include('id', 'name', 'description', 'category_ids', 'seo_title', 'seo_keywords', 'seo_description')
        end
        it 'returns products ordered by position' do
          product1 = FactoryGirl.create(:product, name: 'Product 2')
          product2 = FactoryGirl.create(:product, name: 'Product 1')
          get :index, format: :json

          expect(response).to be_success
          expect(json[0]['name']).to be_eql(product1.name)
          expect(json[1]['name']).to be_eql(product2.name)
        end
      end


    end
  end
end
