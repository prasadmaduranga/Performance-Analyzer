﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PerformanceAnalyzer2.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body runat="server">
    <form runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate >
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="View1" runat="server">
                  
                        <div>

                            <br />
                            <asp:Panel ID="Panel1" runat="server">
                                <table style="width: 40%; height: 121px;">
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
                                            <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Button ID="Button1" runat="server" Text="Sign In" OnClick="Button1_Click" />
                                        </td>
                                        <td>
                                            <asp:Button ID="Button2" runat="server" Text="Login" OnClick="Button2_Click" />
                                        </td>

                                    </tr>
                           <%--         <tr>
                                        <td>
                                            <asp:CheckBox ID="CheckBox1" runat="server" Text="Remember Me" />
                                        </td>
                                        <td>&nbsp;</td>

                                    </tr>--%>
                                </table>
                            </asp:Panel>
                            <br />
                            <br />
                            <br />

                        </div>
              
                </asp:View>
                <asp:View ID="View2" runat="server">
                   
                        <div>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SIGN IN<br />
                            <br />
                            <table style="width: 100%;">
                                <tr>
                                    <td class="auto-style1">
                                        <asp:Label ID="Label3" runat="server" Text="Select Your Role"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" >
                                            <asp:ListItem Value="0">Course Administrator</asp:ListItem>
                                            <asp:ListItem Value="1">Lecturer</asp:ListItem>
                                            <asp:ListItem Selected="True" Value="2">Industry Personal</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>

                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <table style="width: 100%;">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label4"
                                                        runat="server" Text="User Name"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="TextBox3"
                                                        runat="server"></asp:TextBox>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label5"
                                                        runat="server" Text="E mail"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="TextBox4"
                                                        runat="server"></asp:TextBox>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label6"
                                                        runat="server" Text="Linkedin Profile"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="TextBox5"
                                                        runat="server"></asp:TextBox>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label7"
                                                        runat="server" Text="Upload Profile Picture"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:FileUpload ID="FileUpload1"
                                                        runat="server" />
                                                    <asp:Button ID="Button3"
                                                        runat="server" Text="Upload" OnClick="Button3_Click" />
                                                </td>

                                            </tr>
                                           
                                           
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label8"
                                                        runat="server" Text="Password"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="TextBox7"
                                                        runat="server" TextMode="Password"></asp:TextBox>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label9"
                                                        runat="server" Text="Re-enter Password"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="TextBox8"
                                                        runat="server" TextMode="Password"></asp:TextBox>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td>

                                                    <asp:Button ID="Button4"
                                                        runat="server" Text="Cancel" />

                                                </td>
                                                <td>
                                                    <asp:Button ID="Button5"
                                                        runat="server" Text="Submit" OnClick="Button5_Click" />
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
                   

                </asp:View>

            </asp:MultiView>
        </ContentTemplate>
    </asp:UpdatePanel></form>
</body>
</html>
