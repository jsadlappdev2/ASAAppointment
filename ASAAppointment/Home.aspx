<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="ASAAppointment.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            width: 589px;
        }
        .auto-style5 {
            width: 305px;
            height: 23px;
        }
        .auto-style6 {
            width: 589px;
            height: 23px;
            color: #003366;
        }
        .auto-style7 {
            height: 23px;
        }
        .auto-style10 {
            color: #003366;
            font-size: large;
        }
        .auto-style11 {
            width: 305px;
            height: 58px;
        }
        .auto-style12 {
            width: 589px;
            height: 58px;
        }
        .auto-style13 {
            height: 58px;
        }
        .GridStyle {
            text-align: left;
            font-size: small;
        }
        .auto-style14 {
            text-align: center;
            height: 23px;
        }
        .auto-style15 {
            width: 589px;
            height: 23px;
        }
        .body {width:100%;        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width:100%;">
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style2" colspan="2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style2" colspan="2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style2" colspan="2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style14"></td>
                <td class="auto-style15" colspan="2"></td>
                <td class="auto-style7"></td>
            </tr>
            <tr>
                <td class="auto-style11"></td>
                <td class="auto-style12" colspan="2">
                    <asp:Image ID="Image1" runat="server" Height="22px" ImageUrl="~/Image/anglicare-sa-logo.png" Width="172px" />
&nbsp;&nbsp; <span class="auto-style10"><strong><em>Get Details For Your Appointment<br />
                    </em></strong></span></td>
                <td class="auto-style13"></td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style2">
                    <asp:TextBox ID="SearchTxt" runat="server" BorderColor="#CCCCCC" BorderStyle="Solid" Height="35px" Width="573px" placeholder="Please input your Full Name + Birthday + PostCode. eg: John Smith + 01/01/1960 + 5065">John Smith + 01/01/1965 + 5065</asp:TextBox>
                &nbsp;</td>
                <td class="auto-style2">
                    <asp:Button ID="SearchBtn" runat="server" BorderColor="#CCCCCC" BorderStyle="Solid" Height="40px" style="font-weight: 700; color: #003366" Text="Search" Width="101px" BackColor="White" ForeColor="White" OnClick="SearchBtn_Click" />
                    </td>
                <td>&nbsp;&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style2" colspan="2">
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style2" colspan="2">
                    <asp:Label ID="RNLB" runat="server" style="color: #FF0000"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style2" colspan="2">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" CssClass="GridStyle" DataKeyNames="AppoId" ForeColor="#333333" GridLines="None" OnDataBound="GridView1_DataBound" Visible="False" Width="847px" PageSize="4">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                             <asp:TemplateField HeaderText="ID">
                                <ItemTemplate>
                                    <asp:Label ID="AppoId" runat="server"><%# Eval("AppoId") %></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="10px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Name">
                                <ItemTemplate>
                                    <asp:Label ID="Client_Name" runat="server"><%# Eval("Client_Name") %></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="20px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Date">
                                <ItemTemplate>
                                    <asp:Label ID="Appo_Date" runat="server"><%# Eval("Appo_Date") %></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="20px" />
                            </asp:TemplateField>

                              <asp:TemplateField HeaderText="Time">
                                <ItemTemplate>
                                    <asp:Label ID="Appo_Time" runat="server"><%# Eval("Appo_Time") %></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="20px" />
                            </asp:TemplateField>

                             <asp:TemplateField HeaderText="Address">
                                <ItemTemplate>
                                    <asp:Label ID="Appo_Address" runat="server"><%# Eval("Appo_Address") %></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="100px" />
                            </asp:TemplateField>


                              <asp:TemplateField HeaderText="Telephone">
                                <ItemTemplate>
                                    <asp:Label ID="Contract_Tel" runat="server"><%# Eval("Contract_Tel") %></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="20px" />
                            </asp:TemplateField>

                              <asp:HyperLinkField DataNavigateUrlFields="url" HeaderText="Transport" Target="_parent" Text="Transport" NavigateUrl="~/Home.aspx" >
                        <HeaderStyle Width="20px" />
                        <ItemStyle ForeColor="#003366" />
                        </asp:HyperLinkField>
                        
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#003366" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#003366" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#003366" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    </asp:GridView>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style6" colspan="2">
                    &nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style6" colspan="2">
                    &nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5"></td>
                <td class="auto-style6" colspan="2">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="https://anglicaresa.com.au/" style="color: #003366" Target="_blank">@AnglicareSA</asp:HyperLink>
                </td>
                <td class="auto-style7"></td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style2" colspan="2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style2" colspan="2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
