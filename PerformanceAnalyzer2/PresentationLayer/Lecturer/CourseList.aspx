<%@ Page Title="" Language="C#" MasterPageFile="~/PresentationLayer/Lecturer/LecturerMaster.Master" AutoEventWireup="true" CodeBehind="CourseList.aspx.cs" Inherits="PerformanceAnalyzer2.PresentationLayer.Lecturer.WebForm4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                <asp:ListItem Selected="True" Value="1">My Course List</asp:ListItem>
                <asp:ListItem Value="2">Search Courses</asp:ListItem>
            </asp:RadioButtonList>


        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
        <ContentTemplate>

            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="View1" runat="server">
                    <%--     <table style="width: 100%;">
                        <tr>
                            <td colspan="2">
                                <asp:Label ID="Label1" runat="server" Text="My Course List"></asp:Label>

                            </td>

                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="GridView1" runat="server" DataKeyNames="courseID" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" OnRowCommand="GridView1_RowCommand" GridLines="Horizontal" CssClass="table table-striped table-hover  table-condensed  gridViewCustom">
                                    <Columns>
                                        <asp:BoundField DataField="courseID" ReadOnly="true" HeaderText="ID" />
                                        <asp:BoundField DataField="description" HeaderText="Course" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <asp:LinkButton ID="LinkButton1" runat="server">Unfollow | </asp:LinkButton>
                                                        </td>
                                                        <td>
                                                            <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click"> More...</asp:LinkButton>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="spGetCourseList" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="userID" SessionField="userID" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <br />


                                <br />
                            </td>
                            <td>

                                <asp:DetailsView ID="DetailsView1" runat="server"  AutoGenerateRows="False" HeaderText="Course Details" Style="margin-left: 0px" CssClass="table-condensed  table-striped  detailsView" GridLines="Horizontal">
                                    <Fields>
                                        <asp:BoundField DataField="name" HeaderText="Course" />
                                        <asp:BoundField DataField="batch" HeaderText="Batch" />
                                        <asp:BoundField DataField="deptName" HeaderText="Department" />
                                        <asp:BoundField DataField="facName" HeaderText="Faculty" />
                                        <asp:BoundField DataField="uniName" HeaderText="uniName" />
                                        <asp:BoundField DataField="studentCount" HeaderText="Num. Of Students" />
                                        <asp:BoundField DataField="semesterCount" HeaderText="Num. Of Semesters" />
                                        <asp:BoundField DataField="yearCount" HeaderText="Num. Of Acedemic Years" />
                                    </Fields>
                                </asp:DetailsView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="spCourseDetails" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:Parameter Name="courseIDin" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>

                        </tr>

                    </table>--%>


                    <table style="width: 100%;">

                        <tr>
                            <td>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <asp:Label ID="Label1" runat="server" Text="My Course List"></asp:Label>


                                    </div>
                                    <div class="panel-body">
                                        <table>
                                            <tr>
                                                <td colspan="2">
                                                    <asp:GridView ID="GridView1" runat="server" DataKeyNames="courseID" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" OnRowCommand="GridView1_RowCommand" GridLines="Horizontal" CssClass="table table-striped table-hover  table-condensed  gridViewCustom gridview">
                                                        <Columns>
                                                            <asp:BoundField DataField="courseID" ReadOnly="true" HeaderText="ID" />
                                                            <asp:BoundField DataField="description" HeaderText="Course" />
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <table>
                                                                        <tr>
                                                                            <td>
                                                                                <asp:LinkButton ID="LinkButton1" runat="server">Unfollow | </asp:LinkButton>
                                                                            </td>
                                                                            <td>
                                                                                <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click"> More...</asp:LinkButton>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="spGetCourseList" SelectCommandType="StoredProcedure">
                                                        <SelectParameters>
                                                            <asp:SessionParameter Name="userID" SessionField="userID" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" HeaderText="Course Details" Style="margin-left: 0px" CssClass=" gridview table-condensed  table-striped  detailsView" GridLines="Horizontal">
                                                        <Fields>
                                                            <asp:BoundField DataField="name" HeaderText="Course" />
                                                            <asp:BoundField DataField="batch" HeaderText="Batch" />
                                                            <asp:BoundField DataField="deptName" HeaderText="Department" />
                                                            <asp:BoundField DataField="facName" HeaderText="Faculty" />
                                                            <asp:BoundField DataField="uniName" HeaderText="uniName" />
                                                            <asp:BoundField DataField="studentCount" HeaderText="Num. Of Students" />
                                                            <asp:BoundField DataField="semesterCount" HeaderText="Num. Of Semesters" />
                                                            <asp:BoundField DataField="yearCount" HeaderText="Num. Of Acedemic Years" />
                                                        </Fields>
                                                    </asp:DetailsView>
                                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="spCourseDetails" SelectCommandType="StoredProcedure">
                                                        <SelectParameters>
                                                            <asp:Parameter Name="courseIDin" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                    <br />
                                                </td>

                                            </tr>
                                        </table>
                                    </div>

                                </div>

                            </td>
                        </tr>
                    </table>



                </asp:View>
                <asp:View ID="View2" runat="server">
                    <%--  <table>
                        <tr>
                            <td style="width: 453px">
                                <asp:Label ID="Label3" runat="server" Text="Select University"></asp:Label>
                            </td>
                            <td style="width: 482px">
                                <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="true" DataSourceID="SqlDataSource3" DataTextField="name" DataValueField="universityID" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                    <asp:ListItem Selected="True" Value="-1">--Select University--</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT [universityID], [name] FROM [University]"></asp:SqlDataSource>
                            </td>

                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="GridView2" runat="server" DataKeyNames="courseID" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" OnRowCommand="GridView2_RowCommand" CssClass="table table-striped table-hover  table-condensed  gridViewCustom" GridLines="Horizontal">
                                    <Columns>
                                        <asp:BoundField DataField="courseID" Visible="false" HeaderText="CourseID" />
                                        <asp:BoundField DataField="description" HeaderText="Course" />
                                        <asp:TemplateField>


                                            <ItemTemplate>
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <asp:LinkButton ID="LinkButton3" runat="server" Text='<%# Eval("requestStatus") %>' OnClick="LinkButton3_Click"></asp:LinkButton>
                                                        </td>
                                                        <td>
                                                            <asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click"> | More...</asp:LinkButton>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>


                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="spGetCourseListForView" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="userID" SessionField="userID" Type="Int32" />
                                        <asp:ControlParameter ControlID="DropDownList1" Name="universityID" PropertyName="SelectedValue" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                            <td>
                                <br />
                                <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" HeaderText="Course Details" Style="margin-left: 0px" CssClass="table-condensed  table-striped  detailsView" GridLines="Horizontal">
                                    <Fields>
                                        <asp:BoundField DataField="name" HeaderText="Course" />
                                        <asp:BoundField DataField="batch" HeaderText="Batch" />
                                        <asp:BoundField DataField="deptName" HeaderText="Department" />
                                        <asp:BoundField DataField="facName" HeaderText="Faculty" />
                                        <asp:BoundField DataField="uniName" HeaderText="uniName" />
                                        <asp:BoundField DataField="studentCount" HeaderText="Num. Of Students" />
                                        <asp:BoundField DataField="semesterCount" HeaderText="Num. Of Semesters" />
                                        <asp:BoundField DataField="yearCount" HeaderText="Num. Of Acedemic Years" />
                                    </Fields>
                                </asp:DetailsView>
                                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="spCourseDetails" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:Parameter Name="courseIDin" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                    </table>--%>



                    <table style="width: 100%;">
                        <tr>

                            <asp:Panel ID="Panel2" class="panel panel-danger" runat="server">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Select University:</h3>
                                </div>
                                <div class="panel-body form-horizontal">
                                    <div class="form-group">

                                        <asp:Label ID="Label2" runat="server" Width="160px" class="col-lg-3 control-label" Text="Select University"></asp:Label>
                                        <div class="col-lg-4">
                                            <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="true" DataSourceID="SqlDataSource3" DataTextField="name" DataValueField="universityID" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                                <asp:ListItem Selected="True" Value="-1">--Select University--</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT [universityID], [name] FROM [University]"></asp:SqlDataSource>


                                        </div>
                                    </div>

                                </div>
                            </asp:Panel>



                        </tr>

                        <tr>
                            <td>
                                <div class="panel panel-default">
                                    <div class="panel-heading">

                                        <asp:Label ID="Label10" runat="server" Text="Registered Course List"></asp:Label>

                                    </div>
                                    <div class="panel-body">
                                        <table style="width: 100%;">
                                            <tr>
                                                <td colspan="2">
                                                    <asp:GridView ID="GridView2" runat="server" DataKeyNames="courseID" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" OnRowCommand="GridView2_RowCommand" CssClass="table table-striped table-hover  table-condensed  gridViewCustom gridview" GridLines="Horizontal" HorizontalAlign="Center">
                                                        <Columns>
                                                            <asp:BoundField DataField="courseID" Visible="false" HeaderText="CourseID" />
                                                            <asp:BoundField DataField="description" HeaderText="Course" />
                                                            <asp:TemplateField>


                                                                <ItemTemplate>
                                                                    <table>
                                                                        <tr>
                                                                            <td>
                                                                                <asp:LinkButton ID="LinkButton3" runat="server" Text='<%# Eval("requestStatus") %>' OnClick="LinkButton3_Click"></asp:LinkButton>
                                                                            </td>
                                                                            <td>
                                                                                <asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click"> | More...</asp:LinkButton>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </ItemTemplate>


                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="spGetCourseListForView" SelectCommandType="StoredProcedure">
                                                        <SelectParameters>
                                                            <asp:SessionParameter Name="userID" SessionField="userID" Type="Int32" />
                                                            <asp:ControlParameter ControlID="DropDownList1" Name="universityID" PropertyName="SelectedValue" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" HeaderText="Course Details"  CssClass="table table-striped table-hover  table-condensed  gridViewCustom gridview" GridLines="Horizontal" HorizontalAlign="Center">
                                                        <Fields>
                                                            <asp:BoundField DataField="name" HeaderText="Course" />
                                                            <asp:BoundField DataField="batch" HeaderText="Batch" />
                                                            <asp:BoundField DataField="deptName" HeaderText="Department" />
                                                            <asp:BoundField DataField="facName" HeaderText="Faculty" />
                                                            <asp:BoundField DataField="uniName" HeaderText="uniName" />
                                                            <asp:BoundField DataField="studentCount" HeaderText="Num. Of Students" />
                                                            <asp:BoundField DataField="semesterCount" HeaderText="Num. Of Semesters" />
                                                            <asp:BoundField DataField="yearCount" HeaderText="Num. Of Acedemic Years" />
                                                        </Fields>
                                                    </asp:DetailsView>
                                                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="spCourseDetails" SelectCommandType="StoredProcedure">
                                                        <SelectParameters>
                                                            <asp:Parameter Name="courseIDin" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </td>

                                            </tr>
                                        </table>
                                    </div>

                                </div>

                            </td>
                        </tr>
                    </table>







                </asp:View>

            </asp:MultiView>


        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
