<%@ Page Title="" Language="C#" MasterPageFile="~/PresentationLayer/Student/StudentMaster.Master" AutoEventWireup="true" CodeBehind="Compare.aspx.cs" Inherits="PerformanceAnalyzer2.PresentationLayer.Student.WebForm4" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>




            <asp:Panel ID="Panel1" runat="server">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">Comparison Group</h3>
                    </div>
                    <div class="panel-body">
                        <table style="width: 100%;">
                            <tr>
                                <td>
                                    <asp:RadioButton ID="RadioButton1" runat="server" GroupName="groupType" Text="Batch Vs. Me" AccessKey="1" AutoPostBack="True" OnCheckedChanged="ActivateMultiViewIndex" /></td>

                            </tr>
                            <tr>
                                <td>
                                    <asp:RadioButton ID="RadioButton2" runat="server" GroupName="groupType" Text="Individual Vs. Me" AccessKey="2" AutoPostBack="True" OnCheckedChanged="ActivateMultiViewIndex" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:RadioButton ID="RadioButton3" runat="server" GroupName="groupType" Text="Other" AccessKey="3" AutoPostBack="True" OnCheckedChanged="ActivateMultiViewIndex" />
                                </td>

                            </tr>
                        </table>
                    </div>
                </div>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">Comparison Type</h3>
                    </div>
                    <div class="panel-body">
                        <table style="width: 100%;">
                            <tr>
                                <td>
                                    <asp:RadioButton ID="RadioButton4" runat="server" GroupName="level" Text="Module Level" AccessKey="4" AutoPostBack="True" OnCheckedChanged="ActivateMultiViewIndex" /></td>

                            </tr>
                            <tr>
                                <td>
                                    <asp:RadioButton ID="RadioButton5" runat="server" GroupName="level" Text="Semester Level" AccessKey="5" AutoPostBack="True" OnCheckedChanged="ActivateMultiViewIndex" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:RadioButton ID="RadioButton6" runat="server" GroupName="level" Text="Overrall" AccessKey="6" AutoPostBack="True" OnCheckedChanged="ActivateMultiViewIndex" />
                                </td>

                            </tr>
                        </table>
                    </div>
                </div>
            </asp:Panel>







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
                            <td>
                                <asp:Label ID="Label9" runat="server" Text="Select Module"></asp:Label>
                            </td>
                            <td>

                                <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="SqlDataSource10" DataTextField="name" DataValueField="moduleCode" AppendDataBoundItems="true" OnSelectedIndexChanged="DropDownList6_SelectedIndexChanged" AutoPostBack="True">
                                    <asp:ListItem Text="--Select Module--" Value="-1">

                                    </asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT DISTINCT Module.moduleCode, Module.name FROM Enrollment INNER JOIN Module ON Enrollment.moduleCode = Module.moduleCode WHERE (Enrollment.userID = @userID)">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="userID" SessionField="userID" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">


                                <asp:Label ID="Label10" runat="server"></asp:Label>


                            </td>

                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" OnRowDataBound="GridView3_RowDataBound" Style="margin-right: 0px" CssClass="table-condensed  table-striped  detailsView">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Category">
                                            <ItemTemplate>
                                                <asp:Label ID="Label11" runat="server" Text='<%# Eval("Result Group") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Result">
                                            <ItemTemplate>
                                                <asp:Label ID="Label12" runat="server" Text='<%# Eval("Result") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="GPA">
                                            <ItemTemplate>
                                                <asp:Label ID="Label13" runat="server" Text='<%# Eval("GPA") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </td>

                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Chart ID="Chart3" runat="server" OnPrePaint="Chart3_PrePaint">
                                    <Series>
                                        <asp:Series Name="Series1">
                                        </asp:Series>
                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="ChartArea1">
                                        </asp:ChartArea>
                                    </ChartAreas>
                                </asp:Chart>
                                <br />
                            </td>

                        </tr>
                    </table>
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <br />
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text="Select Student"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownList1" AppendDataBoundItems="True" runat="server" DataSourceID="SqlDataSource1" DataTextField="indexNo" DataValueField="userID" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
                                    <asp:ListItem Text="--Select Student--" Value="-1"></asp:ListItem>

                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT Member.userName, Student.indexNo, Member.userID FROM Member INNER JOIN Student ON Member.userID = Student.userID
                                                                                                                         where Member.userID!=@userID AND
                                                                                                                         student.courseID=@courseID">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="userID" SessionField="userID" />
                                        <asp:SessionParameter Name="courseID" SessionField="courseID" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label3" runat="server" Text="Select Module"></asp:Label>
                            </td>
                            <td>

                                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" AppendDataBoundItems="True" DataTextField="name" DataValueField="moduleCode" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="True">
                                    <asp:ListItem Text="--Select Module--" Value="-1"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT DISTINCT Module.name, Module.moduleCode FROM Student INNER JOIN Enrollment ON Student.userID = Enrollment.userID INNER JOIN Module ON Enrollment.moduleCode = Module.moduleCode WHERE (Enrollment.userID = @userID)">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="userID" SessionField="userID" />
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
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" OnRowDataBound="GridView1_RowDataBound">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Student" SortExpression="indexNo">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("indexNo") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("indexNo") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="result" HeaderText="Result" SortExpression="result" />
                                        <asp:TemplateField HeaderText="GPA" SortExpression="GPA">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("GPA") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("GPA") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle />
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT Student.indexNo, Enrollment.result, ResultMapping.GPA FROM Student INNER JOIN Enrollment ON Student.userID = Enrollment.userID INNER JOIN ResultMapping ON Enrollment.result = ResultMapping.result WHERE (Enrollment.moduleCode = @moduleCode) AND (Student.userID = @student1 OR Student.userID = @student2)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DropDownList2" Name="moduleCode" PropertyName="SelectedValue" />
                                        <asp:SessionParameter Name="student1" SessionField="userID" />
                                        <asp:ControlParameter ControlID="DropDownList1" Name="student2" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>

                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource4" Palette="Bright" OnPostPaint="Chart1_PostPaint" OnPrePaint="Chart1_PrePaint" OnPreRender="Chart1_PreRender">
                                    <Series>
                                        <asp:Series Name="Series1" XValueMember="indexNo" YValueMembers="GPA"></asp:Series>
                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                    </ChartAreas>
                                </asp:Chart>
                                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT Student.indexNo, ResultMapping.GPA FROM Student INNER JOIN Enrollment ON Student.userID = Enrollment.userID INNER JOIN ResultMapping ON Enrollment.result = ResultMapping.result
