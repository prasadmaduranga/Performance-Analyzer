<%@ Page Title="" Language="C#" MasterPageFile="~/PresentationLayer/Lecturer/LecturerMaster.Master" AutoEventWireup="true" CodeBehind="Statistics.aspx.cs" Inherits="PerformanceAnalyzer2.PresentationLayer.Lecturer.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" AutoPostBack="True">
                <asp:ListItem Text="Module Level" Value="1"></asp:ListItem>
                <asp:ListItem Text="Semester Level" Value="2"></asp:ListItem>
                <asp:ListItem Text="Overall" Value="3"></asp:ListItem>
                <asp:ListItem Text="Student Details" Value="5"></asp:ListItem>

            </asp:RadioButtonList>




        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <%--<ContentTemplate>
            <table>
                <tr>
                    <td>
                        <asp:Panel ID="Panel1" runat="server">
                            <table>
                                <tr>
                                    <td style="width: 487px">
                                        <asp:Label ID="Label9" runat="server" Text="Select Course"></asp:Label>
                                    </td>
                                    <td style="width: 583px">
                                        <asp:DropDownList AppendDataBoundItems="True" ID="DropDownList6" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource19" DataTextField="name" DataValueField="courseID" OnSelectedIndexChanged="DropDownList6_SelectedIndexChanged">
                                            <asp:ListItem Text="--Select Course--" Value="-1">

                                            </asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource19" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT Lecture_Course.courseID, Course.name FROM Course INNER JOIN Lecture_Course ON Course.courseID = Lecture_Course.courseID WHERE (Lecture_Course.userID = @userID)">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="userID" SessionField="userID" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>

                    </td>

                </tr>
                <tr>
                    <td>
                        <asp:MultiView ID="MultiView1" runat="server">
                            <asp:View ID="View1" runat="server">
                                <table style="width: 100%;">
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label1" runat="server" Text="Select Module"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="moduleCode" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                                <asp:ListItem Text="--Select module--" Value="-1"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT distinct Semester_Module.moduleCode, Module.name FROM Semester_Module INNER JOIN Semester ON Semester_Module.semesterID = Semester.semesterID INNER JOIN AcedemicYear ON Semester.yearID = AcedemicYear.yearID INNER JOIN Course ON AcedemicYear.courseID = Course.courseID INNER JOIN Module ON Semester_Module.moduleCode = Module.moduleCode WHERE (Course.courseID = @courseID)">
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="courseID" SessionField="statCourseID" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:Label ID="Label2" runat="server"></asp:Label>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="result" DataSourceID="SqlDataSource2" OnDataBound="GridView1_DataBound" CssClass="table table-striped table-hover  table-condensed  gridViewCustom" GridLines="Horizontal" OnPageIndexChanging="GridView1_PageIndexChanging" HorizontalAlign="Center">
                                                <Columns>
                                                    <asp:BoundField DataField="indexNo" HeaderText="Index No" SortExpression="indexNo" />
                                                    <asp:BoundField DataField="userName" HeaderText="Name" SortExpression="userName" />
                                                    <asp:BoundField DataField="result" HeaderText="Result" ReadOnly="True" SortExpression="result" />
                                                    <asp:BoundField DataField="GPA" HeaderText="GPA" SortExpression="GPA" />
                                                </Columns>
                                            </asp:GridView>
                                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="spGetModuleResultForBatch" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="courseID" SessionField="statCourseID" Type="Int32" />
                                                    <asp:ControlParameter ControlID="DropDownList1" Name="moduleCode" PropertyName="SelectedValue" Type="String" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        


                                            <asp:SqlDataSource ID="SqlDataSource14" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="spGetModuleResultForBatchGraph" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="courseID" SessionField="statCourseID" Type="Int32" />
                                                    <asp:ControlParameter ControlID="DropDownList1" Name="moduleCode" PropertyName="SelectedValue" Type="String" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>


                                        </td>

                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" CssClass="table table-striped table-hover  table-condensed  gridViewCustom" GridLines="Horizontal">
                                                <Columns>
                                                    <asp:BoundField DataField="result" HeaderText="Result" SortExpression="result" />
                                                    <asp:BoundField DataField="numOfStudents" HeaderText="Num.Of Students" ReadOnly="True" SortExpression="numberOfStudents" />
                                                </Columns>
                                            </asp:GridView>
                                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT       ResultMapping.result, count(Student.userID)as NumofStudents

FROM           ResultMapping left outer join Enrollment on ResultMapping.result=Enrollment.result
							left outer JOIN
                         student ON Student.userID = Enrollment.userID 
