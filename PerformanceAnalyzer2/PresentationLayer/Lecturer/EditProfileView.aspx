<%@ Page Title="" Language="C#" MasterPageFile="~/PresentationLayer/Lecturer/LecturerMaster.Master" AutoEventWireup="true" CodeBehind="EditProfileView.aspx.cs" Inherits="PerformanceAnalyzer2.PresentationLayer.Lecturer.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <asp:Menu ID="Menu1" runat="server">
        <Items>
            <asp:MenuItem Text="View Profile" NavigateUrl="~/PresentationLayer/Lecturer/ViewProfileView.aspx"></asp:MenuItem>
        <asp:MenuItem Text="Edit Profile" NavigateUrl="~/PresentationLayer/Lecturer/EditProfileView.aspx"></asp:MenuItem>
        </Items>
    </asp:Menu>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
