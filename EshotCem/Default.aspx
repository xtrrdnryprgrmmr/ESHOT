<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EshotCem._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

 <style>
     body{
         background-color:darkseagreen;
     }
        #map {
        height: 700px;
        width: 1100px;
        margin-top:10px;
        }
 </style>

    <div id="map">
      
    <script>
        function run() {
            $.ajax({
                url: "https://apex.oracle.com/pls/apex/cem/671/stations",
                type: "GET",
                dataType: "json",
                success: function (result) {
                    jQuery.each(result, function (i, val) {
                        $("#" + i).append(document.createTextNode(" - " + val));
                        //return locations;
                    });
                    console.log(result);
                }
            });
       
        }
    </script>
         <script>

       function initMap() {
           var directionsService = new google.maps.DirectionsService;
           var directionsDisplay = new google.maps.DirectionsRenderer;

           var myCenter = new google.maps.LatLng(38.397606, 27.071213);

           var map = new google.maps.Map(document.getElementById('map'), {
               zoom: 15,
               center: myCenter
           });
  
           var marker;
           var locations = getlocationsInfo();
           for ( i = 0; i < locations.length; i++) {
              var marker = new google.maps.Marker({
                  position: new google.maps.LatLng(locations[i][1], locations[i][2]),
                  map: map,
                  title: locations[i][0]
               });
           }
           var infowindow = new google.maps.InfoWindow();
           var i;
           google.maps.event.addListener(marker, 'click', (function (marker, i) {
               return function () {
                   infowindow.setContent(locations[i][0]);

                   infowindow.open(map, marker);
               }
           })(marker, i));

          }

    
       function getlocationsInfo() {
           return locations = [
            ['Fahrettin Altay', 38.397606, 27.071213],
['ikinci oyak sitesi', 38.391610, 27.070373],
['Mehmetçik', 38.396782, 27.069675],
['üçkuyular meydan', 38.397114, 27.068511],
['meşale', 38.362268,27.084288],
['cennetçeşme', 38.362198, 27.087928],
['güzel izmir camii', 38.363929, 27.090484],
['memiş kahya', 38.366941, 27.093102],
['kasaba', 38.369439, 27.096288],
    ['çakırtepe', '38.371979', '27.098841'],
           ];

       }
    </script>
     <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAC4VOtSmQRlCYlJVbMGJ961TZ6wSEw5e4&callback=initMap"></script>
    </div>
    </div>

</asp:Content>
