<%@ Page Title="" Language="C#" MasterPageFile="~/PresentationLayer/Student/StudentMaster.Master" AutoEventWireup="true" CodeBehind="ViewProfileView.aspx.cs" Inherits="PerformanceAnalyzer2.PresentationLayer.Student.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   


    <div class="sidebar-nav" id="sidebar">
                <div class="navbar navbar-default" role="navigation">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <span class="visible-xs navbar-brand"></span>
                    </div>
                    <div class="navbar-collapse collapse sidebar-navbar-collapse">

                        <ul class="nav navbar-nav">
                            <li><a href="../../PresentationLayer/Student/ViewProfileView.aspx">View Profile</a></li>
                            <li><a href="../../PresentationLayer/Student/EditProfileView.aspx">Edit Profile</a></li>

                        </ul>

                    </div>
                    <!--/.nav-collapse -->
                </div>
            </div>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <p>
          <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False"  Height="50px" Width="125px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" GridLines="Horizontal" CssClass="table-condensed  table-striped  detailsView gridview" ForeColor="#0179ac" HeaderText="Profile" HorizontalAlign="Center">
              <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <Fields>
                 <asp:TemplateField HeaderText="Profile Picture">
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("imageURL") %>' Height="100px" Width="100px" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="userName" HeaderText="User name" />
                <asp:BoundField DataField="email" HeaderText="E-mail" />
                <asp:BoundField DataField="linkedin" HeaderText="Linkedin" />
           <asp:BoundField DataField="indexNo" HeaderText="Index No" />
                <asp:BoundField DataField="universityName" HeaderText="University" />
                <asp:BoundField DataField="facultyName" HeaderText="Faculty" />
                <asp:BoundField DataField="departmentName" HeaderText="Department" />
                <asp:BoundField DataField="Skills" HeaderText="Skills" />
                <asp:BoundField DataField="description" HeaderText="Description" />
            </Fields>
              <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
              <HeaderStyle  Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        </asp:DetailsView>
        <br />

    </p>
</asp:Content>
