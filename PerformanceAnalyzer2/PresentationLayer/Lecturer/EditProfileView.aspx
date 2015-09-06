<%@ Page Title="" Language="C#" MasterPageFile="~/PresentationLayer/Lecturer/LecturerMaster.Master" AutoEventWireup="true" CodeBehind="EditProfileView.aspx.cs" Inherits="PerformanceAnalyzer2.PresentationLayer.Lecturer.WebForm2" %>

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
                    <li><a href="../../PresentationLayer/Lecturer/ViewProfileView.aspx">View Profile</a></li>
                    <li><a href="../../PresentationLayer/Lecturer/EditProfileView.aspx">Edit Profile</a></li>

                </ul>

            </div>
            <!--/.nav-collapse -->
        </div>
    </div>




</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="spGetLecturerBasicDetails" SelectCommandType="StoredProcedure" UpdateCommand="spUpdateLecturerData" UpdateCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="userID" SessionField="userID" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="userID" />
                    <asp:Parameter Name="userName" />
                    <asp:Parameter Name="email" />
                    <asp:Parameter Name="linkedin" />
                    <asp:Parameter Name="description" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DefaultMode="Edit" Height="50px" Width="249px" OnItemUpdated="DetailsView1_ItemUpdated" OnItemUpdating="DetailsView1_ItemUpdating" DataKeyNames="userID" DataSourceID="SqlDataSource1" CssClass="gridview table-condensed  table-striped  detailsView" HeaderText="Edit Prifile" GridLines="Horizontal" HorizontalAlign="Center">
                <Fields>
                    <asp:BoundField DataField="userID" ReadOnly="true" HeaderText="User ID" />
                    <asp:TemplateField HeaderText="User name">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("userName") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="*Required" ForeColor="Red" Display="Dynamic" ValidationGroup="g3"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("userName") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("userName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="E-mail">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="*Required" ForeColor="Red" ValidationGroup="g3"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="*Invalid Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red" ValidationGroup="g3"></asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Linkedin">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("linkedin") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="*Required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("linkedin") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("linkedin") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Description">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Eval("description") %>' TextMode="MultiLine"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Fields>
                <FooterTemplate>
                    <asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click" ValidationGroup="g3">Update</asp:LinkButton>
                </FooterTemplate>
            </asp:DetailsView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