where Enrollment.moduleCode=@moduleCode and (Student.userID=@student1 or Student.userID=@student2) 

">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DropDownList2" Name="moduleCode" PropertyName="SelectedValue" />
                                        <asp:SessionParameter Name="student1" SessionField="userID" />
                                        <asp:ControlParameter ControlID="DropDownList1" Name="student2" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <br />
                            </td>

                        </tr>
                    </table>
                    <br />
                </asp:View>
                <asp:View ID="View3" runat="server">
                    <table style="width: 100%;">
                        <tr>
                            <td style="height: 59px">
                                <asp:Label ID="Label4" runat="server" Text="Select First Student"></asp:Label>
                            </td>
                            <td style="height: 59px">
                                <asp:DropDownList ID="DropDownList3" AppendDataBoundItems="True" runat="server" DataSourceID="SqlDataSource5" DataTextField="indexNo" DataValueField="userID" AutoPostBack="True" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
                                    <asp:ListItem Text="--Select Student--" Value="-1"></asp:ListItem>

                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT Member.userName, Student.indexNo, Member.userID FROM Member INNER JOIN Student ON Member.userID = Student.userID
                                                                                                                         where Member.userID!=@userID AND
                                                                                                                         student.courseID=@courseID">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="userID" SessionField="userID" />
                                        <asp:SessionParameter Name="courseID" SessionField="courseID" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label7" runat="server" Text="Select Second Student"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownList5" AppendDataBoundItems="True" runat="server" DataSourceID="SqlDataSource9" DataTextField="indexNo" DataValueField="userID" AutoPostBack="True" OnSelectedIndexChanged="DropDownList5_SelectedIndexChanged">
                                    <asp:ListItem Text="--Select Student--" Value="-1"></asp:ListItem>

                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT Member.userName, Student.indexNo, Member.userID FROM Member INNER JOIN Student ON Member.userID = Student.userID
where (Member.userID!=@userID AND  Member.userID!=@student2) AND
                                                                                                                         student.courseID=@courseID">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="userID" SessionField="userID" />
                                        <asp:ControlParameter ControlID="DropDownList3" Name="student2" PropertyName="SelectedValue" />
                                        <asp:SessionParameter Name="courseID" SessionField="courseID" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label5" runat="server" Text="Select Module"></asp:Label>
                            </td>
                            <td>

                                <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource6" AppendDataBoundItems="True" DataTextField="name" DataValueField="moduleCode" OnSelectedIndexChanged="DropDownList4_SelectedIndexChanged" AutoPostBack="True">
                                    <asp:ListItem Text="--Select Module--" Value="-1"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT DISTINCT Module.name, Module.moduleCode FROM Student INNER JOIN Enrollment ON Student.userID = Enrollment.userID INNER JOIN Module ON Enrollment.moduleCode = Module.moduleCode WHERE (Enrollment.userID = @student1ID)
