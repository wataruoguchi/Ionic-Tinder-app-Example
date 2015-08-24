(->
  "use strict"
  ###
  # FacebookAPI is function collection related to FB.
  ###
  FacebookAPI = ($q, $http, localStorageService) ->
    baseEndpoint = "https://graph.facebook.com/v2.4"

    # Get photo URL by photo id.
    getPhotoURL: (photo) ->
      baseEndpoint + "/" + photo.id + "/picture?access_token=" + localStorageService.accessToken

    # Get photos by album id.
    getPhotosByAlbum: (album) ->
      deferred = $q.defer()
      $http.get(baseEndpoint + "/" + album.id + "/photos"
      {
        params: {
          access_token: localStorageService.accessToken
          fields: "id"
          format: "json"
        }
      }).then((result) ->
        # result.data.data is the albums's photo list
        deferred.resolve(result.data.data)
        return
      (error) ->
        console.log "error at getPhotosByAlbum"
        deferred.reject("error at getPhotosByAlbum")
        return
      )
      deferred.promise

    # Get albums.
    getAlbums: ->
      deferred = $q.defer()
      $http.get(baseEndpoint + "/me/albums"
      {
        params: {
          access_token: localStorageService.accessToken
          fields: "id, cover_photo"
          format: "json"
        }
      }).then((result) ->
        # result.data.data is user's album list
        deferred.resolve(result.data.data)
        return
      (error) ->
        console.log "error at getAlbums"
        deferred.reject("error at getAlbums")
        return
      )
      deferred.promise

    # Get user's FB name.
    getProfileName: ->
      deferred = $q.defer()
      $http.get(baseEndpoint + "/me/"
      {
        params: {
          access_token: localStorageService.accessToken
          fields: "name"
          format: "json"
        }
      }).then((result) ->
        # result.data.name is name of user
        deferred.resolve(result.data.name)
        return
      (error) ->
        console.log "error at getProfileName"
        deferred.reject("error at getProfileName")
        return
      )
      deferred.promise

    # Get user's FB profile photo.
    getProfilePicture: ->
      deferred = $q.defer()
      $http.get(baseEndpoint + "/me/"
      {
        params: {
          access_token: localStorageService.accessToken
          fields: "picture"
          format: "json"
        }
      }).then((result) ->
        # result.data.picture.data.url is a URL of profile
        deferred.resolve(result.data.picture.data.url)
        return
      (error) ->
        console.log "error at getProfilePicture"
        deferred.reject("error at getProfilePicture")
        return
      )
      deferred.promise

    # Get user's FB feed.
    getFeed: ->
      deferred = $q.defer()
      $http.get(baseEndpoint + "/me/feed"
      {
        params: {
          access_token: localStorageService.accessToken
          format: "json"
        }
      }).then((result) ->
        # result.data.data is feed data
        deferred.resolve(result.data.data)
        return
      (error) ->
        console.log "error at getFeed"
        deferred.reject("error at getFeed")
        return
      )
      deferred.promise

  angular
  .module("starter")
  .factory("FacebookAPI", FacebookAPI)
)()
