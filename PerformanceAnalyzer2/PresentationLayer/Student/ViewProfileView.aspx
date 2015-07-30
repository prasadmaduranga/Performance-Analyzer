﻿<%@ Page Title="" Language="C#" MasterPageFile="~/PresentationLayer/Student/StudentMaster.Master" AutoEventWireup="true" CodeBehind="ViewProfileView.aspx.cs" Inherits="PerformanceAnalyzer2.PresentationLayer.Student.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Menu ID="Menu1" runat="server">
        <Items>
            <asp:MenuItem Text="View Profile" NavigateUrl="~/PresentationLayer/Student/ViewProfileView.aspx"></asp:MenuItem>
        <asp:MenuItem Text="Edit Profile" NavigateUrl="~/PresentationLayer/Student/EditProfileView.aspx"></asp:MenuItem>
        </Items>
    </asp:Menu>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <p>
          <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" Height="50px" Width="125px" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
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
           <asp:BoundField DataField="indexNo" HeaderText="" />
                <asp:BoundField DataField="universityName" HeaderText="University" />
                <asp:BoundField DataField="facultyName" HeaderText="Faculty" />
                <asp:BoundField DataField="departmentName" HeaderText="Department" />
                <asp:BoundField DataField="Skills" HeaderText="Skills" />
                <asp:BoundField DataField="description" HeaderText="Description" />
            </Fields>
              <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
              <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
              <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
              <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        </asp:DetailsView>
        <br />

    </p>
</asp:Content>