intersect
SELECT DISTINCT Module.name, Module.moduleCode FROM Student INNER JOIN Enrollment ON Student.userID = Enrollment.userID INNER JOIN Module ON Enrollment.moduleCode = Module.moduleCode WHERE (Enrollment.userID = @student2ID)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DropDownList3" Name="student1ID" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="DropDownList5" Name="student2ID" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">


                                <asp:Label ID="Label6" runat="server"></asp:Label>


                            </td>

                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:GridView ID="GridView2" runat="server" DataSourceID="SqlDataSource7" OnRowDataBound="GridView2_RowDataBound" AutoGenerateColumns="False">
                                    <Columns>
                                        <asp:BoundField DataField="indexNo" HeaderText="indexNo" SortExpression="indexNo" />
                                        <asp:BoundField DataField="result" HeaderText="result" SortExpression="result" />
                                        <asp:TemplateField HeaderText="GPA" SortExpression="GPA">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("GPA") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("GPA") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <br />
                                <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT Student.indexNo, Enrollment.result, ResultMapping.GPA FROM Student INNER JOIN Enrollment ON Student.userID = Enrollment.userID INNER JOIN ResultMapping ON Enrollment.result = ResultMapping.result WHERE (Enrollment.moduleCode = @moduleCode) AND (Student.userID = @student1 OR Student.userID = @student2)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DropDownList4" Name="moduleCode" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="DropDownList3" Name="student1" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="DropDownList5" Name="student2" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>

                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource8" Palette="Bright" OnPrePaint="Chart2_PrePaint">
                                    <Series>
                                        <asp:Series Name="Series1" XValueMember="indexNo" YValueMembers="GPA"></asp:Series>
                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                    </ChartAreas>
                                </asp:Chart>
                                <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT Student.indexNo, ResultMapping.GPA FROM Student INNER JOIN Enrollment ON Student.userID = Enrollment.userID INNER JOIN ResultMapping ON Enrollment.result = ResultMapping.result
where Enrollment.moduleCode=@moduleCode and (Student.userID=@student1 or Student.userID=@student2) 

