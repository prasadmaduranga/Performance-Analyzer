<%@ Page Title="" Language="C#" MasterPageFile="~/PresentationLayer/Admin/CourseAminMaster.Master" AutoEventWireup="true" CodeBehind="NewResult.aspx.cs" Inherits="PerformanceAnalyzer2.PresentationLayer.Admin.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
        <ContentTemplate>
            <table style="width: 100%;">
                <tr>
                    <td>    
                        <asp:Label ID="Label1" runat="server" Text="Course"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="courseID" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
                            <asp:ListItem Text="--Select Course--" Value="-1"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="select name ,courseID from Course where adminID=@adminID">
                            <SelectParameters>
                                <asp:SessionParameter Name="adminID" SessionField="userID" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                    </td>
                 
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Module"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList2" runat="server"  DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="moduleCode" style="margin-top: 1px" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                           
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="select Module.name as name,Module.moduleCode as moduleCode from Course join AcedemicYear on Course.courseID=AcedemicYear.courseID  join
Semester on AcedemicYear.yearID=Semester.yearID join Semester_Module on Semester_Module.semesterID=Semester.semesterID
join Module on Module.moduleCode=Semester_Module.moduleCode
where Course.courseID=@courseID">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList1" Name="courseID" PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                  
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Result Input Method"></asp:Label>
                    </td>
                    <td>
                        <asp:RadioButton ID="RadioButton1" runat="server" Checked="True" GroupName="selectionGroup" Text="Manually" OnCheckedChanged="RadioButton1_CheckedChanged" AutoPostBack="True" />
                        <asp:RadioButton ID="RadioButton2" runat="server" GroupName="selectionGroup" Text="Using Image" OnCheckedChanged="RadioButton1_CheckedChanged" AutoPostBack="True" />
                    </td>
                 
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="Upload Image"></asp:Label>
                    </td>
                    <td>
                        <table>
                            <tr>
                                <td>
                                    <asp:FileUpload ID="FileUpload1" runat="server" /> </td>
                                 <td>
                                     <asp:Button ID="Button1" runat="server" Text="Upload" /></td>
                            </tr>
                        </table>

                    </td>
                  
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Button ID="Button2" runat="server" Text="Go" OnClick="Button2_Click" />
                    </td>
                  
                </tr>
            </table>

        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <asp:GridView   ID="GridView1" runat="server" DataKeyNames="userID" AllowPaging="True"  AutoGenerateColumns="False" AutoGenerateEditButton="True" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowUpdated="GridView1_RowUpdated">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                   <%-- <asp:TemplateField HeaderText="userID"  SortExpression="userID" Visible="False">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("userID") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("userID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                    <asp:BoundField DataField="userID" HeaderText="userID" ReadOnly="True"  InsertVisible="false"/>
                    <asp:BoundField DataField="indexNo" HeaderText="Index No." ReadOnly="True" />
                    <%--<asp:TemplateField HeaderText="indexNo" SortExpression="indexNo">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("indexNo") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("indexNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                    <asp:TemplateField HeaderText="Result" SortExpression="result">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList3"  runat="server"  DataSourceID="SqlDataSource4" DataTextField="result"  AppendDataBoundItems="true" DataValueField="result" OnDataBinding="DropDownList3_DataBinding">
                            <asp:ListItem  Text="--Result--" Value="-1"></asp:ListItem>
                            

                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT [result], [GPA] FROM [ResultMapping]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("result") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <br />
            <br />

        </ContentTemplate>
    </asp:UpdatePanel>
    </asp:Content>
