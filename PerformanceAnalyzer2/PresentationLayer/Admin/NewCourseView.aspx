<%@ Page Title="" Language="C#" MasterPageFile="~/PresentationLayer/Admin/CourseAminMaster.Master" AutoEventWireup="true" CodeBehind="NewCourseView.aspx.cs" Inherits="PerformanceAnalyzer2.PresentationLayer.Admin.WebForm3" %>

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

            <asp:Menu ID="Menu1" runat="server" StaticMenuStyle-Width="100%" StaticMenuStyle-CssClass="nav navbar-nav" class="navbar-collapse collapse sidebar-navbar-collapse">
                <Items>
                    <asp:MenuItem Text="Step1: Basic Info " NavigateUrl="NewCourseView.aspx?activeView=0"></asp:MenuItem>
                    <asp:MenuItem Text="Step2: Acedemic Info&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" NavigateUrl="NewCourseView.aspx?activeView=1"></asp:MenuItem>
                    <asp:MenuItem Text="Step3: Student Info" NavigateUrl="NewCourseView.aspx?activeView=2"></asp:MenuItem>
                    <asp:MenuItem Text="Step4: Finish" NavigateUrl="NewCourseView.aspx?activeView=3"></asp:MenuItem>

                </Items>


            </asp:Menu>


        </div>

    </div>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateInsertButton="True" AutoGenerateRows="False" DataKeyNames="courseID" DefaultMode="Insert" OnItemInserting="DetailsView1_ItemInserting" OnItemInserted="DetailsView1_ItemInserted" CssClass="table-condensed  table-striped  detailsView" HeaderText="Basic Details" GridLines="Horizontal" HorizontalAlign="Center">
                <Fields>
                    <asp:TemplateField HeaderText="Course name">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1" ErrorMessage="*Required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Batch">
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList7" runat="server">
                                <asp:ListItem Value="-1" Selected="true">--Select Year--</asp:ListItem>

                                <asp:ListItem>2009</asp:ListItem>
                                <asp:ListItem>2010</asp:ListItem>
                                <asp:ListItem>2011</asp:ListItem>
                                <asp:ListItem>2012</asp:ListItem>
                                <asp:ListItem>2013</asp:ListItem>
                                <asp:ListItem>2014</asp:ListItem>

                                <asp:ListItem>2015</asp:ListItem>
                                <asp:ListItem>2016</asp:ListItem>
                                <asp:ListItem>2017</asp:ListItem>
                                <asp:ListItem>2018</asp:ListItem>
                                <asp:ListItem></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DropDownList7" ErrorMessage="*Required" ForeColor="Red" InitialValue="-1" Display="Dynamic"></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server">
                                <asp:ListItem Value="-1" Selected="true">--Select Year--</asp:ListItem>

                                <asp:ListItem>2009</asp:ListItem>
                                <asp:ListItem>2010</asp:ListItem>
                                <asp:ListItem>2011</asp:ListItem>
                                <asp:ListItem>2012</asp:ListItem>
                                <asp:ListItem>2013</asp:ListItem>
                                <asp:ListItem>2014</asp:ListItem>

                                <asp:ListItem>2015</asp:ListItem>
                                <asp:ListItem>2016</asp:ListItem>
                                <asp:ListItem>2017</asp:ListItem>
                                <asp:ListItem>2018</asp:ListItem>
                                <asp:ListItem></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownList1" ErrorMessage="*Required" ForeColor="Red" InitialValue="-1"></asp:RequiredFieldValidator>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="University">
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList2" AppendDataBoundItems="true" runat="server" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="universityID" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" ToolTip="Select University">
                                <asp:ListItem Text="--Select University--" Value="-1"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DropDownList2" ErrorMessage="*Required" ForeColor="Red" InitialValue="-1" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT * FROM [University]"></asp:SqlDataSource>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="universityID" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" ToolTip="Select University">
                            </asp:DropDownList>

                            <br />
                            <br />
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT * FROM [University]"></asp:SqlDataSource>

                            <br />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Faculty ">
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList3" runat="server" AppendDataBoundItems="true" DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="facultyID" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged" ToolTip="Select Faculty">
                                <asp:ListItem Text="--Select Faculty--" Value="-1"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT * FROM [Faculty] "></asp:SqlDataSource>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DropDownList3" ErrorMessage="*Required" ForeColor="Red" InitialValue="-1" Display="Dynamic"></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>

                            <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="facultyID" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged" ToolTip="Select Faculty">
                            </asp:DropDownList>

                            <br />
                            <br />

                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT * FROM [Faculty] "></asp:SqlDataSource>

                            <br />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Department">
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList4" AppendDataBoundItems="true" runat="server" DataSourceID="SqlDataSource3" DataTextField="name" DataValueField="departmentID" ToolTip="Select Department">
                                <asp:ListItem Text="--Select Department--" Value="-1"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT * FROM [Department] "></asp:SqlDataSource>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="DropDownList4" ErrorMessage="*Required" ForeColor="Red" InitialValue="-1" Display="Dynamic"></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>

                            <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource3" DataTextField="name" DataValueField="departmentID" ToolTip="Select Department">
                            </asp:DropDownList>
                            <br />
                            <br />
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT * FROM [Department] "></asp:SqlDataSource>
                            <br />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Number of student">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("studentCount") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("studentCount") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="TextBox2" ValidationExpression="^[1-9]\d*$" ErrorMessage="*invalid" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("studentCount") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Number of acedemic years">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("yearCount") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("yearCount") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox3" ErrorMessage="*Invalid" Display="Dynamic" ForeColor="Red" ValidationExpression="^[1-9]\d*$"></asp:RegularExpressionValidator>

                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("yearCount") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Number of semesters">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("semesterCount") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("semesterCount") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBox4" Display="Dynamic" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>

                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="*Invalid" Display="Dynamic" ForeColor="Red" ValidationExpression="^[1-9]\d*$"></asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("semesterCount") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Fields>
            </asp:DetailsView>
            <br />
            <br />
        </asp:View>
        <asp:View ID="View2" runat="server">
            <br />
            <asp:UpdatePanel ID="UpdatePanel3" runat="server" OnLoad="UpdatePanel3_Load" UpdateMode="Conditional">
                <ContentTemplate>
                    <%--       <asp:GridView ID="GridView1" ShowHeaderWhenEmpty="True" runat="server" AutoGenerateColumns="False" DataKeyNames="semesterID" GridLines="Horizontal" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="table table-striped table-hover  table-condensed  gridViewCustom">
                        <Columns>

                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="semesterID" HeaderText="semesterID" SortExpression="Semester ID" />
                            <asp:BoundField DataField="yearNumber" HeaderText="Year" SortExpression="Acedemic Year" />

                            <asp:BoundField DataField="semesterNumber" HeaderText="Semester" SortExpression="Semester" />
                        </Columns>
                    </asp:GridView>
                    
                    <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource6" DefaultMode="Insert" HeaderText="Add New Modules Here"  OnItemInserted="DetailsView2_ItemInserted" OnItemInserting="DetailsView2_ItemInserting" OnItemUpdated="DetailsView2_ItemUpdated" OnPageIndexChanging="DetailsView2_PageIndexChanging">
                        <Fields>
                            <asp:BoundField DataField="semesterID" HeaderText="semesterID" InsertVisible="False" ReadOnly="True" SortExpression="semesterID" Visible="False" />
                            <asp:TemplateField HeaderText="moduleCode" SortExpression="moduleCode">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("moduleCode") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" OnSelecting="SqlDataSource7_Selecting" SelectCommand="SELECT [moduleCode] FROM [Module]"></asp:SqlDataSource>
                                    <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="SqlDataSource7" DataTextField="moduleCode" DataValueField="moduleCode" OnDataBound="DropDownList6_DataBound" OnDataBinding="DropDownList6_DataBinding" AppendDataBoundItems="true">
                                        <asp:ListItem Text="--Select Module--" Value="-1" Selected="True"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="DropDownList6" ErrorMessage="*Required" ForeColor="Red" InitialValue="-1"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <br />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="lecturerName" SortExpression="lecturerName">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("lecturerName") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="TextBox1" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("lecturerName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowInsertButton="True" />
                        </Fields>
                    </asp:DetailsView>
                    <br />
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" OnRowDeleting="GridView2_RowDeleting" CssClass="table table-striped table-hover  table-condensed  gridViewCustom" GridLines="Horizontal" HorizontalAlign="Center">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" />
                            <asp:BoundField DataField="semesterID" HeaderText="semesterID" InsertVisible="False" ReadOnly="True" SortExpression="semesterID" />
                            <asp:BoundField DataField="moduleCode" HeaderText="moduleCode" SortExpression="moduleCode" />
                            <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                            <asp:BoundField DataField="GPA" HeaderText="GPA" SortExpression="GPA" />
                            <asp:BoundField DataField="credits" HeaderText="credits" SortExpression="credits" />
                            <asp:BoundField DataField="compulary" HeaderText="compulary" SortExpression="compulary" />
                            <asp:BoundField DataField="lecturerName" HeaderText="lecturerName" SortExpression="lecturerName" />
                        </Columns>
                    </asp:GridView>
                    <br />
                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" InsertCommand="spInsertModuleBySemester" InsertCommandType="StoredProcedure" SelectCommand="spGetModuleInfoBySemesterNew" SelectCommandType="StoredProcedure">
                        <InsertParameters>
                            <asp:Parameter Name="semesterID" Type="Int32" />
                            <asp:Parameter Name="moduleCode" Type="String" />
                            <asp:Parameter Name="lecturerName" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridView1" Name="semesterID" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Next" ValidateRequestMode="Disabled" />
                    --%>

                    <div class="panel panel-default">
                        <div class="panel-heading">

                            <asp:Label ID="Label10" runat="server" Text="Add modules "></asp:Label>

                        </div>
                        <div class="panel-body">
                            <table>
                                <tr>
                                    <td>
                                        <asp:GridView ID="GridView1" ShowHeaderWhenEmpty="True" runat="server" AutoGenerateColumns="False" DataKeyNames="semesterID" GridLines="Horizontal" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="table table-striped table-hover  table-condensed  gridViewCustom gridview2" HorizontalAlign="Center">
                                            <Columns>

                                                <asp:CommandField ShowSelectButton="True" />
                                                <asp:BoundField DataField="semesterID" HeaderText="semesterID" SortExpression="Semester ID" />
                                                <asp:BoundField DataField="yearNumber" HeaderText="Year" SortExpression="Acedemic Year" />

                                                <asp:BoundField DataField="semesterNumber" HeaderText="Semester" SortExpression="Semester" />
                                            </Columns>
                                        </asp:GridView>
                                    </td>

                                </tr>
                                <tr>
                                    <td>
                                        <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource6" DefaultMode="Insert" HeaderText="Add New Modules Here" OnItemInserted="DetailsView2_ItemInserted" OnItemInserting="DetailsView2_ItemInserting" OnItemUpdated="DetailsView2_ItemUpdated" OnPageIndexChanging="DetailsView2_PageIndexChanging" CssClass=" gridview2 table-condensed  table-striped  detailsView" HorizontalAlign="Center">
                                            <Fields>
                                                <asp:BoundField DataField="semesterID" HeaderText="semesterID" InsertVisible="False" ReadOnly="True" SortExpression="semesterID" Visible="False" />
                                                <asp:TemplateField HeaderText="moduleCode" SortExpression="moduleCode">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("moduleCode") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <InsertItemTemplate>
                                                        <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" OnSelecting="SqlDataSource7_Selecting" SelectCommand="SELECT [moduleCode] FROM [Module]"></asp:SqlDataSource>
                                                        <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="SqlDataSource7" DataTextField="moduleCode" DataValueField="moduleCode" OnDataBound="DropDownList6_DataBound" OnDataBinding="DropDownList6_DataBinding" AppendDataBoundItems="true">
                                                            <asp:ListItem Text="--Select Module--" Value="-1" Selected="True"></asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="DropDownList6" ErrorMessage="*Required" ForeColor="Red" InitialValue="-1" ValidationGroup="g8"></asp:RequiredFieldValidator>
                                                    </InsertItemTemplate>
                                                    <ItemTemplate>
                                                        <br />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="lecturerName" SortExpression="lecturerName">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("lecturerName") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <InsertItemTemplate>
                                                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="TextBox1" ErrorMessage="*Required" ForeColor="Red" ValidationGroup="g8"></asp:RequiredFieldValidator>
                                                    </InsertItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("lecturerName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Fields>
                                            <FooterTemplate>
                                                <asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click" ValidationGroup="g8">Insert</asp:LinkButton>
                                            </FooterTemplate>
                                        </asp:DetailsView>
                                    </td>

                                </tr>
                                <tr>
                                    <td style="padding-top: 20px;">
                                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" OnRowDeleting="GridView2_RowDeleting" CssClass="table table-striped table-hover  table-condensed  gridViewCustom  gridview2" GridLines="Horizontal" HorizontalAlign="Center">
                                            <Columns>
                                                <asp:CommandField ShowDeleteButton="True" />
                                                <asp:BoundField DataField="semesterID" HeaderText="semesterID" InsertVisible="False" ReadOnly="True" SortExpression="semesterID" />
                                                <asp:BoundField DataField="moduleCode" HeaderText="moduleCode" SortExpression="moduleCode" />
                                                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                                                <asp:BoundField DataField="GPA" HeaderText="GPA" SortExpression="GPA" />
                                                <asp:BoundField DataField="credits" HeaderText="credits" SortExpression="credits" />
                                                <asp:BoundField DataField="compulary" HeaderText="compulary" SortExpression="compulary" />
                                                <asp:BoundField DataField="lecturerName" HeaderText="lecturerName" SortExpression="lecturerName" />
                                            </Columns>
                                        </asp:GridView>
                                        <br />
                                        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" InsertCommand="spInsertModuleBySemester" InsertCommandType="StoredProcedure" SelectCommand="spGetModuleInfoBySemesterNew" SelectCommandType="StoredProcedure">
                                            <InsertParameters>
                                                <asp:Parameter Name="semesterID" Type="Int32" />
                                                <asp:Parameter Name="moduleCode" Type="String" />
                                                <asp:Parameter Name="lecturerName" Type="String" />
                                            </InsertParameters>
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="GridView1" Name="semesterID" PropertyName="SelectedValue" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Next"  CssClass="btn btn-primary" />

                                    </td>

                                </tr>
                            </table>
                        </div>

                    </div>



                </ContentTemplate>
            </asp:UpdatePanel>

        </asp:View>




        <asp:View ID="View3" runat="server">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <%-- Update Student Information<br />
                    <br />
                    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" AutoGenerateEditButton="True" DataKeyNames="userID" GridLines="Horizontal" OnRowEditing="GridView3_RowEditing" OnRowUpdating="GridView3_RowUpdating" AllowPaging="True" OnRowUpdated="GridView3_RowUpdated" CssClass="table table-striped table-hover  table-condensed  gridViewCustom gridview" OnPageIndexChanging="GridView3_PageIndexChanging" HorizontalAlign="Center">
                        <Columns>
                            <asp:BoundField DataField="userID" HeaderText="userID" InsertVisible="False" ReadOnly="True" SortExpression="userID" />
                            <asp:TemplateField HeaderText="userName" SortExpression="userName">
                                <EditItemTemplate>

                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("userName") %>'></asp:TextBox>

                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("userName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="IndexNo" SortExpression="IndexNo">
                                <EditItemTemplate>

                                    <asp:TextBox ID="TextBox4" Text='<%# Bind("indexNo") %>' runat="server"></asp:TextBox>

                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("indexNo") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <br />
                    <asp:Button ID="Button2" runat="server" Text="Next" OnClick="Button2_Click" />--%>



                    <div class="panel panel-default">
                        <div class="panel-heading">

                            <asp:Label ID="Label6" runat="server" Text="Edit Student Information "></asp:Label>

                        </div>
                        <div class="panel-body">
                            <table>
                                <tr>
                                    <td>
                                        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" AutoGenerateEditButton="True" DataKeyNames="userID" GridLines="Horizontal" OnRowEditing="GridView3_RowEditing" OnRowUpdating="GridView3_RowUpdating" AllowPaging="True" OnRowUpdated="GridView3_RowUpdated" CssClass="table table-striped table-hover  table-condensed  gridViewCustom gridview" OnPageIndexChanging="GridView3_PageIndexChanging" HorizontalAlign="Center">
                                            <Columns>
                                                <asp:BoundField DataField="userID" HeaderText="userID" InsertVisible="False" ReadOnly="True" SortExpression="userID" />
                                                <asp:TemplateField HeaderText="userName" SortExpression="userName">
                                                    <EditItemTemplate>

                                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("userName") %>'></asp:TextBox>

                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("userName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="IndexNo" SortExpression="IndexNo">
                                                    <EditItemTemplate>

                                                        <asp:TextBox ID="TextBox4" Text='<%# Bind("indexNo") %>' runat="server"></asp:TextBox>

                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("indexNo") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                        <asp:Button ID="Button2" runat="server" Text="Next" OnClick="Button2_Click" CssClass="btn btn-primary" />

                                    </td>

                                </tr>


                            </table>
                        </div>

                    </div>


                </ContentTemplate>




            </asp:UpdatePanel>
        </asp:View>

        <asp:View ID="View4" runat="server">
            <%-- <asp:Panel ID="Panel1" runat="server">

                <table style="width: 100%;">
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="Label3" runat="server" Text="Set Password For Student Accounts"></asp:Label>
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="Password"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox5" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="TextBox5" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label5" runat="server" Text="re enterPassword"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox6" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="TextBox6" Display="Dynamic" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox5" ControlToValidate="TextBox6" Display="Dynamic" ErrorMessage="*Password Mismatch" ForeColor="Red"></asp:CompareValidator>
                        </td>

                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Finish" Style="height: 26px" ValidateRequestMode="Enabled" />
                        </td>

                    </tr>
                </table>

            </asp:Panel>--%>

             <asp:Panel ID="Panel2" class="panel panel-danger" runat="server">
                                    <div class="panel-heading">
                                        <h3 class="panel-title" style="color:black;" >Set common Password</h3>
                                    </div>
                                    <div class="panel-body form-horizontal">
                                        <div class="form-group">

                                              <asp:Label ID="Label4" Width="160px" class="col-lg-3 control-label" runat="server" Text="Password"></asp:Label>
                                            <div class="col-lg-4">
                                                        <asp:TextBox ID="TextBox5" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="TextBox5" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>

                                            </div>
                                        </div>
                                         <div class="form-group">

                                              <asp:Label ID="Label5" Width="160px" class="col-lg-3 control-label" runat="server" Text="re enterPassword"></asp:Label>
                                            <div class="col-lg-4">
                                                         <asp:TextBox ID="TextBox6" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="TextBox6" Display="Dynamic" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox5" ControlToValidate="TextBox6" Display="Dynamic" ErrorMessage="*Password Mismatch" ForeColor="Red"></asp:CompareValidator>
                      
                                            </div>
                                        </div>


                                        <div class="form-group">

                                              <asp:Label ID="Label7" Width="160px" class="col-lg-3 control-label" runat="server" Text=""></asp:Label>
                                            <div class="col-lg-4">
                            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" CssClass="btn btn-primary" Text="Finish" Style="height: 26px" ValidateRequestMode="Enabled" />
                                                  
                                            </div>
                                        </div>
                                    </div>
                                </asp:Panel>


        
        
        
        
        
        
        
        </asp:View>

    </asp:MultiView>



</asp:Content>
