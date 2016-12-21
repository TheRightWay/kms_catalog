PropertiesController = ($scope, $state, $cookieStore, Restangular, $stateParams) ->
  $scope.property = {}
  # $scope.editorOptions =
  #   filebrowserUploadUrl: '/assets/ckeditor'
  #
  # Restangular.all('users').customGET('kms_user').then (current_user) ->
  #   $scope.currentUser = current_user
  #   $scope.currentUser.admin = $scope.currentUser.role == 'admin'
  #
  # $scope.categories = []
  $scope.store = Restangular.service('properties', Restangular.one('products', $stateParams.id))
  $scope.store.getList().then (properties) ->
     $scope.properties = _.groupBy(properties, 'tag')
     $scope.tags = Object.keys($scope.properties)

  $scope.create = ->
    $scope.store.post($scope.property).then ->
      $scope.store.getList().then (properties) ->
         $scope.properties = _.groupBy(properties, 'tag')
         $scope.tags = Object.keys($scope.properties)
      $scope.property = {}
      console.log('property created!')
    ,->
      console.log('bug')

  $scope.update = (data, property)->
    property.name = data.name
    property.value = data.value
    property.save()

  $scope.destroy = (property)->
    property.remove().then ->
      $scope.store.getList().then (properties) ->
         $scope.properties = _.groupBy(properties, 'tag')
         $scope.tags = Object.keys($scope.properties)

angular.module('KMS')
    .controller('PropertiesController', ['$scope', '$state', '$cookieStore', 'Restangular', '$stateParams', PropertiesController])
