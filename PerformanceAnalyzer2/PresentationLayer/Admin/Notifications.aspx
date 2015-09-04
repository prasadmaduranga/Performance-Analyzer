<%@ Page Title="" Language="C#" MasterPageFile="~/PresentationLayer/Admin/CourseAminMaster.Master" AutoEventWireup="true" CodeBehind="Notifications.aspx.cs" Inherits="PerformanceAnalyzer2.PresentationLayer.Admin.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="senderID,courseID" OnRowCommand="GridView1_RowCommand" DataSourceID="SqlDataSource1" CssClass="table table-striped table-hover  table-condensed  gridViewCustom" GridLines="Horizontal" HorizontalAlign="Center">
            <Columns>
                <asp:BoundField DataField="senderName" HeaderText="Sender" />
                <asp:BoundField DataField="courseName" HeaderText="Course" />

                <asp:BoundField DataField="message" HeaderText="Message" />
                <asp:BoundField DataField="date" HeaderText="Date" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <table style="width:100%;">
                            <tr>
                                <td style="padding-left:5px;padding-right:5px;">
                                    <asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click">Accept</asp:LinkButton>
                                </td>
                                <td style="padding-left:5px;padding-right:5px;">
                                    <asp:LinkButton ID="LinkButton5" runat="server">Delete</asp:LinkButton>
                                </td>
                                <td style="padding-left:5px;padding-right:5px;">
                                    <asp:LinkButton ID="LinkButton6" runat="server">More...</asp:LinkButton>
                                </td>
                            </tr>
                           
                        </table>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="spGetNotification" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="userID" SessionField="userID" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <div>
        <asp:DetailsView ID="DetailsView1" runat="server"  AutoGenerateRows="False" CssClass="table-condensed  table-striped  detailsView" width="400px" HeaderText="Profile" DataSourceID="SqlDataSource2" GridLines="Horizontal" HorizontalAlign="Center">
            <Fields>
                
                <asp:TemplateField HeaderText="Profile Picture">
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("imageURL") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="userName" HeaderText="User name" />
                <asp:BoundField DataField="email" HeaderText="E-mail" />
                <asp:BoundField DataField="linkedin" HeaderText="Linkedin" />
            <asp:BoundField DataField="userType" HeaderText="User Type" />
            </Fields>
            

        </asp:DetailsView>
        <br />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT [userName], [email], [userType], [linkedin], [imageURL], [userID] FROM [Member] WHERE ([userID] = @userID)">
            <SelectParameters>
                <asp:Parameter Name="userID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>

        </ContentTemplate>
        </asp:UpdatePanel>
</asp:Content>
