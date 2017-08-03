<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Transport.aspx.cs" Inherits="ASAAppointment.Transport" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Transport</title>
    <style type="text/css">
        body
        {
            font-family: Arial;
            font-size: 10pt;
            width:100%;
        }
        .auto-style1 {
            width: 227px;
        }
        .auto-style4 {
            width: 327px;
            height: 27px;
            color: #003366;
         
        }
        .auto-style5 {
             width: 327px;
            height: 27px;
            color: #003366;
            border: 0px solid #CCC;

        }
        .auto-style6 {
            color: #FF0000;
        }
        .auto-style7 {
            font-size: medium;
        }
        .auto-style9 {
            width: 12px;
        }
        .auto-style10 {
            color: #003366;
            height: 25px;
        }
        .auto-style11 {
            height: 25px;
        }
        .auto-style12 {
            width: 12px;
            height: 25px;
        }
        .auto-style14 {
            width: 12px;
            height: 26px;
        }
        .auto-style15 {
            height: 24px;
        }
        .auto-style16 {
            width: 12px;
            height: 24px;
        }
        .auto-style17 {
            color: #003366;
            height: 24px;
        }
        .auto-style20 {
            height: 27px;
        }
        .auto-style21 {
            width: 327px;
            height: 27px;
        }
        .auto-style22 {
            color: #003366;
            border: 0px solid #CCC;
            height: 19px;
        }
        .auto-style23 {
            height: 19px;
        }
        .auto-style24 {
            width: 12px;
            height: 19px;
        }
        .auto-style25 {
            width: 1000px;
        }
        .auto-style26 {
            height: 26px;
        }
        .auto-style27 {
            height: 24px;
            width: 36px;
        }
        .auto-style28 {
            height: 27px;
            width: 36px;
        }
    </style>
</head>
 
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyBXlSW2i5YRM96oxDgWDW6x8zMNit7JqSo&libraries=places&language=eng"></script>
    <script type="text/javascript">
     

        var source, destination;
        var directionsDisplay;
        var directionsService = new google.maps.DirectionsService();
        google.maps.event.addDomListener(window, 'load', function () {
            new google.maps.places.SearchBox(document.getElementById('txtSource'));
            //new google.maps.places.SearchBox(document.getElementById('<%=AFAdress.ClientID%>').innerHTML);
            new google.maps.places.SearchBox(document.getElementById('txtDestination'));
            //new google.maps.places.SearchBox(document.getElementById('<%=AAdress.ClientID%>').innerHTML);
            directionsDisplay = new google.maps.DirectionsRenderer({ 'draggable': true });
        });

        function GetRoute() {
            var mumbai = new google.maps.LatLng(18.9750, 72.8258);
            var mapOptions = {
                zoom: 4,
                // center: mumbai
                center : {lat: -34.9, lng:138.6 }
            };
            map = new google.maps.Map(document.getElementById('dvMap'), mapOptions);
            directionsDisplay.setMap(map);
            directionsDisplay.setPanel(document.getElementById('dvPanel'));

            //*********DIRECTIONS AND ROUTE**********************//
            source = document.getElementById("txtSource").value;
            //source = document.getElementById('<%=AFAdress.ClientID%>').innerHTML);
            var selectedMode = document.getElementById('mode').value;
            destination = document.getElementById("txtDestination").value;
           // destination = document.getElementById('<%=ATime.ClientID%>').Value);

            if (selectedMode == "TRANSIT")
            {
                var arrive = document.getElementById('<%=ATime.ClientID%>').innerHTML;
                var bits = arrive.split(':');
                var now = new Date();
                var tzOffset = now.getTimezoneOffset();

                var time = new Date();
                time.setHours(bits[0]);
                time.setMinutes(bits[1]);

                var ms = time.getTime() - tzOffset;
                if (ms < now.getTime()) {
                    ms += 24 * 60 * 60 * 1000;
                }

                var arriveTime = new Date(ms);


                var request = {
                    origin: source,
                    destination: destination,
                    // travelMode: google.maps.TravelMode.TRANSIT
                    travelMode: google.maps.TravelMode[selectedMode],
                    transitOptions: {
                        // departureTime: departureTime
                        arrivalTime: arriveTime
                    }


                };

            }
            else
            {

                var request = {
                    origin: source,
                    destination: destination,
                    // travelMode: google.maps.TravelMode.TRANSIT
                    travelMode: google.maps.TravelMode[selectedMode]

                };
            }
            directionsService.route(request, function (response, status) {
                if (status == google.maps.DirectionsStatus.OK) {
                    directionsDisplay.setDirections(response);
                }
            });

            //*********DISTANCE AND DURATION**********************//
            var service = new google.maps.DistanceMatrixService();
            var selectedMode = document.getElementById('mode').value;
            service.getDistanceMatrix({
                origins: [source],
                destinations: [destination],
               // travelMode: google.maps.TravelMode.TRANSIT,
                travelMode: google.maps.TravelMode[selectedMode],
                unitSystem: google.maps.UnitSystem.METRIC,
                avoidHighways: false,
                avoidTolls: false
            }, function (response, status) {
                if (status == google.maps.DistanceMatrixStatus.OK && response.rows[0].elements[0].status != "ZERO_RESULTS") {
                    var distance = response.rows[0].elements[0].distance.text;
                    var duration = response.rows[0].elements[0].duration.text;
                    var dvDistance = document.getElementById("dvDistance");
                  
                    dvDistance.innerHTML = "";
                   // dvDistance.innerHTML += "Distance:  " + distance + "<br />";
                   // dvDistance.innerHTML += "Duration:  " + duration;

                } else {
                    alert("Unable to find the distance via road.");
                }
            });
        }

       
    </script>
