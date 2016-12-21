OptionValuesController = ($scope, $state, $cookieStore, Restangular, $stateParams) ->
  # $scope.editorOptions =
  #   filebrowserUploadUrl: '/assets/ckeditor'
  #
  # Restangular.all('users').customGET('kms_user').then (current_user) ->
  #   $scope.currentUser = current_user
  #   $scope.currentUser.admin = $scope.currentUser.role == 'admin'
  #
  # $scope.categories = []
  $scope.option_value = {}

  $scope.store = Restangular.one('products', $stateParams.product_id).one('variants', $stateParams.id).all('option_values')
  $scope.store.getList().then (option_values) ->
     $scope.option_values = _.groupBy(option_values, 'tag')

  Restangular.one('products', $stateParams.product_id).one('variants', $stateParams.id).customGET('available_option_types').then (option_types) ->
    $scope.available_option_types = option_types

  # $scope.store = Restangular.all('products')
  # $scope.store.getList().then (products)->
  #   $scope.products = products
  #
  # if $stateParams.id
  #   $scope.store.get($stateParams.id).then (product)->
  #     $scope.product = product
  # else
  #   $scope.product = {category_ids: []}
  #

  $scope.create = ->
    $scope.store.post($scope.option_value).then ->
      $scope.store.getList().then (option_types) ->
         $scope.option_values = _.groupBy(option_types, 'tag')
      $scope.option_value = {}
      Restangular.one('products', $stateParams.product_id).one('variants', $stateParams.id).customGET('available_option_types').then (option_types) ->
        $scope.available_option_types = option_types
      console.log('option value created!')
    ,->
      console.log('bug')

  # $scope.update = ->
  #   fd = new FormData
  #   fd.append('product[name]', $scope.product.name || '')
  #   fd.append('product[description]', $scope.product.description || '')
  #   fd.append('product[price]', $scope.product.price || '')
  #   fd.append('product[category_ids]', $scope.product.category_ids)
  #   if $scope.product.image.constructor.name == "File"
  #     fd.append('product[image]', $scope.product.image)
  #   if $scope.product.preview_image.constructor.name == "File"
  #     fd.append('product[preview_image]', $scope.product.preview_image)
  #   $scope.product.withHttpConfig({ transformRequest: angular.identity }).post('', fd, '', {"Content-Type": undefined}).then ->
  #     $state.go('products')
  #   ,->
  #     console.log('bug')
  #
  $scope.destroy = (option_value)->
    option_value.remove().then ->
      $scope.store.getList().then (option_values) ->
         $scope.option_values = _.groupBy(option_values, 'tag')
      Restangular.one('products', $stateParams.product_id).one('variants', $stateParams.id).customGET('available_option_types').then (option_types) ->
        $scope.available_option_types = option_types
  #
  # $scope.exceptCurrentCategory = ->
  #   new_products = []
  #   for p in $scope.products
  #     new_products.push(p) if p.id != ($scope.product && $scope.product.id)
  #   new_products


angular.module('KMS')
    .controller('OptionValuesController', ['$scope', '$state', '$cookieStore', 'Restangular', '$stateParams', OptionValuesController])
