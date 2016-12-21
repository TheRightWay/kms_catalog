VariantsController = ($scope, $state, $cookieStore, Restangular, $stateParams) ->
  $scope.store = Restangular.one('products', $stateParams.product_id).all('variants')
  $scope.store.getList().then (variants) ->
     $scope.variants = variants#_.groupBy(option_types, 'tag')

  if $stateParams.id
    $scope.store.one($stateParams.id).get().then (variant)->
      $scope.variant = variant
  else
    $scope.variant = {}

  $scope.create = ->
    fd = new FormData
    fd.append('variant[name]', $scope.variant.name || '')
    fd.append('variant[price]', $scope.variant.price || '')
    fd.append('variant[image]', $scope.variant.image)
    $scope.store.withHttpConfig({ transformRequest: angular.identity }).post(fd, null, {"Content-Type": undefined}).then (variant)->
      $state.go('variants.edit', {product_id: $stateParams.product_id, id: variant.id})
    ,->
      console.log('bug')

  $scope.update = ->
    fd = new FormData
    fd.append('variant[name]', $scope.variant.name || '')
    fd.append('variant[price]', $scope.variant.price || '')
    if $scope.variant.image.constructor.name == "File"
      fd.append('variant[image]', $scope.variant.image)
    $scope.variant.withHttpConfig({ transformRequest: angular.identity }).post('', fd, '', {"Content-Type": undefined}).then ->
      $state.go('variants')
    ,->
      console.log('bug')

  $scope.destroy = (variant)->
    variant.remove().then ->
      $scope.variants = _.without($scope.variants, variant)

  # $scope.exceptCurrentCategory = ->
  #   new_products = []
  #   for p in $scope.products
  #     new_products.push(p) if p.id != ($scope.product && $scope.product.id)
  #   new_products


angular.module('KMS')
    .controller('VariantsController', ['$scope', '$state', '$cookieStore', 'Restangular', '$stateParams', VariantsController])