where  Student.courseID=@courseID and Enrollment.moduleCode=@moduleCode
group by  ResultMapping.result ">
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="courseID" SessionField="statCourseID" />
                                                    <asp:ControlParameter ControlID="DropDownList1" Name="moduleCode" PropertyName="SelectedValue" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </td>
                                        <td>
                                            <asp:Chart ID="Chart3" runat="server" DataSourceID="SqlDataSource14" OnLoad="Chart3_Load" Width="387px">
                                                <Series>
                                                    <asp:Series BorderWidth="3" ChartArea="ChartArea1" ChartType="Spline" Name="Series1" XValueMember="GPA" YValueMembers="studentCount">
                                                    </asp:Series>
                                                </Series>
                                                <ChartAreas>
                                                    <asp:ChartArea Name="ChartArea1">
                                                    </asp:ChartArea>
                                                </ChartAreas>
                                            </asp:Chart>
                                        </td>
                                    </tr>
                                </table>
                            </asp:View>
                            <asp:View ID="View2" runat="server">
                                <table style="width: 100%;">
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label5" runat="server" Text="Select Semester"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DropDownList2" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource12" DataTextField="semester" DataValueField="semesterID" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                                                <asp:ListItem Text="--Select Module--" Value="-1"></asp:ListItem>
                                            </asp:DropDownList>
                                            <br />
                                            <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT distinct semesterID, (cast(semesterNumber as nvarchar(10))+' Semester') as semester FROM AcedamicInfo WHERE (courseID =@courseID)">
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="courseID" SessionField="statCourseID" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td colspan="2">
                                            <asp:Label ID="Label4" runat="server"></asp:Label>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:GridView ID="GridView5" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource13" OnRowDataBound="GridView5_RowDataBound" CssClass="table table-striped table-hover  table-condensed  gridViewCustom" GridLines="Horizontal" OnPageIndexChanging="GridView5_PageIndexChanging" HorizontalAlign="Center">
                                                <Columns>
                                                    <asp:BoundField DataField="indexNo" HeaderText="Index No" />
                                                    <asp:BoundField DataField="name" HeaderText="Name" />
                                                    <asp:TemplateField HeaderText="SGPA">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("SGPA") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Rank">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ranking") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("ranking") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                            <asp:SqlDataSource ID="SqlDataSource13" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="spGetSemesterRankings" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="DropDownList2" Name="semesterID" PropertyName="SelectedValue" Type="Int32" />
                                                    <asp:SessionParameter Name="courseID" SessionField="statCourseId" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource6" CssClass="table table-striped table-hover  table-condensed  gridViewCustom" GridLines="Horizontal">
                                                <Columns>
                                                    <asp:BoundField DataField="GPARange" HeaderText="Range" />
                                                    <asp:BoundField DataField="stdCount" HeaderText="Num Of Students" />
                                                </Columns>
                                            </asp:GridView>
                                            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="spGetSemesterRanges" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="DropDownList2" Name="semesterID" PropertyName="SelectedValue" Type="Int32" />
                                                    <asp:SessionParameter Name="courseID" SessionField="statCourseID" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </td>
                                        <td>
                                            <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource6" Height="232px" OnPrePaint="Chart1_PrePaint" Palette="EarthTones" Width="224px">
                                                <Series>
                                                    <asp:Series Name="Series1" IsValueShownAsLabel="true" ShadowColor="Transparent" IsXValueIndexed="true" XValueMember="GPARange" YValueMembers="stdCount">
                                                    </asp:Series>
                                                </Series>
                                                <ChartAreas>
                                                    <asp:ChartArea Name="ChartArea1">
                                                    </asp:ChartArea>
                                                </ChartAreas>
                                            </asp:Chart>
                                        </td>
                                    </tr>
                                </table>


                            </asp:View>
                            <asp:View ID="View3" runat="server">

                                <table style="width: 100%;">


                                    <tr>
                                        <td colspan="2">
                                            <asp:Label ID="Label7" Text="Overrall Reuslts" runat="server"></asp:Label>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource5" OnRowDataBound="GridView3_RowDataBound" CssClass="table table-striped table-hover  table-condensed  gridViewCustom" GridLines="Horizontal" OnPageIndexChanging="GridView3_PageIndexChanging" HorizontalAlign="Center">
                                                <Columns>
                                                    <asp:BoundField DataField="indexNo" HeaderText="Index No" />
                                                    <asp:BoundField DataField="name" HeaderText="Name" />
                                                    <asp:TemplateField HeaderText="GPA">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("SGPA") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Rank">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ranking") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("ranking") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="spGetOverallRankings" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="courseID" SessionField="statCourseId" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource7" CssClass="table table-striped table-hover  table-condensed  gridViewCustom" GridLines="Horizontal">
                                                <Columns>
                                                    <asp:BoundField DataField="GPARange" HeaderText="Range" />
                                                    <asp:BoundField DataField="stdCount" HeaderText="Num Of Students" />
                                                </Columns>
                                            </asp:GridView>
                                            <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="spGetOverallRanges" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="courseID" SessionField="statCourseID" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </td>
                                        <td>
                                            <asp:Chart ID="Chart4" runat="server" DataSourceID="SqlDataSource7" Height="232px" OnPrePaint="Chart1_PrePaint" Palette="EarthTones" Width="224px">
                                                <Series>
                                                    <asp:Series Name="Series1" IsValueShownAsLabel="true" ShadowColor="Transparent" IsXValueIndexed="true" XValueMember="GPARange" YValueMembers="stdCount">
                                                    </asp:Series>
                                                </Series>
                                                <ChartAreas>
                                                    <asp:ChartArea Name="ChartArea1">
                                                    </asp:ChartArea>
                                                </ChartAreas>
                                            </asp:Chart>
                                        </td>
                                    </tr>
                                </table>

                            </asp:View>
                            <asp:View ID="View4" runat="server">
                                <table style="width: 100%;">
                                    <tr>
                                        <td>Select Course</td>
                                        <td>
                                            <asp:DropDownList ID="DropDownList3" AppendDataBoundItems="true" runat="server" DataSourceID="SqlDataSource16" DataTextField="name" DataValueField="courseID" AutoPostBack="True" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
                                                <asp:ListItem Text="--Select Course--" Value="-1"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource16" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="spGetPreviousCourses" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="courseID" SessionField="statCourseID" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td>Select Semester</td>
                                        <td>
                                            <asp:DropDownList AppendDataBoundItems="True" ID="DropDownList4" runat="server" DataSourceID="SqlDataSource17" DataTextField="semester" DataValueField="semesterID" Height="16px" AutoPostBack="True" OnSelectedIndexChanged="DropDownList4_SelectedIndexChanged">
                                                <asp:ListItem Text="--Select Semester--" Value="-1"></asp:ListItem>
                                            </asp:DropDownList>
                                            <br />
                                            <asp:SqlDataSource ID="SqlDataSource17" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="getPreviousSemesters" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="DropDownList3" Name="courseID" PropertyName="SelectedValue" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td>Select Module</td>
                                        <td>
                                            <asp:DropDownList ID="DropDownList5" AppendDataBoundItems="true" runat="server" DataSourceID="SqlDataSource18" DataTextField="name" DataValueField="moduleCode" AutoPostBack="True" OnSelectedIndexChanged="DropDownList5_SelectedIndexChanged">
                                                <asp:ListItem Text="--Select Module--" Value="-1"></asp:ListItem>
                                            </asp:DropDownList>
                                            <br />
                                            <asp:SqlDataSource ID="SqlDataSource18" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT Module.name, Module.moduleCode FROM Semester_Module INNER JOIN Module ON Semester_Module.moduleCode = Module.moduleCode WHERE (Semester_Module.semesterID = @semesterID)">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="DropDownList4" Name="semesterID" PropertyName="SelectedValue" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:Label ID="Label8" runat="server"></asp:Label>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:GridView ID="GridView7" runat="server" AutoGenerateColumns="False" DataKeyNames="result" DataSourceID="SqlDataSource15" CssClass="table table-striped table-hover  table-condensed  gridViewCustom" GridLines="Horizontal">
                                                <Columns>
                                                    <asp:BoundField DataField="result" HeaderText="Grade" ReadOnly="True" SortExpression="result" />
                                                    <asp:BoundField DataField="NumofStudents" HeaderText="Num. Of Students" ReadOnly="True" SortExpression="NumofStudents" />
                                                </Columns>
                                            </asp:GridView>
                                            <asp:SqlDataSource ID="SqlDataSource15" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT       ResultMapping.result, count(Student.userID)as NumofStudents

