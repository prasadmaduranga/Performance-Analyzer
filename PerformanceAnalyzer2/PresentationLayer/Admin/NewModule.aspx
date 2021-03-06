﻿<%@ Page Title="" Language="C#" MasterPageFile="~/PresentationLayer/Admin/CourseAminMaster.Master" AutoEventWireup="true" CodeBehind="NewModule.aspx.cs" Inherits="PerformanceAnalyzer2.PresentationLayer.Admin.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div>
        <asp:DetailsView ID="DetailsView1" runat="server" DefaultMode="Insert"  AutoGenerateRows="False" OnItemInserted="DetailsView1_ItemInserted" OnItemInserting="DetailsView1_ItemInserting" HeaderText="Add New Module" OnPreRender="DetailsView1_PreRender" CssClass="table-condensed  table-striped  detailsView gridview" HorizontalAlign="Center" Height="233px" GridLines="Horizontal" >
            <Fields>
                <asp:TemplateField HeaderText="Module Code">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("moduleCode") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("moduleCode") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="*Required" ForeColor="Red" Display="Dynamic" ValidationGroup="g7"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("moduleCode") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="*Required" ForeColor="Red" Display="Dynamic" ValidationGroup="g7"></asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="GPA">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="RadioButtonList3" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Selected="True" Value="1">GPA</asp:ListItem>
                            <asp:ListItem Value="2">NGPA</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:RadioButtonList  ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                           
                            <asp:ListItem Selected="True" Value="1">GPA</asp:ListItem>
                            <asp:ListItem Value="2">NGPA</asp:ListItem>
                        </asp:RadioButtonList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Credits">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("credits") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("credits") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="*Required" ForeColor="Red" Display="Dynamic" ValidationGroup="g7"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox3" ValidationExpression="^(?:\d{1,2})?(?:\.\d{1,2})?$" ErrorMessage="*Invaid" ForeColor="Red" Display="Dynamic" ValidationGroup="g7"></asp:RegularExpressionValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("credits") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Compulsary/Elective">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="RadioButtonList4" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Selected="True" Value="1">Compulsary</asp:ListItem>
                            <asp:ListItem Value="2">Elective</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Selected="True" Value="1">Compulsary</asp:ListItem>
                            <asp:ListItem Value="2">Elective</asp:ListItem>
                        </asp:RadioButtonList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowInsertButton="False" />
            </Fields>
            <FooterTemplate>
                <asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click" ValidationGroup="g7">Insert</asp:LinkButton>
            </FooterTemplate>
        </asp:DetailsView>
       <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" DeleteCommand="DELETE FROM [Module] WHERE [moduleCode] = @moduleCode" InsertCommand="INSERT INTO [Module] ([moduleCode], [name], [GPA], [credits], [compulary]) VALUES (@moduleCode, @name, @GPA, @credits, @compulary)" SelectCommand="SELECT * FROM [Module]" UpdateCommand="UPDATE [Module] SET [name] = @name, [GPA] = @GPA, [credits] = @credits, [compulary] = @compulary WHERE [moduleCode] = @moduleCode">
           <DeleteParameters>
               <asp:Parameter Name="moduleCode" Type="String" />
           </DeleteParameters>
           <InsertParameters>
               <asp:Parameter Name="moduleCode" Type="String" />
               <asp:Parameter Name="name" Type="String" />
               <asp:Parameter Name="GPA" Type="String" />
               <asp:Parameter Name="credits" Type="Double" />
               <asp:Parameter Name="compulary" Type="String" />
           </InsertParameters>
           <UpdateParameters>
               <asp:Parameter Name="name" Type="String" />
               <asp:Parameter Name="GPA" Type="String" />
               <asp:Parameter Name="credits" Type="Double" />
               <asp:Parameter Name="compulary" Type="String" />
               <asp:Parameter Name="moduleCode" Type="String" />
           </UpdateParameters>
        </asp:SqlDataSource>

        </div>
</asp:Content>
