<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowAllAddresswithnolatandlong.aspx.cs" Inherits="ASAAppointment.ShowAllAddresswithnolatandlong" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 915px;
            height: 518px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyBXlSW2i5YRM96oxDgWDW6x8zMNit7JqSo"></script>
    <script type="text/javascript">
    var markers = [
    <asp:Repeater ID="rptMarkers" runat="server">
    <ItemTemplate>
             {
                "title": '<%# Eval("Name") %>',
                 "lat": '<%# Eval("latitude") %>',
                "lng": '<%# Eval("longitude") %>',
                "description": '<%# Eval("Address") %>'
            }
    </ItemTemplate>
    <SeparatorTemplate>
       ,
    </SeparatorTemplate>
    </asp:Repeater>
        ];
    </script>
    <script type="text/javascript">

        window.onload = function () {
            var mapOptions = {
                center: new google.maps.LatLng(markers[0].lat, markers[0].lng),
                zoom: 8,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            var infoWindow = new google.maps.InfoWindow();
            var map = new google.maps.Map(document.getElementById("dvMap"), mapOptions);
            for (i = 0; i < markers.length; i++) {
                var data = markers[i]
                var myLatlng = new google.maps.LatLng(data.lat, data.lng);
                var marker = new google.maps.Marker({
                    position: myLatlng,
                    map: map,
                    title: data.title
                });
                (function (marker, data) {
                    google.maps.event.addListener(marker, "click", function (e) {
                        infoWindow.setContent(data.title+", "+data.description);
                        infoWindow.open(map, marker);
                    });
                })(marker, data);
            }
        }

        var geocoder;
        var map;


        function initialize() {
            geocoder = new google.maps.Geocoder();
            var latlng = new google.maps.LatLng(-34.397, 150.644);
            var myOptions = {
                zoom: 8,
                center: latlng,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            }
            map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
        }





        google.maps.event.addDomListener(window, 'load', initialize);
    </script>
    <div id="dvMap" class="auto-style1">   </div>
    </form>
</body>
</html>