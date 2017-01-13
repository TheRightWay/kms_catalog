module Kms
  module Catalog
    class ProductsController < ApplicationController
      def index
        render json: Product.order(:name)
      end

      def create
        product_params[:category_ids] = product_params[:category_ids].split(',') if product_params[:category_ids]
        @product = Product.new(product_params)
        @product.save
        render json: @product
      end

      def update
        product_params[:category_ids] = product_params[:category_ids].split(',') if product_params[:category_ids]
        @product = Product.find(params[:id])
        @product.update_attributes(product_params)
        render json: @product
      end

      def show
        @product = Product.find(params[:id])
        render json: @product
      end

      def destroy
        @product = Product.find(params[:id])
        @product.destroy
        render json: @product
      end

      protected

      def product_params
        params.require(:product).permit(:name, :description, :category_ids, :seo_title, :seo_keywords, :seo_description, master_attributes: [:price, :image, :id])
      end
    end
  end
end
