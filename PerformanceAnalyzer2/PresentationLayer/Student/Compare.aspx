<%@ Page Title="" Language="C#" MasterPageFile="~/PresentationLayer/Student/StudentMaster.Master" AutoEventWireup="true" CodeBehind="Compare.aspx.cs" Inherits="PerformanceAnalyzer2.PresentationLayer.Student.WebForm4" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Panel ID="Panel1" runat="server">
                <asp:Panel ID="Panel2" runat="server" GroupingText="Comparison Group">

                    <table style="width: 100%;">
                        <tr>
                            <td>
                                <asp:RadioButton ID="RadioButton1" runat="server" GroupName="groupType" Text="Batch Vs. Me" Checked="True" /></td>

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
                                <asp:RadioButton ID="RadioButton4" runat="server" GroupName="level" Text="Module Level" Checked="True" /></td>

                        </tr>
                        <tr>
                            <td>
                                <asp:RadioButton ID="RadioButton5" runat="server" GroupName="level" Text="Semester Level" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:RadioButton ID="RadioButton6" runat="server" GroupName="level" Text="Overrall" />
                            </td>

                        </tr>
                    </table>
                </asp:Panel>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="View1" runat="server">
                    <br />
                    <br />
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
                                            <ItemStyle  />
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
                                <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource4" Palette="Bright" OnPostPaint="Chart1_PostPaint" OnPrePaint="Chart1_PrePaint" OnPreRender="Chart1_PreRender"><series><asp:Series Name="Series1" XValueMember="indexNo" YValueMembers="GPA"></asp:Series></series><chartareas><asp:ChartArea Name="ChartArea1"></asp:ChartArea></chartareas></asp:Chart>
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
                                <asp:DropDownList ID="DropDownList3" AppendDataBoundItems="True" runat="server" DataSourceID="SqlDataSource5" DataTextField="indexNo" DataValueField="userID"  AutoPostBack="True" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
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
                                <asp:DropDownList ID="DropDownList5" AppendDataBoundItems="True" runat="server" DataSourceID="SqlDataSource9" DataTextField="indexNo" DataValueField="userID"  AutoPostBack="True" OnSelectedIndexChanged="DropDownList5_SelectedIndexChanged">
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

                                <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource6" AppendDataBoundItems="True" DataTextField="name" DataValueField="moduleCode" OnSelectedIndexChanged="DropDownList4_SelectedIndexChanged" AutoPostBack="True" Height="4px">
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
                                <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource8" Palette="Bright"  OnPrePaint="Chart2_PrePaint"><series><asp:Series Name="Series1" XValueMember="indexNo" YValueMembers="GPA"></asp:Series></series><chartareas><asp:ChartArea Name="ChartArea1"></asp:ChartArea></chartareas></asp:Chart>
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
            </asp:MultiView>
        </ContentTemplate>

    </asp:UpdatePanel>
</asp:Content>