FROM           ResultMapping left outer join Enrollment on ResultMapping.result=Enrollment.result
							left outer JOIN
                         student ON Student.userID = Enrollment.userID 
where  Student.courseID=@courseID and Enrollment.moduleCode=@moduleCode
group by  ResultMapping.result ">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="DropDownList3" Name="courseID" PropertyName="SelectedValue" />
                                                    <asp:ControlParameter ControlID="DropDownList5" Name="moduleCode" PropertyName="SelectedValue" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </td>
                                        <td>
                                            <asp:Chart ID="Chart5" runat="server" DataSourceID="SqlDataSource15" OnPrePaint="Chart5_PrePaint" Palette="EarthTones">
                                                <Series>
                                                    <asp:Series Name="Series1" IsValueShownAsLabel="true" ChartType="Pie" XValueMember="result" YValueMembers="NumOfStudents">
                                                    </asp:Series>
                                                </Series>
                                                <ChartAreas>
                                                    <asp:ChartArea Name="ChartArea1">
                                                    </asp:ChartArea>
                                                </ChartAreas>
                                            </asp:Chart>
                                        </td>
                                    </tr>
                                </table>
                            </asp:View>
                            <asp:View ID="View5" runat="server">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label3" runat="server" Text="Select Category"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </asp:View>
                            <asp:View ID="View6" runat="server">
                                <table>
                                    <tr>
                                        <td style="width: 288px">
                                            <asp:Label ID="Label10" runat="server" Text="Select Student"></asp:Label>
                                        </td>
                                        <td style="width: 614px">
                                            <asp:DropDownList AppendDataBoundItems="True" ID="DropDownList7" runat="server" DataSourceID="SqlDataSource20" DataTextField="stdName" DataValueField="userID" AutoPostBack="True" OnSelectedIndexChanged="DropDownList7_SelectedIndexChanged">
                                                <asp:ListItem Selected="True" Text="--Select Student--" Value="-1"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource20" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT Student.userID, Student.indexNo + ' - ' + Member.userName AS stdName FROM Student INNER JOIN Member ON Student.userID = Member.userID WHERE (Student.courseID = @courseID)">
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="courseID" SessionField="statCourseID" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </td>
                                    </tr>
                                    <tr>
                                    
                                                    <td colspan="2">
                                                        <asp:DetailsView ID="DetailsView1"  runat="server" AutoGenerateRows="False" DataKeyNames="userID" OnDataBound="DetailsView1_DataBound" Style="margin-right: 1px" CssClass="table-condensed  table-striped  detailsView view1Special" HeaderText="Profile" GridLines="Horizontal" HorizontalAlign="Center">
                                                            <Fields>
                                                                <asp:TemplateField HeaderText="Name" SortExpression="userName">
                                                                    <EditItemTemplate>
                                                                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("userName") %>'></asp:TextBox>
                                                                    </EditItemTemplate>
                                                                    <InsertItemTemplate>
                                                                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("userName") %>'></asp:TextBox>
                                                                    </InsertItemTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("userName") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Profile Picture" SortExpression="imageURL">
                                                                    <EditItemTemplate>
                                                                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("imageURL") %>'></asp:TextBox>
                                                                    </EditItemTemplate>
                                                                    <InsertItemTemplate>
                                                                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("imageURL") %>'></asp:TextBox>
                                                                    </InsertItemTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:Image ID="Image1" runat="server" Height="101px" ImageUrl='<%# Eval("imageURL") %>' Width="98px" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="name" HeaderText="Course" SortExpression="name" />
                                                                <asp:BoundField DataField="batch" HeaderText="Batch(Ac. Year)" SortExpression="batch" />
                                                                <asp:BoundField DataField="Expr1" HeaderText="University" SortExpression="Expr1" />
                                                                <asp:BoundField DataField="Expr2" HeaderText="Faculty" SortExpression="Expr2" />
                                                                <asp:BoundField DataField="Expr3" HeaderText="Department" SortExpression="Expr3" />
                                                                <asp:TemplateField HeaderText="Description" SortExpression="description">
                                                                    <EditItemTemplate>
                                                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("des") %>'></asp:TextBox>
                                                                    </EditItemTemplate>
                                                                    <InsertItemTemplate>
                                                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("des") %>'></asp:TextBox>
                                                                    </InsertItemTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label12" runat="server" Text='<%# Eval("des") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Skills" SortExpression="skills">
                                                                    <EditItemTemplate>
                                                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("skills") %>'></asp:TextBox>
                                                                    </EditItemTemplate>
                                                                    <InsertItemTemplate>
                                                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("skills") %>'></asp:TextBox>
                                                                    </InsertItemTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("skills") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="E-mail" SortExpression="email">
                                                                    <EditItemTemplate>
                                                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                                                                    </EditItemTemplate>
                                                                    <InsertItemTemplate>
                                                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                                                                    </InsertItemTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("email") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Linkedin" SortExpression="linkedin">
                                                                    <EditItemTemplate>
                                                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("linkedin") %>'></asp:TextBox>
                                                                    </EditItemTemplate>
                                                                    <InsertItemTemplate>
                                                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("linkedin") %>'></asp:TextBox>
                                                                    </InsertItemTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:HyperLink ID="HyperLink1" runat="server" Target="_blank" Text='<%# Eval("linkedin") %>' NavigateUrl='<%# Eval("linkedin") %>'></asp:HyperLink>
                                                                      
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="userID" HeaderText="userID" InsertVisible="False" ReadOnly="True" SortExpression="userID" Visible="False" />
                                                            </Fields>
                                                        </asp:DetailsView>


                                                        <asp:SqlDataSource ID="SqlDataSource21" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT        Member.userName, Member.email, Member.linkedin, Member.imageURL, Member.userID, Student.[description] as  des, Student.skills, Course.name, Course.batch, 
                         University.name AS Expr1, Faculty.name AS Expr2, Department.name AS Expr3
