﻿<%@ Page Title="" Language="C#" MasterPageFile="~/PresentationLayer/IndustryProfessional/IndustryProfessionalMaster.Master" AutoEventWireup="true" CodeBehind="ViewProfileView.aspx.cs" Inherits="PerformanceAnalyzer2.PresentationLayer.IndustryProfessional.WebForm1" %>
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
        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px"  AutoGenerateRows="False" CssClass="table-condensed  table-striped  detailsView  gridview" width="400px" HeaderText="Profile" HorizontalAlign="Center" DataSourceID="SqlDataSource1">
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
            

        </asp:DetailsView>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT Member.userName, Member.email, Member.linkedin, Member.imageURL, IndustryProfessional.companyName, IndustryProfessional.description FROM Member INNER JOIN IndustryProfessional ON Member.userID = IndustryProfessional.userID  where Member.userID=@userID">
            <SelectParameters>
                <asp:SessionParameter Name="userID" SessionField="userID" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
    </p>
</asp:Content>
