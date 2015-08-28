<%@ Page Title="" Language="C#" MasterPageFile="~/PresentationLayer/Student/StudentMaster.Master" AutoEventWireup="true" CodeBehind="MyPerformance.aspx.cs" Inherits="PerformanceAnalyzer2.PresentationLayer.Student.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Panel ID="Panel1" runat="server">
                
                 <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">Comparison Type</h3>
                    </div>
                    <div class="panel-body">
                    <table style="width: 100%;">
                        
                        <tr>
                            <td>
                                <asp:RadioButton ID="RadioButton5" runat="server" GroupName="level" Text="Semester Level" AccessKey="5" AutoPostBack="True" OnCheckedChanged="ActivateMultiViewIndex"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:RadioButton ID="RadioButton6" runat="server" GroupName="level" Text="Overrall" AccessKey="6" AutoPostBack="True" OnCheckedChanged="ActivateMultiViewIndex"/>
                            </td>

                        </tr>
                    </table>


                    </div>
                </div>

            </asp:Panel>




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
                            <li><a href="../../PresentationLayer/Admin/ViewProfileView.aspx">View Profile</a></li>
                            <li><a href="../../PresentationLayer/Admin/EditProfileView.aspx">Edit Profile</a></li>

                        </ul>

                    </div>
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
                                        <asp:TemplateField HeaderText="My GPA">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("myGPA") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <br />
                                <asp:SqlDataSource ID="SqlDataSource13" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="spGetSemesterResultsMe" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DropDownList7" Name="semesterID" PropertyName="SelectedValue" Type="Int32" />
                                        <asp:SessionParameter Name="courseID" SessionField="courseID" Type="Int32" />
                                        <asp:SessionParameter Name="userID" SessionField="userID" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                            <td>
                                <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" OnRowDataBound="GridView5_RowDataBound" ShowHeader="False">
                                    <Columns>
                                        <asp:BoundField DataField="name" />
                                        <asp:TemplateField HeaderText="SGPA">
                                            <ItemTemplate>
                                                <asp:Label ID="Label18" runat="server" Text='<%# Eval("SGPA") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="getSGPAMe" SelectCommandType="StoredProcedure">
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
                
                <asp:View ID="View7" runat="server">



                    <table style="width: 100%;">
                        <tr>
                            <td>
                                <asp:Label ID="Label34" runat="server" Text="My Overall Performance"></asp:Label>
                            </td>

                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="GridView10" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource23" OnRowDataBound="GridView10_RowDataBound" ShowHeader="False">
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
                                <asp:SqlDataSource ID="SqlDataSource23" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="spGetOverallGPAMe" SelectCommandType="StoredProcedure">
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
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource24" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="spGetOverallResultsMe" SelectCommandType="StoredProcedure">
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
                
                <asp:View ID="View10" runat="server">
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="Label50" runat="server" Text="Select category"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:View>

            </asp:MultiView>
        </ContentTemplate>

    </asp:UpdatePanel>
</asp:Content>