FROM            Member INNER JOIN
                         Student ON Member.userID = Student.userID INNER JOIN
                         Department ON Student.departmentID = Department.departmentID INNER JOIN
                         Faculty ON Student.facultyID = Faculty.facultyID AND Department.facultyID = Faculty.facultyID INNER JOIN
                         University ON Student.universityID = University.universityID AND Faculty.universityID = University.universityID INNER JOIN
                         Course ON Student.courseID = Course.courseID AND Department.departmentID = Course.departmentID AND Faculty.facultyID = Course.facultyID AND 
                         University.universityID = Course.universityID
                         where Student.userID=@userID">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="DropDownList7" Name="userID" PropertyName="SelectedValue" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>


                                                    </td>
                                               
                                    </tr>
                                </table>

                            </asp:View>
                        </asp:MultiView>
                    </td>
                </tr>
            </table>
        </ContentTemplate>--%>


        <ContentTemplate>
            <div id="statSpecial">
                <asp:Panel ID="Panel2" class="panel panel-danger" runat="server">
                    <div class="panel-heading">
                        <h3 class="panel-title">Enter Course Info.</h3>
                    </div>
                    <div class="panel-body form-horizontal">
                        <div class="form-group">

                            <asp:Label ID="Label11" Width="160px" class="col-lg-3 control-label" runat="server" Text="Select Course"></asp:Label>

                            <div class="col-lg-4">
                                <asp:DropDownList AppendDataBoundItems="True" ID="DropDownList6" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource19" DataTextField="name" DataValueField="courseID" OnSelectedIndexChanged="DropDownList6_SelectedIndexChanged">
                                    <asp:ListItem Text="--Select Course--" Value="-1">

                                    </asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource19" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT Lecture_Course.courseID, Course.name FROM Course INNER JOIN Lecture_Course ON Course.courseID = Lecture_Course.courseID WHERE (Lecture_Course.userID = @userID)">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="userID" SessionField="userID" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

                            </div>
                        </div>

                    </div>
                </asp:Panel>
                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="View1" runat="server">
                        <table style="width: 100%;">
                            <tr>

                                <asp:Panel ID="Panel1" class="panel panel-danger" runat="server">

                                    <div class="panel-body form-horizontal">
                                        <div class="form-group">


                                            <asp:Label ID="Label1" Width="160px" class="col-lg-3 control-label" runat="server" Text="Select Module"></asp:Label>

                                            <div class="col-lg-4">
                                                <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="moduleCode" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                                    <asp:ListItem Text="--Select module--" Value="-1"></asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT distinct Semester_Module.moduleCode, Module.name FROM Semester_Module INNER JOIN Semester ON Semester_Module.semesterID = Semester.semesterID INNER JOIN AcedemicYear ON Semester.yearID = AcedemicYear.yearID INNER JOIN Course ON AcedemicYear.courseID = Course.courseID INNER JOIN Module ON Semester_Module.moduleCode = Module.moduleCode WHERE (Course.courseID = @courseID)">
                                                    <SelectParameters>
                                                        <asp:SessionParameter Name="courseID" SessionField="statCourseID" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>

                                            </div>
                                        </div>

                                    </div>
                                </asp:Panel>








                            </tr>

                            <tr>
                                <td>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">


                                            <asp:Label ID="Label2" runat="server"></asp:Label>

                                        </div>
                                        <div class="panel-body">
                                            <table>
                                                <tr>
                                                    <td colspan="2">
                                                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="result" DataSourceID="SqlDataSource2" OnDataBound="GridView1_DataBound" CssClass="table table-striped table-hover  table-condensed  gridViewCustom" GridLines="Horizontal" OnPageIndexChanging="GridView1_PageIndexChanging" HorizontalAlign="Center">
                                                            <Columns>
                                                                <asp:BoundField DataField="indexNo" HeaderText="Index No" SortExpression="indexNo" />
                                                                <asp:BoundField DataField="userName" HeaderText="Name" SortExpression="userName" />
                                                                <asp:BoundField DataField="result" HeaderText="Result" ReadOnly="True" SortExpression="result" />
                                                                <asp:BoundField DataField="GPA" HeaderText="GPA" SortExpression="GPA" />
                                                            </Columns>
                                                        </asp:GridView>
                                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="spGetModuleResultForBatch" SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:SessionParameter Name="courseID" SessionField="statCourseID" Type="Int32" />
                                                                <asp:ControlParameter ControlID="DropDownList1" Name="moduleCode" PropertyName="SelectedValue" Type="String" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>



                                                        <asp:SqlDataSource ID="SqlDataSource14" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="spGetModuleResultForBatchGraph" SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:SessionParameter Name="courseID" SessionField="statCourseID" Type="Int32" />
                                                                <asp:ControlParameter ControlID="DropDownList1" Name="moduleCode" PropertyName="SelectedValue" Type="String" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>

                                                    </td>


                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" CssClass="table table-striped table-hover  table-condensed  gridViewCustom" GridLines="Horizontal">
                                                            <Columns>
                                                                <asp:BoundField DataField="result" HeaderText="Result" SortExpression="result" />
                                                                <asp:BoundField DataField="numOfStudents" HeaderText="Num.Of Students" ReadOnly="True" SortExpression="numberOfStudents" />
                                                            </Columns>
                                                        </asp:GridView>
                                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT       ResultMapping.result, count(Student.userID)as NumofStudents

