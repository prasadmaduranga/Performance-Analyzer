<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="PerformanceAnalyzer2.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 251px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SIGN IN<br />
            <br />
            <table style="width:100%;">
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="Label1" runat="server" Text="Select Your Role"></asp:Label>
                    </td>
                    <td>
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                            <asp:ListItem Value="0">Course Administrator</asp:ListItem>
                            <asp:ListItem Value="1">Lecturer</asp:ListItem>
                            <asp:ListItem Selected="True" Value="2">Industry Personal</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                   
                </tr>
                <tr>
                    <td colspan="2">
                         <table style="width:100%;">
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label2" 
runat="server" Text="User Name"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBox1" 
runat="server"></asp:TextBox>
                                        </td>
                                      
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label3" 
runat="server" Text="E mail"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBox2" 
runat="server"></asp:TextBox>
                                        </td>
                                       
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label4" 
runat="server" Text="Linkedin Profile"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBox3" 
runat="server"></asp:TextBox>
                                        </td>
                                     
                                    </tr>
                                     <tr>
                                        <td>
                                            <asp:Label ID="Label5" 
runat="server" Text="Upload Profile Picture"></asp:Label>
                                         </td>
                                        <td>
                                            <asp:FileUpload ID="FileUpload1" 
runat="server" />
                                            <asp:Button ID="Button3" 
runat="server" Text="Upload" />
                                         </td>
                                      
                                    </tr>
                                      <tr>
                                        <td>
                                           
                                            Description</td>
                                        <td>
                                            <asp:TextBox ID="TextBox4" 

runat="server" Rows="4" TextMode="MultiLine"></asp:TextBox>
                                          </td>
                                      
                                    </tr>
                                    <tr>
                                        <td>
                                           
                                            Date of Birth</td>
                                        <td>
                                            <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
                                                <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                                                <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                                                <OtherMonthDayStyle ForeColor="#999999" />
                                                <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                                <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                                                <TodayDayStyle BackColor="#CCCCCC" />
                                            </asp:Calendar>
                                        </td>
                                      
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label6" 
runat="server" Text="Password"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBox5" 
runat="server" TextMode="Password"></asp:TextBox>
                                        </td>
                                       
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label7" 
runat="server" Text="Re-enter Password"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBox6" 
runat="server" TextMode="Password"></asp:TextBox>
                                        </td>
                                     
                                    </tr>
                                    <tr>
                                        <td>
                                           
                                            <asp:Button ID="Button1" 
runat="server" Text="Cancel" />
                                           
                                         </td>
                                        <td>
                                            <asp:Button ID="Button2" 
runat="server" Text="Submit" />
                                        </td>
                                      
                                    </tr>
                                </table>
                 
                    </td>
                    
                   
                </tr>
               
            </table>
            <br />
            <br />
    
        <br />
    
    </div>
    </form>
</body>
</html>
