OptionTypesController = ($scope, $state, $cookieStore, Restangular, $stateParams) ->
  $scope.option_type = {}
  # $scope.editorOptions =
  #   filebrowserUploadUrl: '/assets/ckeditor'
  #
  # Restangular.all('users').customGET('kms_user').then (current_user) ->
  #   $scope.currentUser = current_user
  #   $scope.currentUser.admin = $scope.currentUser.role == 'admin'
  #
  # $scope.categories = []
  Restangular.all('option_types').getList().then (option_types) ->
    $scope.global_option_types = option_types

  $scope.store = Restangular.service('option_types', Restangular.one('products', $stateParams.id))
  $scope.store.getList().then (option_types) ->
     $scope.option_types = _.groupBy(option_types, 'tag')
     $scope.tags = Object.keys($scope.option_types)
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
    $scope.store.post($scope.option_type).then ->
      $scope.store.getList().then (option_types) ->
         $scope.option_types = _.groupBy(option_types, 'tag')
         $scope.tags = Object.keys($scope.option_types)
      $scope.option_type = {}
      console.log('option type created!')
    ,->
      console.log('bug')
  #
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
  $scope.destroy = (option_type)->
    option_type.remove().then ->
      $scope.store.getList().then (option_types) ->
         $scope.option_types = _.groupBy(option_types, 'tag')
         $scope.tags = Object.keys($scope.option_types)
  #
  # $scope.exceptCurrentCategory = ->
  #   new_products = []
  #   for p in $scope.products
  #     new_products.push(p) if p.id != ($scope.product && $scope.product.id)
  #   new_products


angular.module('KMS')
    .controller('OptionTypesController', ['$scope', '$state', '$cookieStore', 'Restangular', '$stateParams', OptionTypesController])