FROM           ResultMapping left outer join Enrollment on ResultMapping.result=Enrollment.result
							left outer JOIN
                         student ON Student.userID = Enrollment.userID 
where  Student.courseID=@courseID and Enrollment.moduleCode=@moduleCode
group by  ResultMapping.result ">
                                                            <SelectParameters>
                                                                <asp:SessionParameter Name="courseID" SessionField="statCourseID" />
                                                                <asp:ControlParameter ControlID="DropDownList1" Name="moduleCode" PropertyName="SelectedValue" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </td>
                                                    <td>
                                                        <asp:Chart ID="Chart3" runat="server" DataSourceID="SqlDataSource14" OnLoad="Chart3_Load" Width="387px">
                                                            <Series>
                                                                <asp:Series BorderWidth="3" ChartArea="ChartArea1" ChartType="Spline" Name="Series1" XValueMember="GPA" YValueMembers="studentCount">
                                                                </asp:Series>
                                                            </Series>
                                                            <ChartAreas>
                                                                <asp:ChartArea Name="ChartArea1">
                                                                </asp:ChartArea>
                                                            </ChartAreas>
                                                        </asp:Chart>
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





                        <table style="width: 100%;">
                            <tr>


                                <asp:Panel ID="Panel3" class="panel panel-danger" runat="server">

                                    <div class="panel-body form-horizontal">
                                        <div class="form-group">


                                            <asp:Label ID="Label5" Width="160px" class="col-lg-3 control-label" runat="server" Text="Select Semester"></asp:Label>
                                            <div class="col-lg-4">
                                                <asp:DropDownList ID="DropDownList2" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource12" DataTextField="semester" DataValueField="semesterID" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                                                    <asp:ListItem Text="--Select Semester--" Value="-1"></asp:ListItem>
                                                </asp:DropDownList>
                                                <br />
                                                <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT distinct semesterID, (cast(semesterNumber as nvarchar(10))+' Semester') as semester FROM AcedamicInfo WHERE (courseID =@courseID)">
                                                    <SelectParameters>
                                                        <asp:SessionParameter Name="courseID" SessionField="statCourseID" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>

                                            </div>
                                        </div>

                                    </div>
                                </asp:Panel>








                            </tr>

                            <tr>
                                <td>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <asp:Label ID="Label4" runat="server"></asp:Label>

                                        </div>
                                        <div class="panel-body">
                                            <table>
                                                <tr>
                                                    <td colspan="2">
                                                        <asp:GridView ID="GridView5" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource13" OnRowDataBound="GridView5_RowDataBound" CssClass="table table-striped table-hover  table-condensed  gridViewCustom" GridLines="Horizontal" HorizontalAlign="Center" OnPageIndexChanging="GridView5_PageIndexChanging">
                                                            <Columns>
                                                                <asp:BoundField DataField="indexNo" HeaderText="Index No" />
                                                                <asp:BoundField DataField="name" HeaderText="Name" />
                                                                <asp:TemplateField HeaderText="SGPA">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("SGPA") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Rank">
                                                                    <EditItemTemplate>
                                                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ranking") %>'></asp:TextBox>
                                                                    </EditItemTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("ranking") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                        <asp:SqlDataSource ID="SqlDataSource13" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="spGetSemesterRankings" SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="DropDownList2" Name="semesterID" PropertyName="SelectedValue" Type="Int32" />
                                                                <asp:SessionParameter Name="courseID" SessionField="statCourseId" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource6" CssClass="table table-striped table-hover  table-condensed  gridViewCustom" GridLines="Horizontal">
                                                            <Columns>
                                                                <asp:BoundField DataField="GPARange" HeaderText="Range" />
                                                                <asp:BoundField DataField="stdCount" HeaderText="Num Of Students" />
                                                            </Columns>
                                                        </asp:GridView>
                                                        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="spGetSemesterRanges" SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="DropDownList2" Name="semesterID" PropertyName="SelectedValue" Type="Int32" />
                                                                <asp:SessionParameter Name="courseID" SessionField="statCourseID" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </td>
                                                    <td>
                                                        <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource6" Height="232px" OnPrePaint="Chart1_PrePaint" Palette="EarthTones" Width="224px">
                                                            <Series>
                                                                <asp:Series Name="Series1" IsValueShownAsLabel="true" ShadowColor="Transparent" IsXValueIndexed="true" XValueMember="GPARange" YValueMembers="stdCount">
                                                                </asp:Series>
                                                            </Series>
                                                            <ChartAreas>
                                                                <asp:ChartArea Name="ChartArea1">
                                                                </asp:ChartArea>
                                                            </ChartAreas>
                                                        </asp:Chart>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>


                                </td>
                            </tr>


                        </table>

                    </asp:View>
                    <asp:View ID="View3" runat="server">






                        <table style="width: 100%;">


                            <tr>
                                <td>
                                    <div class="panel panel-default" style="margin-top: 25px">
                                        <div class="panel-heading">
                                            <asp:Label ID="Label7" Text="Overrall Reuslts" runat="server"></asp:Label>

                                        </div>
                                        <div class="panel-body">
                                            <table>
                                                <tr>
                                                    <td colspan="2">
                                                        <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource5" OnRowDataBound="GridView3_RowDataBound" CssClass="table table-striped table-hover  table-condensed  gridViewCustom" GridLines="Horizontal" HorizontalAlign="Center" OnPageIndexChanging="GridView3_PageIndexChanging">
                                                            <Columns>
                                                                <asp:BoundField DataField="indexNo" HeaderText="Index No" />
                                                                <asp:BoundField DataField="name" HeaderText="Name" />
                                                                <asp:TemplateField HeaderText="GPA">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("SGPA") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Rank">
                                                                    <EditItemTemplate>
                                                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ranking") %>'></asp:TextBox>
                                                                    </EditItemTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("ranking") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="spGetOverallRankings" SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:SessionParameter Name="courseID" SessionField="statCourseId" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource7" CssClass="table table-striped table-hover  table-condensed  gridViewCustom" GridLines="Horizontal">
                                                            <Columns>
                                                                <asp:BoundField DataField="GPARange" HeaderText="Range" />
                                                                <asp:BoundField DataField="stdCount" HeaderText="Num Of Students" />
                                                            </Columns>
                                                        </asp:GridView>
                                                        <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="spGetOverallRanges" SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:SessionParameter Name="courseID" SessionField="statCourseID" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </td>
                                                    <td>
                                                        <asp:Chart ID="Chart4" runat="server" DataSourceID="SqlDataSource7" Height="232px" OnPrePaint="Chart1_PrePaint" Palette="EarthTones" Width="224px">
                                                            <Series>
                                                                <asp:Series Name="Series1" IsValueShownAsLabel="true" ShadowColor="Transparent" IsXValueIndexed="true" XValueMember="GPARange" YValueMembers="stdCount">
                                                                </asp:Series>
                                                            </Series>
                                                            <ChartAreas>
                                                                <asp:ChartArea Name="ChartArea1">
                                                                </asp:ChartArea>
                                                            </ChartAreas>
                                                        </asp:Chart>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>


                                </td>
                            </tr>


                        </table>






                    </asp:View>
                    <asp:View ID="View4" runat="server">
                        <table style="width: 100%;">
                            <tr>
                                <td>Select Course</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList3" AppendDataBoundItems="true" runat="server" DataSourceID="SqlDataSource16" DataTextField="name" DataValueField="courseID" AutoPostBack="True" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
                                        <asp:ListItem Text="--Select Course--" Value="-1"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource16" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="spGetPreviousCourses" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="courseID" SessionField="statCourseID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>

                            </tr>
                            <tr>
                                <td>Select Semester</td>
                                <td>
                                    <asp:DropDownList AppendDataBoundItems="True" ID="DropDownList4" runat="server" DataSourceID="SqlDataSource17" DataTextField="semester" DataValueField="semesterID" Height="16px" AutoPostBack="True" OnSelectedIndexChanged="DropDownList4_SelectedIndexChanged">
                                        <asp:ListItem Text="--Select Semester--" Value="-1"></asp:ListItem>
                                    </asp:DropDownList>
                                    <br />
                                    <asp:SqlDataSource ID="SqlDataSource17" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="getPreviousSemesters" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="DropDownList3" Name="courseID" PropertyName="SelectedValue" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>

                            </tr>
                            <tr>
                                <td>Select Module</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList5" AppendDataBoundItems="true" runat="server" DataSourceID="SqlDataSource18" DataTextField="name" DataValueField="moduleCode" AutoPostBack="True" OnSelectedIndexChanged="DropDownList5_SelectedIndexChanged">
                                        <asp:ListItem Text="--Select Module--" Value="-1"></asp:ListItem>
                                    </asp:DropDownList>
                                    <br />
                                    <asp:SqlDataSource ID="SqlDataSource18" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT Module.name, Module.moduleCode FROM Semester_Module INNER JOIN Module ON Semester_Module.moduleCode = Module.moduleCode WHERE (Semester_Module.semesterID = @semesterID)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="DropDownList4" Name="semesterID" PropertyName="SelectedValue" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>

                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Label ID="Label8" runat="server"></asp:Label>
                                </td>

                            </tr>
                            <tr>
                                <td>
                                    <asp:GridView ID="GridView7" runat="server" AutoGenerateColumns="False" DataKeyNames="result" DataSourceID="SqlDataSource15" CssClass="table table-striped table-hover  table-condensed  gridViewCustom" GridLines="Horizontal">
                                        <Columns>
                                            <asp:BoundField DataField="result" HeaderText="Grade" ReadOnly="True" SortExpression="result" />
                                            <asp:BoundField DataField="NumofStudents" HeaderText="Num. Of Students" ReadOnly="True" SortExpression="NumofStudents" />
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource15" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT       ResultMapping.result, count(Student.userID)as NumofStudents

