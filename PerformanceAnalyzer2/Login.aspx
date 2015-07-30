<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PerformanceAnalyzer2.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
        <asp:Panel ID="Panel1" runat="server">
            <table style="width:40%; height: 121px;">
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="User Name"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                    
                </tr>
                 <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
                     </td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                     </td>
                    
                </tr>
                 <tr>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Sign In" />
                     </td>
                    <td>
                        <asp:Button ID="Button2" runat="server" Text="Login" />
                     </td>
                    
                </tr>
                 <tr>
                    <td>
                        <asp:CheckBox ID="CheckBox1" runat="server" Text="Remember Me" />
                     </td>
                    <td>&nbsp;</td>
                    
                </tr>
            </table>
        </asp:Panel>
        <br />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
