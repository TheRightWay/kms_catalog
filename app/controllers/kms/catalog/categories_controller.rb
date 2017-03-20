module Kms
  module Catalog
    class CategoriesController < ApplicationController
      def index
        render json: Category.order(:position).to_json(methods: :parent_id, except: :ancestry)
      end

      def create
        category_params.merge!(parent_id: params[:parent_id]) if params[:parent_id]
        @category = Category.new(category_params)
        @category.save
        render json: @category.to_json
      end

      def update
        category_params.merge!(parent_id: params[:parent_id]) if params[:parent_id]
        @category = Category.find(params[:id])
        @category.update_attributes(category_params)
        render json: @category.to_json
      end

      def show
        @category = Category.find(params[:id])
        render json: @category.to_json(methods: :parent_id, except: :ancestry)
      end

      def destroy
        @category = Category.find(params[:id])
        @category.destroy
        render json: @category.to_json
      end

      protected

      def category_params
        params.require(:category).permit!
      end
    end
  end
end
