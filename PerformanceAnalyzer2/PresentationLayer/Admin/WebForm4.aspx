<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm4.aspx.cs" Inherits="PerformanceAnalyzer2.PresentationLayer.Admin.WebForm4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateEditButton="True" AutoGenerateInsertButton="True" AutoGenerateRows="False" DefaultMode="Insert" Height="50px" OnItemInserting="DetailsView1_ItemInserting" Width="125px">
            <Fields>
                <asp:TemplateField HeaderText="University">
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="universityID">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT * FROM [University]"></asp:SqlDataSource>
                    </ItemTemplate>
                </asp:TemplateField>
            </Fields>
        </asp:DetailsView>
        <br />
        <asp:Image ID="Image1" runat="server" Height="150px" ImageUrl="~/Images/prasad.jpg" Width="150px" />
        <br />
        <br />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
