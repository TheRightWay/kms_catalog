module Kms
  module Catalog
    class PropertiesController < ApplicationController

      def index
        @product = Product.find_by_id(params[:product_id])
        @properties = @product.properties
        render json: @properties.to_json
      end

      def create
        @property = Property.new(property_params.merge(product_id: params[:product_id]))
        @property.save
        render json: @property.to_json
      end

      def update
        @property = Property.find(params[:id])
        @property.update_attributes(property_params.merge(product_id: params[:product_id]))
        render json: @property.to_json
      end

      def destroy
        @property = Property.find(params[:id])
        @property.destroy
        render json: @property.to_json
      end

      def tags
        @product = Product.find_by_id(params[:product_id])
        render json: @product.properties.pluck(:tag).uniq.to_json
      end

      protected

      def property_params
        params.require(:property).permit!
      end
    end
  end
end
