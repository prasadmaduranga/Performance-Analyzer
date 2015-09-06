<%@ Page Title="" Language="C#" MasterPageFile="~/PresentationLayer/Student/StudentMaster.Master" AutoEventWireup="true" CodeBehind="MyCourseView.aspx.cs" Inherits="PerformanceAnalyzer2.PresentationLayer.Student.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        



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
                    <asp:Menu ID="Menu1" runat="server" OnMenuItemClick="Menu1_MenuItemClick" StaticMenuStyle-Width="100%" StaticMenuStyle-CssClass="nav navbar-nav" class="navbar-collapse collapse sidebar-navbar-collapse">

                        <Items>
                            <asp:MenuItem Text="Basic Details"></asp:MenuItem>
                            <asp:MenuItem Text="Modules"></asp:MenuItem>
                            <asp:MenuItem Text="Student Details"></asp:MenuItem>
<%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
                        </Items>
                    </asp:Menu>
                    <!--/.nav-collapse -->
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="View1" runat="server">
                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="courseID"  CssClass="gridview5  table-condensed  table-striped  detailsView" HeaderText="Basic Course Information" HorizontalAlign="Center" Width="600px">
                        <Fields>
                            <asp:TemplateField HeaderText="Course name">

                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Batch">

                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("batch") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="University">

                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("universityName") %>'></asp:Label>
                                    <br />

                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Faculty ">


                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("facultyName") %>'></asp:Label>
                                    <br />

                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Department">

                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("departmentName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Number of student">
                                <ItemTemplate>

                                    <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="select count(userID) as studentCount from Student where courseID=@courseID">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="courseID" SessionField="courseID" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource7" ShowHeader="False" GridLines="None">
                                    </asp:GridView>
                                    <br />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Number of acedemic years">

                                <ItemTemplate>

                                    <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="select count(yearID) as yearCount from AcedemicYear where courseID=@courseID">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="courseID" SessionField="courseID" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:GridView ID="GridView2" runat="server" DataSourceID="SqlDataSource8" ShowHeader="False" GridLines="None">
                                    </asp:GridView>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Number of semesters">


                                <ItemTemplate>

                                    <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="select count(semesterID) as semesterCount from Semester join AcedemicYear on AcedemicYear.yearID=Semester.yearID  where AcedemicYear.courseID=@courseID
">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="courseID" SessionField="courseID" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:GridView ID="GridView3" runat="server" DataSourceID="SqlDataSource9" ShowHeader="False" SelectedRowStyle-BorderWidth="0px" GridLines="None">
                                    </asp:GridView>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Fields>

                    </asp:DetailsView>
                </asp:View>
                <asp:View ID="View2" runat="server">

                    <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataKeyNames="semesterID" OnDataBinding="GridView4_DataBinding" OnRowDataBound="GridView4_RowDataBound" CssClass="gridview3 table table-striped table-hover  table-condensed  gridViewCustom" HorizontalAlign="Center" Width="650px">
                        <Columns>
                            <%-- <asp:BoundField DataField="semesterID" InsertVisible="false" HeaderText="semesterID" SortExpression="semesterID" />--%>

                            <asp:TemplateField HeaderText="Semester" SortExpression="semesterNumber">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("semesterNumber") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# string.Concat("Semester ",Eval("semesterNumber")) %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Modules" SortExpression="semesterID">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("semesterID") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource10" Width="500px">
                                        <Columns>
                                            <asp:BoundField DataField="moduleCode" HeaderText="moduleCode" SortExpression="moduleCode" />
                                            <asp:BoundField DataField="moduleName" HeaderText="moduleName" SortExpression="moduleName" />
                                            <asp:BoundField DataField="GPA" HeaderText="GPA" SortExpression="GPA" />
                                            <asp:BoundField DataField="credits" HeaderText="credits" SortExpression="credits" />
                                            <asp:BoundField DataField="courseID" InsertVisible="false" Visible="false" HeaderText="courseID" SortExpression="courseID" />

                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="spGetModulesBySemester" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:Parameter Name="semesterID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <br />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </asp:View>
                <asp:View ID="View3" runat="server">
                    <table>
                        <tr>
                            <td>
                                <div>
                                    <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False" DataKeyNames="userID" DataSourceID="SqlDataSource11" OnSelectedIndexChanged="GridView6_SelectedIndexChanged" AllowPaging="True" CssClass="gridview7  table table-striped table-hover  table-condensed  gridViewCustom col-sm-9" GridLines="Horizontal" OnPageIndexChanging="GridView6_PageIndexChanging" Width="450px">
                                        <Columns>
                                            <asp:CommandField ShowSelectButton="True" />
                                            <asp:BoundField DataField="userID" Visible="false" HeaderText="userID" InsertVisible="False" ReadOnly="True" SortExpression="userID" />
                                            <asp:TemplateField HeaderText="Name" SortExpression="userName">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("userName") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <table style="width: 100%;">
                                                        <tr>
                                                            <td>
                                                                <asp:Image ID="Image1" runat="server" Height="25px" ImageUrl='<%# Eval("imageURL") %>' Width="25px" />
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("userName") %>'></asp:Label>
                                                            </td>

                                                        </tr>

                                                    </table>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="indexNo" HeaderText="Index No" SortExpression="indexNo" />

                                        </Columns>
                                    </asp:GridView>
                                      <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" DataKeyNames="userID" DataSourceID="SqlDataSource12" CssClass="margin110  col-sm-3 table-condensed  table-striped  detailsView" HeaderText="Profile" Width="350px">
                                        <Fields>
                                            <asp:TemplateField HeaderText="Profile Picture" SortExpression="imageURL">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("imageURL") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <InsertItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("imageURL") %>'></asp:TextBox>
                                                </InsertItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Image ID="Image2" runat="server" Height="100px" Width="100px" ImageUrl='<%# Eval("imageURL") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="userID" Visible="false" HeaderText="userID" InsertVisible="False" ReadOnly="True" SortExpression="userID" />
                                            <asp:BoundField DataField="userName" HeaderText="Name" SortExpression="userName" />
                                            <asp:BoundField DataField="indexNo" HeaderText="Index No." SortExpression="indexNo" />
                                            <asp:BoundField DataField="DateOfBirth" HeaderText="DOB" SortExpression="DOB" />
                                            <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" />
                                            <asp:BoundField DataField="skills" HeaderText="Skills" SortExpression="skills" />
                                            <asp:BoundField DataField="email" HeaderText="E-mail" SortExpression="email" />
                                            <asp:BoundField DataField="linkedin" HeaderText="Linkedin" SortExpression="linkedin" />
                                            <asp:TemplateField HeaderText="Telephone No.">
                                                <ItemTemplate>
                                                    <asp:GridView ID="GridView7" runat="server" AutoGenerateColumns="False" DataKeyNames="telephoneNumber,userID" DataSourceID="SqlDataSource13" ShowHeader="False">
                                                        <Columns>
                                                            <asp:BoundField DataField="telephoneNumber" HeaderText="telephoneNumber" ReadOnly="True" SortExpression="telephoneNumber" />
                                                        </Columns>
                                                    </asp:GridView>
                                                    <br />
                                                    <asp:SqlDataSource ID="SqlDataSource13" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT [telephoneNumber], [userID] FROM [TelephoneNumber] WHERE ([userID] = @userID)">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="GridView6" Name="userID" PropertyName="SelectedValue" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Fields>
                                    </asp:DetailsView>
                                </div>
                                </td>
                            
                          <%--  <td>
                                <div>

                                    <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" DataKeyNames="userID" DataSourceID="SqlDataSource12" CssClass="table-condensed  table-striped  detailsView" HeaderText="Profile" Width="300px">
                                        <Fields>
                                            <asp:TemplateField HeaderText="Profile Picture" SortExpression="imageURL">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("imageURL") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <InsertItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("imageURL") %>'></asp:TextBox>
                                                </InsertItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Image ID="Image2" runat="server" Height="60px" Width="60px" ImageUrl='<%# Eval("imageURL") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="userID" Visible="false" HeaderText="userID" InsertVisible="False" ReadOnly="True" SortExpression="userID" />
                                            <asp:BoundField DataField="userName" HeaderText="Name" SortExpression="userName" />
                                            <asp:BoundField DataField="indexNo" HeaderText="Index No." SortExpression="indexNo" />
                                            <asp:BoundField DataField="DateOfBirth" HeaderText="DOB" SortExpression="DOB" />
                                            <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" />
                                            <asp:BoundField DataField="skills" HeaderText="Skills" SortExpression="skills" />
                                            <asp:BoundField DataField="email" HeaderText="E-mail" SortExpression="email" />
                                            <asp:BoundField DataField="linkedin" HeaderText="Linkedin" SortExpression="linkedin" />
                                            <asp:TemplateField HeaderText="Telephone No.">
                                                <ItemTemplate>
                                                    <asp:GridView ID="GridView7" runat="server" AutoGenerateColumns="False" DataKeyNames="telephoneNumber,userID" DataSourceID="SqlDataSource13" ShowHeader="False">
                                                        <Columns>
                                                            <asp:BoundField DataField="telephoneNumber" HeaderText="telephoneNumber" ReadOnly="True" SortExpression="telephoneNumber" />
                                                        </Columns>
                                                    </asp:GridView>
                                                    <br />
                                                    <asp:SqlDataSource ID="SqlDataSource13" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT [telephoneNumber], [userID] FROM [TelephoneNumber] WHERE ([userID] = @userID)">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="GridView6" Name="userID" PropertyName="SelectedValue" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Fields>
                                    </asp:DetailsView>
                                </div>
                            </td>--%>
                            </tr>
                        <tr>
                            <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT Member.userID, Member.userName, Student.indexNo, Member.imageURL FROM Member INNER JOIN Student ON Member.userID = Student.userID
where Student.courseID=@courseID">
                        <SelectParameters>
                            <asp:SessionParameter Name="courseID" SessionField="courseID" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT Member.userID, Member.userName, Member.email, Member.linkedin, Member.imageURL,convert(date, Member.DOB) as DateOfBirth, Student.indexNo, Student.description, Student.skills FROM Member INNER JOIN Student ON Member.userID = Student.userID WHERE (Member.userID = @userID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridView6" Name="userID" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                        </tr>
                    </table>
                    <br />
                  <%--  <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT Member.userID, Member.userName, Student.indexNo, Member.imageURL FROM Member INNER JOIN Student ON Member.userID = Student.userID
where Student.courseID=@courseID">
                        <SelectParameters>
                            <asp:SessionParameter Name="courseID" SessionField="courseID" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT Member.userID, Member.userName, Member.email, Member.linkedin, Member.imageURL,convert(date, Member.DOB) as DateOfBirth, Student.indexNo, Student.description, Student.skills FROM Member INNER JOIN Student ON Member.userID = Student.userID WHERE (Member.userID = @userID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridView6" Name="userID" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>--%>
                    <br />
                </asp:View>

            </asp:MultiView>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
