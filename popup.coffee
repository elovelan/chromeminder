# Modeled this on an example from Google to show kittens.

QUERY = 'bees';

beeGenerator =
    searchOnFlickr_: "https://secure.flickr.com/services/rest/?\
        method=flickr.photos.search&\
        api_key=90485e931f687a9b9c2a66bf58a3861a&\
        text=#{encodeURIComponent(QUERY)}&\
        safe_search=0&\
        content_type=1&\
        sort=interestingness-desc&\
        per_page=20"

    # Sends an XHR GET request to grab photos. The XHR's 'onload' event is 
    # hooked up to the 'showPhotos_' method.
    requestBees: ->
        req = new XMLHttpRequest()
        req.open "GET", this.searchOnFlickr_, true
        req.onload = this.showPhotos_
        req.send null

    # Handle the 'onload' event of our XHR request, generated in 'requestBees',
    # by generating 'img' elements, and stuffing them into the document for 
    # display.
    showPhotos_: (e) =>
        bees = e.target.responseXML.querySelectorAll 'photo'
        for bee in bees
            img = document.createElement 'img'
            img.src = this.constructBeeURL_ bee
            img.setAttribute 'alt', bee.getAttribute 'title'
            document.body.appendChild img
        return

    # Given a photo, construct a URL...
    constructBeeURL_: (photo) ->
        "http://farm#{photo.getAttribute "farm"}\
        .static.flickr.com/#{photo.getAttribute "server"}\
        /#{photo.getAttribute "id"}\
        _#{photo.getAttribute "secret"}\
        _s.jpg"

# Run bee generation script as soon as the document's DOM is ready.
document.addEventListener 'DOMContentLoaded', ->
    beeGenerator.requestBees
