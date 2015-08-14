<%@ Page Title="" Language="C#" MasterPageFile="~/PresentationLayer/Student/StudentMaster.Master" AutoEventWireup="true" CodeBehind="Compare.aspx.cs" Inherits="PerformanceAnalyzer2.PresentationLayer.Student.WebForm4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Panel ID="Panel1" runat="server">
                <asp:Panel ID="Panel2" runat="server" GroupingText="Comparison Group">

                    <table style="width: 100%;">
                        <tr>
                            <td>
                                <asp:RadioButton  ID="RadioButton1" runat="server" GroupName="groupType" Text="Batch Vs. Me" Checked="True" /></td>

                        </tr>
                        <tr>
                            <td>
                                <asp:RadioButton ID="RadioButton2" runat="server" GroupName="groupType" Text="Individual Vs. Me" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:RadioButton ID="RadioButton3" runat="server" GroupName="groupType" Text="Other" />
                            </td>

                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="Panel3" runat="server" GroupingText="Comparison Type">
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                <asp:RadioButton ID="RadioButton4" runat="server" GroupName="groupType" Text="Module Level" Checked="True" /></td>

                        </tr>
                        <tr>
                            <td>
                                <asp:RadioButton ID="RadioButton5" runat="server" GroupName="groupType" Text="Semester Level" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:RadioButton ID="RadioButton6" runat="server" GroupName="groupType" Text="Overrall" />
                            </td>

                        </tr>
                    </table>
                </asp:Panel>
                <asp:Button ID="Button1" runat="server" Text="Go" />
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:UpdatePanel ID="UpdatePanel3" runat="server">

    </asp:UpdatePanel>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server"></asp:UpdatePanel>
</asp:Content>
