<%@ Page Title="" Language="C#" MasterPageFile="~/PresentationLayer/Student/StudentMaster.Master" AutoEventWireup="true" CodeBehind="Statistics.aspx.cs" Inherits="PerformanceAnalyzer2.PresentationLayer.Student.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" AutoPostBack="True">
                <asp:ListItem Text="Module Level" Value="1"></asp:ListItem>
                <asp:ListItem Text="Semester Level" Value="2"></asp:ListItem>
                <asp:ListItem Text="Overall" Value="3"></asp:ListItem>
                <asp:ListItem Text="Past Results" Value="4"></asp:ListItem>
            </asp:RadioButtonList>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="View1" runat="server">
                    <table style="width: 100%;">

                        <tr>
                            <td >
                                <asp:Label ID="Label1" runat="server" Text="Select Module"></asp:Label>
                            </td>
                             <td >
                                 <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="moduleCode" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                 <asp:ListItem Text="--Select Module--" Value="-1"></asp:ListItem>
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
                            <td >
                                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="result" DataSourceID="SqlDataSource2">
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
                            </td>
                            <td>


                                <asp:Chart ID="Chart3" runat="server" DataSourceID="SqlDataSource14" Width="387px">
                                    <Series>
                                        <asp:Series ChartType="Spline" BorderWidth="3" Name="Series1" XValueMember="GPA" YValueMembers="studentCount" ChartArea="ChartArea1">
                                        </asp:Series>
                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="ChartArea1">
                                        </asp:ChartArea>
                                    </ChartAreas>
                                </asp:Chart>
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
                                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3">
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
                                <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource3" Height="232px" OnPrePaint="Chart1_PrePaint" Palette="EarthTones" Width="224px">
                                    <Series>
                                        <asp:Series Name="Series1"  IsValueShownAsLabel="true" ShadowColor="Transparent" IsXValueIndexed="true" ChartType="Pie" XValueMember="result" YValueMembers="NumofStudents">
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
                            <td >
                                <asp:Label ID="Label5" runat="server" Text="Select Semester"></asp:Label>
                            </td>
                             <td >
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
                                <asp:GridView ID="GridView5" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource13" OnRowDataBound="GridView5_RowDataBound">
                                    <Columns>
                                        <asp:BoundField DataField="indexNo" HeaderText="Index No"   />
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
                                <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource6">
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
                                        <asp:Series Name="Series1"  IsValueShownAsLabel="true" ShadowColor="Transparent" IsXValueIndexed="true" XValueMember="GPARange" YValueMembers="stdCount">
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
                                <asp:Label ID="Label7"  Text="Overrall Reuslts" runat="server"></asp:Label>
                            </td>
                           
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource5" OnRowDataBound="GridView3_RowDataBound">
                                    <Columns>
                                        <asp:BoundField DataField="indexNo" HeaderText="Index No"   />
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
                                <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource7">
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
                                        <asp:Series Name="Series1"  IsValueShownAsLabel="true" ShadowColor="Transparent" IsXValueIndexed="true" XValueMember="GPARange" YValueMembers="stdCount">
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
                    <table style="width:100%;">
                        <tr>
                            <td>
                                Select Course</td>
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
                            <td>
                                Select Semester</td>
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
                            <td>
                                Select Module</td>
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
                            <td >
                                <asp:GridView ID="GridView7" runat="server" AutoGenerateColumns="False" DataKeyNames="result" DataSourceID="SqlDataSource15">
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
                           <td >
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
            </asp:MultiView>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
