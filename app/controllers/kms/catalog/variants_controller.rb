module Kms
  module Catalog
    class VariantsController < ApplicationController
      def index
        @product = Product.find_by_id(params[:product_id])
        @variants = @product.variants
        render json: @variants.to_json
      end

      def show
        @variant = Variant.find_by_id(params[:id])
        render json: @variant.to_json
      end

      def create
        @variant = Variant.create(variant_params.merge({product_id: params[:product_id]}))
        render json: @variant.to_json
      end

      def update
        @variant = Variant.find(params[:id])
        @variant.update_attributes(variant_params)
        render json: @variant.to_json
      end

      def destroy
        @variant = Variant.find_by_id(params[:id])
        @variant.destroy
        render json: @variant.to_json
      end

      def available_option_types
        @product = Product.find_by_id(params[:product_id])
        @variant = Variant.find_by_id(params[:id])
        @option_types = @product.option_types - @variant.option_values.map(&:option_type)
        render json: @option_types.to_json
      end

      protected

      def variant_params
        params.require(:variant).permit!
      end
    end
  end
end
