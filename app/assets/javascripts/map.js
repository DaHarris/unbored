$(document).ready(function() {
  var map;

  function initialize() {
    var mapOptions = {
      zoom: 14,
    };
    var map = new google.maps.Map(document.getElementById('map-canvas'),
        mapOptions);

    google.maps.event.addListener(map, "click", function(event) {
      $('#lat > input').val(event.latLng.lat());
      $('#long > input').val(event.latLng.lng());
    });

    // Try HTML5 geolocation
    if(navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(position) {
        var pos = new google.maps.LatLng(position.coords.latitude,
                                         position.coords.longitude);

        map.setCenter(pos);

        var yourLat = position.coords.latitude;
        var yourLong = position.coords.longitude;
        var markers = [];
        var activityAsked = false;
        var allMarkers = [];


        // var input = document.getElementById('pac-input')
        // map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
        // var searchBox = new google.maps.places.SearchBox(input);
        //
        // //Listen for the event fired when the user selects an item from the
        // //pick list. Retrieve the matching places for that item.
        // google.maps.event.addListener(searchBox, 'places_changed', function() {
        //   var places = searchBox.getPlaces();
        //
        //   // if (places.length == 0) {
        //   //   return;
        //   // }
        //   // for (var i = 0, marker; marker = markers[i]; i++) {
        //   //   marker.setMap(null);
        //   // }
        //
        //   // For each place, get the icon, place name, and location.
        //   queryMarkers = [];
        //   var bounds = new google.maps.LatLngBounds();
        //   for (var i = 0, place; place = places[i]; i++) {
        //     var image = {
        //       url: place.icon,
        //       size: new google.maps.Size(71, 71),
        //       origin: new google.maps.Point(0, 0),
        //       anchor: new google.maps.Point(17, 34),
        //       scaledSize: new google.maps.Size(25, 25)
        //     };
        //
        //     // Create a marker for each place.
        //     var marker = new google.maps.Marker({
        //       map: map,
        //       icon: image,
        //       title: place.name,
        //       position: place.geometry.location
        //     });
        //
        //     queryMarkers.push(marker);
        //
        //     bounds.extend(place.geometry.location);
        //   }
        //   map.fitBounds(bounds);
        //   map.setZoom(14);
        // });

        function clearMarkers() {
          allMarkers = markers;
          for (i=0;i<markers.length;i++) {
            markers[i].setMap(null);
          }
        }

        function resetMarkers() {
          if (activityAsked == true) {
            for (i=0;i<allMarkers.length;i++) {
              allMarkers[i].setMap(map);
            }
            markers = allMarkers;
          }
        }

        $('#close').on('click', function() {
          $('.menupull').removeClass('open');
          $('.menupull').addClass('closed');
          $('#map-canvas').css('width','94%');
          google.maps.event.trigger(map, "resize");
        })

        function centerActivity(lat, long) {
          $('#map-canvas').css('width','24%');
          google.maps.event.trigger(map, "resize");
          position = new google.maps.LatLng(lat, long);
          map.setCenter(position);
          map.setZoom(16);
        }

        function menuPull(name) {
          $('#form').empty();
          $('#icons').html('<br>');
          $('#title').text();
          $('#extraInfo .infoExtras').empty();
          $('.infoExtras').remove();
          $('#icons').css('height', '50%');

          $('.menupull').removeClass('closed');
          $('.menupull').addClass('open');
          $('#title').text('Add New Activity');
          found = activities.filter(function(x) { return x.name === name})[0];
          activity = jQuery.extend({}, found);

          $('#title').text(activity.name);


          delete activity.id;
          delete activity.name;
          delete activity.lat;
          delete activity.long;
          delete activity.icon;

          for (var i in activity) {
            if (i === "description") {
              $('#icons').append('<div class="infoBox">' + activity[i].replace(/\n/g, "<br />") + '<br></div>');
            } else {
              $('#extraInfo').append('<div class="infoExtras">' + i + ': ' + activity[i] + '<br></div>');
            }
          }
        }

        var activities = [];

        function getActivities() {
          $.ajax({
            url: "/activities/getAllActivities",
            type: "get"
          }).success(function(data) {
            $.each(data, function(index, activity) {
              activities.push(activity);
              setMarker(activity.lat, activity.long, activity.name, activity.icon);
            })
          })
        };

        $('.sidebar > .svg-icons').on('click', function() {
          $('#form').empty();
          if (this.id === "reset") {
            resetMarkers();
          } else if (this.id != "add") {
            getActivity(this.id);
          }
        });

        getActivities();
        setMarker();

        function getActivity(choice) {
          activityAsked = true;
          clearMarkers();
          setMarker();
          params = {model: choice};
          $.ajax({
            url: "/activities/getActivity",
            type: "get",
            data: params
          }).success(function(data) {
            $.each(data, function(index, activity) {
              console.log(activity);
              setMarker(activity.lat, activity.long, activity.name, activity.icon);
            });
          });
        }

        $('#add').on('click', function() {
          $('#icons').css('height', '20%');
          $('#extraInfo .infoExtras').empty();
          $('.infoExtras').remove();
          center = map.getCenter();
          $('#map-canvas').css('width','24%');
          google.maps.event.trigger(map, "resize");
          map.panTo(center);
          $('#icons').empty();
          $('.menupull').removeClass('closed');
          $('.menupull').addClass('open');
          $('#title').text('Add New Activity');
          $('.svg-icons').each(function(index) {
            if (index === 0 || index === 1) {
              return true;
            }
            $('#icons').append($(this).clone());
          });
          $('#icons > .svg-icons').on('click', function() {
            $('#form').empty();
            modelName = this.id;
            var params = {model: modelName};
            $.ajax({
              url: '/activities/getFormInfo',
              type: 'get',
              data: params
            }).success(function(data) {
              $.each(data, function(attr, type) {
                if (type === "string" && attr != "description") {
                  $('#form').append('<form id="' + attr +'">' + attr +':<br><input type="text"><br></form>');
                } else if (attr === "lat" || attr === "long") {
                  $('#form').append('<form id="' + attr +'"> Click on map to set ' + attr +':<br><input type="number"><br></form>');
                } else if (type === "integer" || type === "float") {
                  $('#form').append('<form id="' + attr +'">' + attr +':<br><input type="number"><br></form>');
                }  else if (attr == "description") {
                  $('#form').append('<form id="' + attr + '">' + attr +':<br><textarea rows="4" cols="50"></textarea></form>');
                }
              });
              $('#form').append('<input type="submit" id="submit" value="Submit"><br><br><br><br><br>');
              submitListener(modelName);
            })
          });
        });

        function submitListener(modelName) {
          $('#submit').on('click', function() {
            var params = {model: modelName};
            $('input').each(function(index, info) {
              params[$(info).parent()[0].id] = $(info).val();
            });
            params[$('textarea').parent()[0].id] = $('textarea').val();
            delete params['form'];
            submit(params);
          });
        }

        function submit(params) {
          $.ajax({
            url: '/activities/newActivity',
            type: 'post',
            data: params
          }).success(function(data) {
            if (data["success"] === "true") {
              setMarker(data["lat"], data["long"], data["name"], data["icon"]);
              $('.menupull').removeClass('open');
              $('.menupull').addClass('closed');
              $('#map-canvas').css('width','94%');
              $('#form').empty();
              $('#title').text();
              delete params.model
              activities.push(params);
              google.maps.event.trigger(map, "resize");
            } else {
              $('#form').prepend('<div id="error" style="font-size: 150%;background: #DDDDDD;color: red;width: 100%;height: 5%;">Error: All information must be filled out.</div><br>')
            }
          });
        }

        function setMarker(lat, long, title, icon) {
          if (lat === undefined && long === undefined) {
            lat = yourLat;
            long = yourLong;
            title = "Your Location";
          }

          pos = new google.maps.LatLng(lat,long);

          var iconbase;

          if (title == "Your Location") {
            icon = 'http://piepho.com/wp-content/uploads/2012/12/glyphicons_242_google_maps.png';
          } else {
            iconBase = '/assets/' + icon;
            var icon = {
              url: iconBase,
              scaledSize: new google.maps.Size(32,32),
              origin: new google.maps.Point(0,0),
              anchor: new google.maps.Point(0,0)
            }
          }

          var marker = new google.maps.Marker({
              position: pos,
              map: map,
              title: title,
              icon: icon
          });

          markers.push(marker);

          if (title != "Your Location") {
            google.maps.event.addListener(marker, 'click', function(){menuPull(marker.title);});
            google.maps.event.addListener(marker, 'click', function(){centerActivity(lat, long);});
          }
        }
      }, function() {
        handleNoGeolocation(true);
      });
    } else {
      // Browser doesn't support Geolocation
      handleNoGeolocation(false);
    }
  }

  function handleNoGeolocation(errorFlag) {
    if (errorFlag) {
      var content = 'Error: The Geolocation service failed.';
    } else {
      var content = 'Error: Your browser doesn\'t support geolocation.';
    }

    var options = {
      map: map,
      position: new google.maps.LatLng(60, 105),
      content: content
    };

    map.setCenter(options.position);
  }

  google.maps.event.addDomListener(window, 'load', initialize);

});