">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DropDownList4" Name="moduleCode" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="DropDownList3" Name="student1" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="DropDownList5" Name="student2" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <br />
                            </td>

                        </tr>
                    </table>


                </asp:View>
                <asp:View ID="View4" runat="server">
                    <table style="width: 100%;">

                        <tr>
                            <td>
                                <asp:Label ID="Label8" runat="server" Text="Select Semester"></asp:Label>
                            </td>
                            <td>

                                <asp:DropDownList ID="DropDownList7" runat="server" DataSourceID="SqlDataSource12" AppendDataBoundItems="True" DataTextField="semester" DataValueField="semesterID" AutoPostBack="True" OnSelectedIndexChanged="DropDownList7_SelectedIndexChanged">
                                    <asp:ListItem Text="--Select Semester--" Value="-1"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT distinct semesterID, (cast(semesterNumber as nvarchar(10))+' Semester') as semester FROM AcedamicInfo WHERE (courseID =@courseID)">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="courseID" SessionField="courseID" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">


                                <asp:Label ID="Label14" runat="server"></asp:Label>


                            </td>

                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource13" OnRowDataBound="GridView4_RowDataBound">
                                    <Columns>
                                        <asp:BoundField DataField="moduleCode" HeaderText="Module Code" />
                                        <asp:BoundField DataField="name" HeaderText="Module" />
                                        <asp:BoundField DataField="myResult" HeaderText="My Result" />
                                        <asp:TemplateField HeaderText="Batch Result">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="My GPA">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("myGPA") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Batch GPA">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("batchResult") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <br />
                                <asp:SqlDataSource ID="SqlDataSource13" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="spGetSemesterResultsBatchVsMe" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DropDownList7" Name="semesterID" PropertyName="SelectedValue" Type="Int32" />
                                        <asp:SessionParameter Name="courseID" SessionField="courseID" Type="Int32" />
                                        <asp:SessionParameter Name="userID" SessionField="userID" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                            <td>
                                <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" OnRowDataBound="GridView5_RowDataBound">
                                    <Columns>
                                        <asp:BoundField DataField="name" />
                                        <asp:TemplateField HeaderText="SGPA">
                                            <ItemTemplate>
                                                <asp:Label ID="Label18" runat="server" Text='<%# Eval("SGPA") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="getSGPABatchVsMe" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DropDownList7" Name="semesterID" PropertyName="SelectedValue" Type="Int32" />
                                        <asp:SessionParameter Name="courseID" SessionField="courseID" Type="Int32" />
                                        <asp:SessionParameter Name="userID" SessionField="userID" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>

                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Chart ID="Chart4" runat="server" DataSourceID="SqlDataSource13" OnLoad="Chart4_Load" OnDataBound="Chart4_DataBound" OnPostPaint="Chart4_PostPaint">
                                    <Series>
                                        <asp:Series Name="Series1" BorderWidth="3" IsValueShownAsLabel="true" ChartType="Line" XValueMember="moduleCode" YValueMembers="myGPA">
                                        </asp:Series>
                                    </Series>

                                    <Series>
                                        <asp:Series Name="Series2" BorderWidth="3" IsValueShownAsLabel="true" ChartType="Line" XValueMember="moduleCode" YValueMembers="batchResult">
                                        </asp:Series>
                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="ChartArea1">
                                        </asp:ChartArea>
                                    </ChartAreas>
                                </asp:Chart>
                                <br />

                                <br />
                            </td>

                        </tr>
                        <tr>
                            <td colspan="2">

                                <asp:Label ID="Label16" Visible="false" runat="server" Text="Me"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
                              
                                <asp:Label ID="Label17" Visible="false" runat="server" Text="Batch"></asp:Label>

                            </td>

                        </tr>
                        <tr>
                            <td colspan="2">


                                <asp:Label ID="Label15" runat="server"></asp:Label>


                            </td>

                        </tr>
                        <tr>
                            <td colspan="2">&nbsp;</td>

                        </tr>
                        <tr>
                            <td colspan="2">
                                <br />
                            </td>

                        </tr>
                    </table>

                </asp:View>
                <asp:View ID="View5" runat="server">
                    <table style="width: 100%;">

                        <tr>
                            <td>
                                <asp:Label ID="Label19" runat="server" Text="Select Semester"></asp:Label>
                            </td>
                            <td>

                                <asp:DropDownList ID="DropDownList8" AppendDataBoundItems="true" runat="server" DataSourceID="SqlDataSource17" DataTextField="semester" DataValueField="semesterID" AutoPostBack="True" OnSelectedIndexChanged="DropDownList8_SelectedIndexChanged">
                                    <asp:ListItem Text="--Select Semester--" Value="-1"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource17" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT distinct semesterID, (cast(semesterNumber as nvarchar(10))+' Semester') as semester FROM AcedamicInfo WHERE (courseID =@courseID)">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="courseID" SessionField="courseID" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

                                <br />

                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label24" runat="server" Text="Select Student"></asp:Label>
                            </td>
                            <td>

                                <asp:DropDownList ID="DropDownList9" AppendDataBoundItems="true" runat="server" DataSourceID="SqlDataSource18" DataTextField="indexNo" DataValueField="userID" AutoPostBack="True" OnSelectedIndexChanged="DropDownList9_SelectedIndexChanged">
                                    <asp:ListItem Text="--Select Student--" Value="-1"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource18" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT Member.userName, Student.indexNo, Member.userID FROM Member INNER JOIN Student ON Member.userID = Student.userID
                                                                                                                         where Member.userID!=@userID AND
                                                                                                                         student.courseID=@courseID">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="userID" SessionField="userID" />
                                        <asp:SessionParameter Name="courseID" SessionField="courseID" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

                                <br />

                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">


                                <asp:Label ID="Label20" runat="server"></asp:Label>


                            </td>

                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False" OnRowDataBound="GridView6_RowDataBound">
                                    <Columns>
                                        <asp:BoundField DataField="moduleCode" HeaderText="Module Code" />
                                        <asp:BoundField DataField="name" HeaderText="Name" />
                                        <asp:BoundField DataField="myResult" HeaderText="My Result" />
                                        <asp:TemplateField HeaderText="studentResult">
                                            <ItemTemplate>
                                                <asp:Label ID="Label25" runat="server" Text='<%# Eval("studentResult") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="My GPA">
                                            <ItemTemplate>
                                                <asp:Label ID="Label26" runat="server" Text='<%# Eval("myGPA") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="studentGPA">
                                            <ItemTemplate>
                                                <asp:Label ID="Label27" runat="server" Text='<%# Eval("studentGPA") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource19" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="spGetSemesterResultsStudentVsMe" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DropDownList8" Name="semesterID" PropertyName="SelectedValue" Type="Int32" />
                                        <asp:SessionParameter Name="courseID" SessionField="courseID" Type="Int32" />
                                        <asp:SessionParameter Name="userID" SessionField="userID" Type="Int32" />
                                        <asp:ControlParameter ControlID="DropDownList9" Name="studentID" PropertyName="SelectedValue" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <br />
                            </td>
                            <td>
                                <asp:GridView ID="GridView7" runat="server" AutoGenerateColumns="False" OnRowDataBound="GridView7_RowDataBound">
                                    <Columns>
                                        <asp:BoundField DataField="name" HeaderText="Student" />
                                        <asp:TemplateField HeaderText="SGPA">
                                            <ItemTemplate>
                                                <asp:Label ID="Label28" runat="server" Text='<%# Eval("SGPA") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource20" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="getSGPAStudentVsMe" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DropDownList8" Name="semesterID" PropertyName="SelectedValue" Type="Int32" />
                                        <asp:SessionParameter Name="courseID" SessionField="courseID" Type="Int32" />
                                        <asp:SessionParameter Name="userID" SessionField="userID" Type="Int32" />
                                        <asp:ControlParameter ControlID="DropDownList9" Name="studentID" PropertyName="SelectedValue" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>

                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Chart ID="Chart6" runat="server" OnLoad="Chart6_Load" OnPostPaint="Chart6_PostPaint" OnDataBound="Chart6_DataBound">
                                    <Series>
                                        <asp:Series Name="Series1" BorderWidth="3" IsValueShownAsLabel="True" ChartType="Line" ChartArea="ChartArea1" XValueMember="moduleCode" YValueMembers="myGPA">
                                        </asp:Series>
                                        <asp:Series BorderWidth="3" ChartArea="ChartArea1" ChartType="Line" IsValueShownAsLabel="True" Name="Series2" XValueMember="moduleCode" YValueMembers="studentGPA">
                                        </asp:Series>
                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="ChartArea1">
                                        </asp:ChartArea>
                                    </ChartAreas>
                                </asp:Chart>
                                <br />

                                <br />
                            </td>

                        </tr>
                        <tr>
                            <td colspan="2">

                                <asp:Label ID="Label21" Visible="false" runat="server" Text="Me"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
                              
                                <asp:Label ID="Label22" Visible="False" runat="server"></asp:Label>

                            </td>

                        </tr>


                    </table>
                </asp:View>
                <asp:View ID="View6" runat="server">
                    <table style="width: 100%;">

                        <tr>
                            <td>
                                <asp:Label ID="Label23" runat="server" Text="Select Semester"></asp:Label>
                            </td>
                            <td>

                                <asp:SqlDataSource ID="SqlDataSource14" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT distinct semesterID, (cast(semesterNumber as nvarchar(10))+' Semester') as semester FROM AcedamicInfo WHERE (courseID =@courseID)">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="courseID" SessionField="courseID" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

                                <asp:DropDownList ID="DropDownList12" AppendDataBoundItems="true" runat="server" DataSourceID="SqlDataSource14" DataTextField="semester" DataValueField="semesterID" AutoPostBack="True" OnSelectedIndexChanged="DropDownList12_SelectedIndexChanged">
                                    <asp:ListItem Text="--Select Semester--" Value="-1"></asp:ListItem>
                                </asp:DropDownList>

                                <br />

                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label29" runat="server" Text="Select First Student"></asp:Label>
                            </td>
                            <td>

                                <asp:SqlDataSource ID="SqlDataSource15" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT Member.userName, Student.indexNo, Member.userID FROM Member INNER JOIN Student ON Member.userID = Student.userID
                                                                                                                         where Member.userID!=@userID AND
                                                                                                                         student.courseID=@courseID">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="userID" SessionField="userID" />
                                        <asp:SessionParameter Name="courseID" SessionField="courseID" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

                                <asp:DropDownList ID="DropDownList13" runat="server" AppendDataBoundItems="true" DataSourceID="SqlDataSource15" DataTextField="indexNo" DataValueField="userID" OnSelectedIndexChanged="DropDownList13_SelectedIndexChanged" AutoPostBack="True">
                                    <asp:ListItem Text="--Select First Student--" Value="-1"></asp:ListItem>
                                </asp:DropDownList>

                                <br />

                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label33" runat="server" Text="Select Second Student"></asp:Label>
                            </td>
                            <td>

                                <asp:SqlDataSource ID="SqlDataSource22" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT Member.userName, Student.indexNo, Member.userID FROM Member INNER JOIN Student ON Member.userID = Student.userID
                                                                                                                         where Member.userID!=@userID AND
