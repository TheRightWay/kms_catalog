module Kms
  module Catalog
    class OptionTypesController < ApplicationController

      def index
        if params[:product_id]
          @product = Product.find_by_id(params[:product_id])
          @option_types = @product.option_types
        else
          @option_types = OptionType.all.uniq
        end
        render json: @option_types.to_json
      end

      def create
        @option_type = OptionType.find_or_create_by(option_types_params)
        @product = Product.find_by_id(params[:product_id])
        @product.option_types << @option_type unless @product.option_types.include?(@option_type)
        render json: @option_type
      end

      def destroy
        @product = Product.find_by_id(params[:product_id])
        @option_type = @product.option_types.find(params[:id])
        @product.option_types.delete @option_type
        @option_type.destroy if @option_type.products.empty?
        render json: @option_types
      end

      def tags
        @product = Product.find_by_id(params[:product_id])
        render json: @product.option_types.pluck(:tag).uniq.to_json
      end

      protected

      def option_types_params
        params.require(:option_type).permit!
      end
    end
  end
end