FROM           ResultMapping left outer join Enrollment on ResultMapping.result=Enrollment.result
							left outer JOIN
                         student ON Student.userID = Enrollment.userID 
where  Student.courseID=@courseID and Enrollment.moduleCode=@moduleCode
group by  ResultMapping.result ">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="DropDownList3" Name="courseID" PropertyName="SelectedValue" />
                                            <asp:ControlParameter ControlID="DropDownList5" Name="moduleCode" PropertyName="SelectedValue" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                                <td>
                                    <asp:Chart ID="Chart5" runat="server" DataSourceID="SqlDataSource15" OnPrePaint="Chart5_PrePaint" Palette="EarthTones">
                                        <Series>
                                            <asp:Series Name="Series1" IsValueShownAsLabel="true" ChartType="Pie" XValueMember="result" YValueMembers="NumOfStudents">
                                            </asp:Series>
                                        </Series>
                                        <ChartAreas>
                                            <asp:ChartArea Name="ChartArea1">
                                            </asp:ChartArea>
                                        </ChartAreas>
                                    </asp:Chart>
                                </td>
                            </tr>
                        </table>

                    </asp:View>
                    <asp:View ID="View5" runat="server">
                        <div class="jumbotron" style="margin-top: 15px; margin-top: 15px; background-color: grey; padding: 10px; background-color: #E8E8E8;">
                            <h3 style="color: black; opacity: .9;">First Select Filtering Category! </h3>

                        </div>

                    </asp:View>
                    <asp:View ID="View6" runat="server">



                        <table style="width: 100%;">
                            <tr>


                                <asp:Panel ID="Panel4" class="panel panel-danger" runat="server">

                                    <div class="panel-body form-horizontal">
                                        <div class="form-group">


                                            <asp:Label ID="Label12" runat="server" Width="160px" class="col-lg-3 control-label" Text="Select Student"></asp:Label>
                                            <div class="col-lg-4">
                                                <asp:DropDownList AppendDataBoundItems="True" Width="160px" ID="DropDownList7" runat="server" DataSourceID="SqlDataSource20" DataTextField="stdName" DataValueField="userID" AutoPostBack="True" OnSelectedIndexChanged="DropDownList7_SelectedIndexChanged">
                                                    <asp:ListItem Selected="True" Text="--Select Student--" Value="-1"></asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="SqlDataSource20" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT Student.userID, Student.indexNo + ' - ' + Member.userName AS stdName FROM Student INNER JOIN Member ON Student.userID = Member.userID WHERE (Student.courseID = @courseID)">
                                                    <SelectParameters>
                                                        <asp:SessionParameter Name="courseID" SessionField="statCourseID" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>

                                            </div>
                                        </div>

                                    </div>
                                </asp:Panel>








                            </tr>

                            <tr>
                                <td>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <asp:Label ID="Label10" runat="server"></asp:Label>

                                        </div>
                                        <div class="panel-body">
                                            <table>

                                                <tr>
                                                    <td colspan="2">
                                                        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="userID" OnDataBound="DetailsView1_DataBound" Style="margin-right: 1px" CssClass="table-condensed  table-striped  detailsView" GridLines="Horizontal" HeaderText="Profile" HorizontalAlign="Center">
                                                            <Fields>
                                                                <asp:TemplateField HeaderText="Name" SortExpression="userName">
                                                                    <EditItemTemplate>
                                                                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("userName") %>'></asp:TextBox>
                                                                    </EditItemTemplate>
                                                                    <InsertItemTemplate>
                                                                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("userName") %>'></asp:TextBox>
                                                                    </InsertItemTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("userName") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Profile Picture" SortExpression="imageURL">
                                                                    <EditItemTemplate>
                                                                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("imageURL") %>'></asp:TextBox>
                                                                    </EditItemTemplate>
                                                                    <InsertItemTemplate>
                                                                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("imageURL") %>'></asp:TextBox>
                                                                    </InsertItemTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:Image ID="Image1" runat="server" Height="101px" ImageUrl='<%# Eval("imageURL") %>' Width="98px" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="name" HeaderText="Course" SortExpression="name" />
                                                                <asp:BoundField DataField="batch" HeaderText="Batch(Ac. Year)" SortExpression="batch" />
                                                                <asp:BoundField DataField="Expr1" HeaderText="University" SortExpression="Expr1" />
                                                                <asp:BoundField DataField="Expr2" HeaderText="Faculty" SortExpression="Expr2" />
                                                                <asp:BoundField DataField="Expr3" HeaderText="Department" SortExpression="Expr3" />
                                                                <asp:TemplateField HeaderText="Description" SortExpression="description">
                                                                    <EditItemTemplate>
                                                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("des") %>'></asp:TextBox>
                                                                    </EditItemTemplate>
                                                                    <InsertItemTemplate>
                                                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("des") %>'></asp:TextBox>
                                                                    </InsertItemTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label12" runat="server" Text='<%# Eval("des") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Skills" SortExpression="skills">
                                                                    <EditItemTemplate>
                                                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("skills") %>'></asp:TextBox>
                                                                    </EditItemTemplate>
                                                                    <InsertItemTemplate>
                                                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("skills") %>'></asp:TextBox>
                                                                    </InsertItemTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("skills") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="E-mail" SortExpression="email">
                                                                    <EditItemTemplate>
                                                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                                                                    </EditItemTemplate>
                                                                    <InsertItemTemplate>
                                                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                                                                    </InsertItemTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("email") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Linkedin" SortExpression="linkedin">
                                                                    <EditItemTemplate>
                                                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("linkedin") %>'></asp:TextBox>
                                                                    </EditItemTemplate>
                                                                    <InsertItemTemplate>
                                                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("linkedin") %>'></asp:TextBox>
                                                                    </InsertItemTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:HyperLink ID="HyperLink1" runat="server" Target="_blank" Text='<%# Eval("linkedin") %>' NavigateUrl='<%# Eval("linkedin") %>'></asp:HyperLink>

                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="userID" HeaderText="userID" InsertVisible="False" ReadOnly="True" SortExpression="userID" Visible="False" />
                                                            </Fields>
                                                        </asp:DetailsView>


                                                        <asp:SqlDataSource ID="SqlDataSource21" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT        Member.userName, Member.email, Member.linkedin, Member.imageURL, Member.userID, Student.[description] as  des, Student.skills, Course.name, Course.batch, 
                         University.name AS Expr1, Faculty.name AS Expr2, Department.name AS Expr3
FROM            Member INNER JOIN
                         Student ON Member.userID = Student.userID INNER JOIN
                         Department ON Student.departmentID = Department.departmentID INNER JOIN
                         Faculty ON Student.facultyID = Faculty.facultyID AND Department.facultyID = Faculty.facultyID INNER JOIN
                         University ON Student.universityID = University.universityID AND Faculty.universityID = University.universityID INNER JOIN
                         Course ON Student.courseID = Course.courseID AND Department.departmentID = Course.departmentID AND Faculty.facultyID = Course.facultyID AND 
                         University.universityID = Course.universityID
                         where Student.userID=@userID">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="DropDownList7" Name="userID" PropertyName="SelectedValue" />
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
                </td>
                </tr>
            </table>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
