module Kms
  module Catalog
    class ProductsController < ApplicationController
      def index
        render json: Product.order(:name).to_json
      end

      def create
        product_params[:category_ids] = product_params[:category_ids].split(',') if product_params[:category_ids]
        @product = Product.new(product_params)
        @product.save
        render json: @product.to_json
      end

      def update
        product_params[:category_ids] = product_params[:category_ids].split(',') if product_params[:category_ids]
        @product = Product.find(params[:id])
        @product.update_attributes(product_params)
        render json: @product.to_json
      end

      def show
        @product = Product.find(params[:id])
        render json: @product.to_json(methods: :category_ids, include: :properties)
      end

      def destroy
        @product = Product.find(params[:id])
        @product.destroy
        render json: @product.to_json
      end

      protected

      def product_params
        params.require(:product).permit!
      end
    end
  end
end
