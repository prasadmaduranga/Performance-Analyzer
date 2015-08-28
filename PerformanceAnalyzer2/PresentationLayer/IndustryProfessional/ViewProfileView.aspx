<%@ Page Title="" Language="C#" MasterPageFile="~/PresentationLayer/IndustryProfessional/IndustryProfessionalMaster.Master" AutoEventWireup="true" CodeBehind="ViewProfileView.aspx.cs" Inherits="PerformanceAnalyzer2.PresentationLayer.IndustryProfessional.WebForm1" %>
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
            <li ><a href="../../PresentationLayer/IndustryProfessional/ViewProfileView.aspx">View Profile</a></li>
            <li><a href="../../PresentationLayer/IndustryProfessional/EditProfileView.aspx">Edit Profile</a></li>
           
          </ul>
                 
        </div><!--/.nav-collapse -->
      </div>
    </div>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <p>
        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <Fields>
                
                <asp:TemplateField HeaderText="Profile Picture">
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("imageURL") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="userName" HeaderText="User name" />
                <asp:BoundField DataField="email" HeaderText="E-mail" />
                <asp:BoundField DataField="linkedin" HeaderText="Linkedin" />
            <asp:BoundField DataField="companyName" HeaderText="Company" />
                <asp:BoundField DataField="description" HeaderText="Description" />
            </Fields>
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            

        </asp:DetailsView>
        <br />
    </p>
    <p>
    </p>
</asp:Content>
