ProductsController = ($scope, $state, $cookieStore, Restangular, $stateParams) ->
  $scope.editorOptions =
    filebrowserUploadUrl: '/assets/ckeditor'

  Restangular.all('users').customGET('kms_user').then (current_user) ->
    $scope.currentUser = current_user
    $scope.currentUser.admin = $scope.currentUser.role == 'admin'

  $scope.categories = []
  Restangular.all('categories').getList().then (categories)->
    $scope.categories = categories
  $scope.store = Restangular.all('products')
  $scope.store.getList().then (products)->
    $scope.products = products

  if $stateParams.id
    $scope.store.get($stateParams.id).then (product)->
      $scope.product = product
  else
    $scope.product = {category_ids: []}

  $scope.addCat = (item, model) ->
    index = $scope.product.category_ids.indexOf(item.id)
    unless index > -1
      $scope.product.category_ids.push(item.id)
  $scope.removeCat = (item, model) ->
    index = $scope.product.category_ids.indexOf(item.id)
    if index > -1
      $scope.product.category_ids.splice(index, 1)

  $scope.create = ->
    fd = new FormData
    fd.append('product[name]', $scope.product.name || '')
    fd.append('product[description]', $scope.product.description || '')
    fd.append('product[price]', $scope.product.price || '')
    fd.append('product[category_ids]', $scope.product.category_ids)
    fd.append('product[image]', $scope.product.image)
    fd.append('product[preview_image]', $scope.product.preview_image)
    fd.append('product[seo_title]', $scope.product.seo_title || '')
    fd.append('product[seo_keywords]', $scope.product.seo_keywords || '')
    fd.append('product[seo_description]', $scope.product.seo_description || '')
    $scope.store.withHttpConfig({ transformRequest: angular.identity }).post(fd, null, {"Content-Type": undefined}).then ->
      $state.go('products')
    ,->
      console.log('bug')

  $scope.update = ->
    fd = new FormData
    fd.append('product[name]', $scope.product.name || '')
    fd.append('product[description]', $scope.product.description || '')
    fd.append('product[price]', $scope.product.price || '')
    fd.append('product[category_ids]', $scope.product.category_ids)
    fd.append('product[seo_title]', $scope.product.seo_title || '')
    fd.append('product[seo_keywords]', $scope.product.seo_keywords || '')
    fd.append('product[seo_description]', $scope.product.seo_description || '')
    if $scope.product.image.constructor.name == "File"
      fd.append('product[image]', $scope.product.image)
    if $scope.product.preview_image.constructor.name == "File"
      fd.append('product[preview_image]', $scope.product.preview_image)
    $scope.product.withHttpConfig({ transformRequest: angular.identity }).post('', fd, '', {"Content-Type": undefined}).then ->
      $state.go('products')
    ,->
      console.log('bug')

  $scope.destroy = (product)->
    product.remove().then ->
      $scope.products = _.without($scope.products, product)

  $scope.exceptCurrentCategory = ->
    new_products = []
    for p in $scope.products
      new_products.push(p) if p.id != ($scope.product && $scope.product.id)
    new_products


angular.module('KMS')
    .controller('ProductsController', ['$scope', '$state', '$cookieStore', 'Restangular', '$stateParams', ProductsController])
