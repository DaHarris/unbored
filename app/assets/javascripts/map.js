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

        $('#close').on('click', function() {
          $('.menupull').removeClass('open');
          $('.menupull').addClass('closed');
          $('#map-canvas').css('width','94%');
          google.maps.event.trigger(map, "resize");
        })

        function centerActivity(lat, long) {
          $('#map-canvas').css('width','30%');
          google.maps.event.trigger(map, "resize");
          position = new google.maps.LatLng(lat, long);
          map.setCenter(position);
          map.setZoom(16);
        }

        function menuPull(name) {

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

        getActivities();
        setMarker();

        function setMarker(lat, long, title, icon) {
          if (lat === undefined && long === undefined) {
            lat = position.coords.latitude;
            long = position.coords.longitude;
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
