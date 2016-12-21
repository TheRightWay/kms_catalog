module Kms
  module Catalog
    class OptionValuesController < ApplicationController
      def index
        @product = Product.find_by_id(params[:product_id])
        @variant = @product.variants.find_by_id(params[:variant_id])
        @option_values = @variant.option_values
        render json: @option_values.to_json(methods: [:tag, :name])
      end

      def create
        @product = Product.find_by_id(params[:product_id])
        @variant = @product.variants.find_by_id(params[:variant_id])
        @option_value = @variant.option_values.create(option_values_params)
        render json: @option_value.to_json
      end

      def destroy
        @option_value = OptionValue.find_by_id(params[:id])
        @option_value.destroy if @option_value
        render json: @option_value.to_json
      end

      protected

      def option_values_params
        params.require(:option_value).permit!
      end
    end
  end
end