<body onload="GetRoute()">
    <form id="form1" runat="server" class="auto-style25">
  
    <table border="0" cellpadding="0" cellspacing="3">
        <tr>
            <td colspan="2" class="auto-style22">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Home.aspx">Home</asp:HyperLink>
            &nbsp;&nbsp;&nbsp; <span class="auto-style5">
                <em>&nbsp;</em><asp:ImageButton ID="ImageButton1" runat="server" Height="20px" ImageUrl="~/Image/printer.JPG" OnClientClick="javascript:window.print()" Width="39px" ToolTip="Print this page" />
&nbsp; </span>
                <asp:ImageButton ID="ImageButton2" runat="server" Height="36px" ImageUrl="~/Image/pdf.JPG" Width="49px" ToolTip="Save as PDF file" />
&nbsp;<asp:ImageButton ID="ImageButton3" runat="server" Height="33px" ImageUrl="~/Image/email.JPG" Width="47px" ToolTip="Email to myself" />
            </td>
            <td class="auto-style23">
                </td>
            <td class="auto-style23">
                </td>
            <td class="auto-style24">
                </td>
        </tr>
        <tr>
            <td colspan="2" class="auto-style5">
                <strong>Dear <asp:Label ID="Aname" runat="server" CssClass="auto-style7"></asp:Label>
                , Your appointment detail as below:</strong></td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td class="auto-style9">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style17">
                <span class="auto-style6">**Appointment Date:&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="ADate" runat="server"></asp:Label>
            </td>
            <td class="auto-style27">
                </td>
            <td class="auto-style15">
                </td>
            <td class="auto-style15">
                </td>
            <td class="auto-style16">
                </td>
        </tr>
        <tr>
            <td class="auto-style15">
                <span class="auto-style6">**Appointment Time</span>:&nbsp; <span class="auto-style5">&nbsp;&nbsp; </span>
                <asp:Label ID="ATime" runat="server" CssClass="auto-style5"></asp:Label>
            </td>
            <td class="auto-style27">
                </td>
            <td class="auto-style15">
                </td>
            <td class="auto-style15">
                </td>
            <td class="auto-style16">
                </td>
        </tr>
        <tr>
            <td class="auto-style26">
                <span class="auto-style6">**Appointment Address</span><span class="auto-style5">:
                </span>
                <input type="text" id="txtDestination" value="<%=AAdress.Text%>" style="width: 326px; height: 19px;" class="auto-style5" /></td>
            <td colspan="2" class="auto-style26">
                <asp:Label ID="AAdress" runat="server" Visible="False"></asp:Label>
            </td>
            <td class="auto-style26">
                </td>
            <td class="auto-style14">
                </td>
        </tr>
        <tr>
            <td class="auto-style10">
                <span class="auto-style6">**Contact Phone:</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="ATel" runat="server"></asp:Label>
            </td>
            <td colspan="2" class="auto-style11">
                <asp:Label ID="AFAdress" runat="server" Visible="False"></asp:Label>
            </td>
            <td class="auto-style11">
                </td>
            <td class="auto-style12">
                </td>
        </tr>
        <tr>
            <td class="auto-style20">
                <span class="auto-style6">**Your Address:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; </span><input type="text" id="txtSource" value="<%=AFAdress.Text %>"" class="auto-style4" />&nbsp; </td>
            <td class="auto-style28">
                &nbsp;&nbsp;
               
                <strong><span class="auto-style5">
                &nbsp;</span></strong></td>
            <td class="auto-style20">
                &nbsp;</td>
            <td class="auto-style20">
                </td>
            <td class="auto-style21">
                </td>
        </tr>
        <tr>
            <td colspan="5">
                <span class="auto-style6">**Transport Option:</span><strong><span class="auto-style5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <select id="mode" name="D1"  class="auto-style21" onchange="GetRoute()" ">
                    <option value="TRANSIT" class="auto-style8">Public Transport</option>
                    <option value="DRIVING">Driving</option>
                    <option value="WALKING">Walking</option>
                    <option value="BICYCLING">Bicycling</option>
             
                </select>&nbsp;&nbsp;
                <br />
                </span></strong><hr />
            </td>
        </tr>
        <tr>
            <td colspan="5">
                <div id="dvDistance">
                </div>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                <div id="dvMap" style="width: 500px; height: 500px">
                </div>
            </td>
            <td colspan="4">
                <div id="dvPanel" style="width: 500px; height: 500px">
                </div>
            </td>
        </tr>
    </table>
    <br />
    </form>
</body>
</html>