Member.userID!=@student1  AND
                                                                                                                         student.courseID=@courseID">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="userID" SessionField="userID" />
                                        <asp:ControlParameter ControlID="DropDownList13" Name="student1" PropertyName="SelectedValue" />
                                        <asp:SessionParameter Name="courseID" SessionField="courseID" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

                                <asp:DropDownList ID="DropDownList14" AppendDataBoundItems="True" runat="server" DataSourceID="SqlDataSource22" DataTextField="indexNo" DataValueField="userID" AutoPostBack="True" OnSelectedIndexChanged="DropDownList14_SelectedIndexChanged">
                                    <asp:ListItem Text="--Select Second Student--" Value="-1"></asp:ListItem>
                                </asp:DropDownList>

                                <br />

                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">


                                <asp:Label ID="Label30" runat="server"></asp:Label>


                            </td>

                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="GridView8" runat="server" AutoGenerateColumns="False" OnRowDataBound="GridView8_RowDataBound">
                                    <Columns>
                                        <asp:BoundField DataField="moduleCode" HeaderText="Module Code" />
                                        <asp:BoundField DataField="name" HeaderText="Name" />
                                        <asp:TemplateField HeaderText="My Result">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("myResult") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("myResult") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="studentResult">
                                            <ItemTemplate>
                                                <asp:Label ID="Label25" runat="server" Text='<%# Eval("studentResult") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="My GPA">
                                            <ItemTemplate>
                                                <asp:Label ID="Label26" runat="server" Text='<%# Eval("myGPA") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="studentGPA">
                                            <ItemTemplate>
                                                <asp:Label ID="Label27" runat="server" Text='<%# Eval("studentGPA") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource16" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="spGetSemesterResultsStudentVsMe" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DropDownList12" Name="semesterID" PropertyName="SelectedValue" Type="Int32" />
                                        <asp:SessionParameter Name="courseID" SessionField="courseID" Type="Int32" />
                                        <asp:ControlParameter ControlID="DropDownList13" Name="userID" PropertyName="SelectedValue" Type="Int32" />
                                        <asp:ControlParameter ControlID="DropDownList14" Name="studentID" PropertyName="SelectedValue" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <br />
                            </td>
                            <td>
                                <asp:GridView ID="GridView9" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource21">
                                    <Columns>
                                        <asp:BoundField DataField="name" HeaderText="Student" />
                                        <asp:TemplateField HeaderText="SGPA">
                                            <ItemTemplate>
                                                <asp:Label ID="Label28" runat="server" Text='<%# Eval("SGPA") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource21" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="getSGPAStudentVsStudent" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DropDownList12" Name="semesterID" PropertyName="SelectedValue" Type="Int32" />
                                        <asp:SessionParameter Name="courseID" SessionField="courseID" Type="Int32" />
                                        <asp:ControlParameter ControlID="DropDownList13" Name="userID" PropertyName="SelectedValue" Type="Int32" />
                                        <asp:ControlParameter ControlID="DropDownList14" Name="studentID" PropertyName="SelectedValue" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>

                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Chart ID="Chart5" runat="server" OnLoad="Chart5_Load" OnPostPaint="Chart5_PostPaint">
                                    <Series>
                                        <asp:Series Name="Series1" BorderWidth="3" IsValueShownAsLabel="True" ChartType="Line" ChartArea="ChartArea1" XValueMember="moduleCode" YValueMembers="myGPA">
                                        </asp:Series>
                                        <asp:Series BorderWidth="3" ChartArea="ChartArea1" ChartType="Line" IsValueShownAsLabel="True" Name="Series2" XValueMember="moduleCode" YValueMembers="studentGPA">
                                        </asp:Series>
                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="ChartArea1">
                                        </asp:ChartArea>
                                    </ChartAreas>
                                </asp:Chart>
                                <br />

                                <br />
                            </td>

                        </tr>
                        <tr>
                            <td colspan="2">

                                <asp:Label ID="Label31" Visible="False" runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
                              
                                <asp:Label ID="Label32" Visible="False" runat="server"></asp:Label>

                            </td>

                        </tr>


                    </table>
                </asp:View>
                <asp:View ID="View7" runat="server">



                    <table style="width: 100%;">
                        <tr>
                            <td>
                                <asp:Label ID="Label34" runat="server" Text="Batch Vs Me Overrall Comparison"></asp:Label>
                            </td>

                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="GridView10" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource23" OnRowDataBound="GridView10_RowDataBound">
                                    <Columns>
                                        <asp:BoundField DataField="name" />
                                        <asp:TemplateField HeaderText="GPA">
                                            <ItemTemplate>
                                                <asp:Label ID="Label35" runat="server" Text='<%# Eval("overallGPA") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Expected Class">
                                            <ItemTemplate>
                                                <asp:Label ID="Label36" runat="server" Text="Label"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <br />
                                <asp:SqlDataSource ID="SqlDataSource23" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="spGetOverallGPABatchVsMe" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="courseID" SessionField="courseID" Type="Int32" />
                                        <asp:SessionParameter Name="userID" SessionField="userID" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>

                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="GridView11" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource24" OnRowDataBound="GridView11_RowDataBound">
                                    <Columns>
                                        <asp:BoundField DataField="semester" HeaderText="semester" />
                                        <asp:TemplateField HeaderText="My SGPA">
                                            <ItemTemplate>
                                                <asp:Label ID="Label37" runat="server" Text='<%# Eval("mySGPA") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Batch SGPA">
                                            <ItemTemplate>
                                                <asp:Label ID="Label38" runat="server" Text='<%# Eval("batchSGPA") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource24" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="spGetOverallResultsBatchVsMe" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="courseID" SessionField="courseID" Type="Int32" />
                                        <asp:SessionParameter Name="userID" SessionField="userID" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>

                        </tr>
                        <tr>
                            <td>
                                <asp:Chart ID="Chart7" runat="server" DataSourceID="SqlDataSource24" OnLoad="Chart7_Load" OnPostPaint="Chart7_PostPaint" OnPrePaint="Chart7_PrePaint">
                                    <Series>
                                        <asp:Series ChartType="Line" Name="Series1" BorderWidth="3" IsValueShownAsLabel="True" XValueMember="semester" YValueMembers="mySGPA">
                                        </asp:Series>
                                        <asp:Series ChartType="Line" Name="Series2" BorderWidth="3" IsValueShownAsLabel="True" XValueMember="semester" YValueMembers="batchSGPA">
                                        </asp:Series>

                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="ChartArea1">
                                        </asp:ChartArea>
                                    </ChartAreas>
                                </asp:Chart>
                            </td>

                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label39" runat="server" Text="Me"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Label ID="Label40" runat="server" Text="Batch"></asp:Label>
                            </td>

                        </tr>
                    </table>



                </asp:View>
                <asp:View ID="View8" runat="server">
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                <asp:Label ID="Label44" runat="server" Text="Select Student"></asp:Label>
                                <td>
                                    <asp:DropDownList ID="DropDownList15" runat="server" AppendDataBoundItems="true" DataSourceID="SqlDataSource28" DataTextField="indexNo" DataValueField="userID" AutoPostBack="True" OnSelectedIndexChanged="DropDownList15_SelectedIndexChanged">
                                        <asp:ListItem Text="--Select Student--" Value="-1"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource28" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT Member.userName, Student.indexNo, Member.userID FROM Member INNER JOIN Student ON Member.userID = Student.userID
                                                                                                                         where Member.userID!=@userID AND
                                                                                                                         student.courseID=@courseID">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="userID" SessionField="userID" />
                                            <asp:SessionParameter Name="courseID" SessionField="courseID" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                                <td></td>


                            </td>

                        </tr>
                        <tr>
                            <td colspan="2" style="height: 23px">
                                <asp:Label ID="Label41" runat="server"></asp:Label>
                            </td>

                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:GridView ID="GridView12" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource25" OnRowDataBound="GridView12_RowDataBound">
                                    <Columns>
                                        <asp:BoundField DataField="name" />
                                        <asp:TemplateField HeaderText="GPA">
                                            <ItemTemplate>
                                                <asp:Label ID="Label35" runat="server" Text='<%# Eval("overallGPA") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Expected Class">
                                            <ItemTemplate>
                                                <asp:Label ID="Label36" runat="server" Text="Label"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <br />
                                <asp:SqlDataSource ID="SqlDataSource25" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="spGetOverallGPAStudentVsMe" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="courseID" SessionField="courseID" Type="Int32" />
                                        <asp:SessionParameter Name="userID" SessionField="userID" Type="Int32" />
                                        <asp:ControlParameter ControlID="DropDownList15" Name="studentID" PropertyName="SelectedValue" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>

                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:GridView ID="GridView13" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource26" OnRowDataBound="GridView13_RowDataBound">
                                    <Columns>
                                        <asp:BoundField DataField="semester" HeaderText="semester" />
                                        <asp:TemplateField HeaderText="Me">
                                            <ItemTemplate>
                                                <asp:Label ID="Label37" runat="server" Text='<%# Eval("mySGPA") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Batch SGPA">
                                            <ItemTemplate>
                                                <asp:Label ID="Label38" runat="server" Text='<%# Eval("studentSGPA") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource26" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="spGetOverallResultsStudentVsMe" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="courseID" SessionField="courseID" Type="Int32" />
                                        <asp:SessionParameter Name="userID" SessionField="userID" Type="Int32" />
                                        <asp:ControlParameter ControlID="DropDownList15" Name="studentID" PropertyName="SelectedValue" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>

                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Chart ID="Chart8" runat="server" DataSourceID="SqlDataSource26" OnLoad="Chart8_Load" OnPrePaint="Chart8_PrePaint">
                                    <Series>
                                        <asp:Series ChartType="Line" Name="Series1" BorderWidth="3" IsValueShownAsLabel="True" XValueMember="semester" YValueMembers="mySGPA">
                                        </asp:Series>
                                        <asp:Series ChartType="Line" Name="Series2" BorderWidth="3" IsValueShownAsLabel="True" XValueMember="semester" YValueMembers="studentSGPA">
                                        </asp:Series>

                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="ChartArea1">
                                        </asp:ChartArea>
                                    </ChartAreas>
                                </asp:Chart>
                            </td>

                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Label ID="Label42" runat="server" Text="Me"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Label ID="Label43" runat="server" Text="Batch"></asp:Label>
                            </td>

                        </tr>
                    </table>

                </asp:View>
                <asp:View ID="View9" runat="server">
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                <asp:Label ID="Label45" runat="server" Text="Select First Student"></asp:Label>
                                <td>
                                    <asp:DropDownList ID="DropDownList10" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource27" DataTextField="indexNo" DataValueField="userID" AutoPostBack="True" OnSelectedIndexChanged="DropDownList10_SelectedIndexChanged">
                                        <asp:ListItem Text="--Select Student--" Value="-1"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource27" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT Member.userName, Student.indexNo, Member.userID FROM Member INNER JOIN Student ON Member.userID = Student.userID
                                                                                                                         where Member.userID!=@userID AND
                                                                                                                         student.courseID=@courseID">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="userID" SessionField="userID" />
                                            <asp:SessionParameter Name="courseID" SessionField="courseID" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>



                            </td>

                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label49" runat="server" Text="Select Second Student"></asp:Label>
                                <td>
                                    <asp:DropDownList ID="DropDownList11" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource27" DataTextField="indexNo" DataValueField="userID" AutoPostBack="True" OnSelectedIndexChanged="DropDownList11_SelectedIndexChanged">
                                        <asp:ListItem Text="--Select Student--" Value="-1"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>



                            </td>

                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Label ID="Label46" runat="server"></asp:Label>
                            </td>

                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:GridView ID="GridView14" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource29" OnRowDataBound="GridView14_RowDataBound">
                                    <Columns>
                                        <asp:BoundField DataField="name" />
                                        <asp:TemplateField HeaderText="GPA">
                                            <ItemTemplate>
                                                <asp:Label ID="Label35" runat="server" Text='<%# Eval("overallGPA") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Expected Class">
                                            <ItemTemplate>
                                                <asp:Label ID="Label36" runat="server" Text="Label"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <br />
                                <asp:SqlDataSource ID="SqlDataSource29" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="spGetOverallGPAStudentVsStudent" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="courseID" SessionField="courseID" Type="Int32" />
                                        <asp:ControlParameter ControlID="DropDownList10" Name="userID" PropertyName="SelectedValue" Type="Int32" />
                                        <asp:ControlParameter ControlID="DropDownList11" Name="studentID" PropertyName="SelectedValue" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>

                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:GridView ID="GridView15" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource30" OnRowDataBound="GridView15_RowDataBound">
                                    <Columns>
                                        <asp:BoundField DataField="semester" HeaderText="semester" />
                                        <asp:TemplateField HeaderText="Me">
                                            <ItemTemplate>
                                                <asp:Label ID="Label37" runat="server" Text='<%# Eval("mySGPA") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Batch SGPA">
                                            <ItemTemplate>
                                                <asp:Label ID="Label38" runat="server" Text='<%# Eval("studentSGPA") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource30" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="spGetOverallResultsStudentVsMe" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="courseID" SessionField="courseID" Type="Int32" />
                                        <asp:ControlParameter ControlID="DropDownList10" Name="userID" PropertyName="SelectedValue" Type="Int32" />
                                        <asp:ControlParameter ControlID="DropDownList11" Name="studentID" PropertyName="SelectedValue" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>

                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Chart ID="Chart9" runat="server" DataSourceID="SqlDataSource30" Style="margin-right: 4px" Width="555px" OnLoad="Chart9_Load" OnPrePaint="Chart9_PrePaint">
                                    <Series>
                                        <asp:Series ChartType="Line" Name="Series1" BorderWidth="3" IsValueShownAsLabel="True" XValueMember="semester" YValueMembers="mySGPA">
                                        </asp:Series>
                                        <asp:Series ChartType="Line" Name="Series2" BorderWidth="3" IsValueShownAsLabel="True" XValueMember="semester" YValueMembers="studentSGPA">
                                        </asp:Series>

                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="ChartArea1">
                                        </asp:ChartArea>
                                    </ChartAreas>
                                </asp:Chart>
                            </td>

                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Label ID="Label47" runat="server" Text="Me"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Label ID="Label48" runat="server" Text="Batch"></asp:Label>
                            </td>

                        </tr>
                    </table>

                </asp:View>
                <asp:View ID="View10" runat="server">
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="Label50" runat="server" Text="Select Comparison Type and Comparison Group"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:View>

            </asp:MultiView>
        </ContentTemplate>

    </asp:UpdatePanel>
</asp:Content>
