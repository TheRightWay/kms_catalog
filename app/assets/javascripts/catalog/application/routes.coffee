'use strict'

angular.module('KMS').config ['$stateProvider', '$urlRouterProvider', ($stateProvider, $urlRouterProvider) ->

    # Application routes
    $stateProvider
        .state('categories', {
            url: '/kms/categories',
            views:
              "header":
                template: "Категории"
              "@":
                controller: 'CategoriesController',
                controllerAs: 'categories',
                templateUrl: 'categories/index.html',
        })
        .state('categories.new', {
            url: '/new',
            views:
              "header@":
                template: "Новая Категория"
              "@":
                controller: 'CategoriesController',
                controllerAs: 'categories',
                templateUrl: 'categories/new.html',
        })
        .state('categories.edit', {
            url: '/:id/edit',
            views:
              "header@":
                template: "Редактирование Категории"
              "@":
                controller: 'CategoriesController',
                controllerAs: 'categories',
                templateUrl: 'categories/edit.html',
        })
        .state('products', {
            url: '/kms/products',
            views:
              "header":
                template: "Продукты"
              "@":
                controller: 'ProductsController',
                controllerAs: 'products',
                templateUrl: 'products/index.html',
        })
        .state('products.new', {
            url: '/new',
            views:
              "header@":
                template: "Новый Продукт"
              "@":
                controller: 'ProductsController',
                controllerAs: 'products',
                templateUrl: 'products/new.html',
        })
        .state('products.edit', {
            url: '/:id/edit',
            views:
              "header@":
                template: "Редактирование Продукта"
              "@":
                controller: 'ProductsController',
                controllerAs: 'products',
                templateUrl: 'products/edit.html',
        })
        .state('variants', {
          url: '/kms/products/:product_id/variants',
          views:
            "header":
              template: "Варианты"
            "@":
              controller: 'VariantsController',
              controllerAs: 'variants',
              templateUrl: 'products/variants/index.html'
          })
        .state('variants.new', {
          url: '/new',
          views:
            "header@":
              template: "Новый Вариант"
            "@":
              controller: 'VariantsController',
              controllerAs: 'variants',
              templateUrl: 'products/variants/new.html'
          })
        .state('variants.edit', {
          url: '/:id/edit',
          views:
            "header@":
              template: "Редактирование Варианта"
            "@":
              controller: 'VariantsController',
              controllerAs: 'variants',
              templateUrl: 'products/variants/edit.html'
          })
]
