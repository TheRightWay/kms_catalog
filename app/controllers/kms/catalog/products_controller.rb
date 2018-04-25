module Kms
  module Catalog
    class ProductsController < ApplicationController
      def index
        render json: Product.order(:position)
      end

      def create
        @product = Product.new(product_params)
        if @product.save
          render json: @product
        else
          render json: { errors: @product.errors.full_messages }.to_json, status: :unprocessable_entity
        end
      end

      def update
        @product = Product.find(params[:id])
        if @product.update_attributes(product_params)
          head :no_content
        else
          render json: { errors: @product.errors.full_messages }.to_json, status: :unprocessable_entity
        end
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
        product_parameters = params.require(:product)
        product_parameters[:category_ids] = product_parameters[:category_ids].split(',') if product_parameters[:category_ids]
        product_parameters.permit(:name, :description, :seo_title, :seo_keywords, :seo_description, :position, { master_attributes: [:price, :image, :id], category_ids: [] })
      end
    end
  end
end
