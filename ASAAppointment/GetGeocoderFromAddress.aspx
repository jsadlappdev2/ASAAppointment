<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GetGeocoderFromAddress.aspx.cs" Inherits="ASAAppointment.GetGeocoderFromAddress" %>

<!DOCTYPE html>
<html>
    <head>
    <title>Place Autocomplete With Latitude & Longitude </title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <style>
#pac-input {
    background-color: #fff;
    padding: 0 11px 0 13px;
    width: 400px;
    font-family: Roboto;
    font-size: 15px;
    font-weight: 300;
    text-overflow: ellipsis;
}
#pac-input:focus {
    border-color: #4d90fe;
    margin-left: -1px;
    padding-left: 14px;  /* Regular padding-left + 1. */
    width: 401px;
}
}
</style>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBXlSW2i5YRM96oxDgWDW6x8zMNit7JqSo&libraries=places"></script>
    <script>


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


  function codeAddress() {
      var address = document.getElementById("pac-input").value;

      geocoder.geocode({ 'address': address }, function (results, status) {
          if (status == google.maps.GeocoderStatus.OK) {

              document.getElementById('lat').innerHTML = results[0].geometry.location.lat();
              document.getElementById('long').innerHTML = results[0].geometry.location.lng();

          } else {
              alert("Geocode was not successful for the following reason: " + status);
          }
      });

  }


  function codeAddress_lat(newaddress) {
      var address = newaddress.value;

      geocoder.geocode({ 'address': address }, function (results, status) {
          if (status == google.maps.GeocoderStatus.OK) {

             // document.getElementById('lat').innerHTML = results[0].geometry.location.lat();
              // document.getElementById('long').innerHTML = results[0].geometry.location.lng();
              return results[0].geometry.location.lat();

          } else {
              alert("Geocode was not successful for the following reason: " + status);
          }
      });

  }


  function codeAddress_long(newaddress) {
      var address = newaddress.value;

      geocoder.geocode({ 'address': address }, function (results, status) {
          if (status == google.maps.GeocoderStatus.OK) {

              // document.getElementById('lat').innerHTML = results[0].geometry.location.lat();
              // document.getElementById('long').innerHTML = results[0].geometry.location.lng();
              return results[0].geometry.location.lng();

          } else {
              alert("Geocode was not successful for the following reason: " + status);
          }
      });

  }

  google.maps.event.addDomListener(window, 'load', initialize);


  function GetData() {
      var connection = new ActiveXObject("ADODB.Connection");

      var connectionstring = "Provider=SQLOLEDB;Data Source=DEVSQL-1\\WHOUSE;database=ASADWH;uid=asadwh;Password=asadwh201601";

      connection.Open(connectionstring);
      var rs = new ActiveXObject("ADODB.Recordset");

      rs.Open("SELECT * FROM GovHack_EmergencyService", connection);
      rs.MoveFirst
      while (!rs.eof) {
          // document.write(rs.fields(1));
          
         // document.write(rs.fields(0) + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
          //document.write(setTimeout(codeAddress_lat(rs.fields(7)), 6000) + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
         // document.write(setTimeout(codeAddress_long(rs.fields(7)), 6000) + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
         // document.write(rs.fields(7) + "<br/>");
          codeAddress();
          setTimeout(codeAddress(), 2000);

          rs.movenext;
      }

      rs.close;
      connection.close;
  }


    </script>
    </head>
    <body>
        <form id="form1" runat="server">
      
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
      
            <input id="pac-input" value="33 Devereux Road, Linden Park, SA 5065" class="controls" type="text"
        placeholder="Enter a location">&nbsp;
         <div id="lat"></div>
<div id="long"></div>

<div > <input type="button" value="Encode" onclick="codeAddress()" /></div>
            <div > <input type="button" value="GetData" onclick="GetData()" /></div>
<div id="ESName">
    <br />
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" Height="19px" OnDataBound="DropDownList1_DataBound" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="335px">
    </asp:DropDownList>
            </div>
        </form>
</body>
</html>