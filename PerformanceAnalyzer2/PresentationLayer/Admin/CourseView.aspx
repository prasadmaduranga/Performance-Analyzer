<%@ Page Title="" Language="C#" MasterPageFile="~/PresentationLayer/Admin/CourseAminMaster.Master" AutoEventWireup="true" CodeBehind="CourseView.aspx.cs" Inherits="PerformanceAnalyzer2.PresentationLayer.Admin.WebForm5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<asp:Menu ID="Menu1" runat="server" OnMenuItemClick="Menu2_MenuItemClick">

        <Items>
            <asp:MenuItem Text="Course Info"></asp:MenuItem>
            <asp:MenuItem Text="Module Info"></asp:MenuItem>
            <asp:MenuItem Text="Student Info"></asp:MenuItem>

        </Items>
    </asp:Menu>--%>


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

            <asp:Menu ID="Menu1" runat="server" StaticMenuStyle-Width="100%" OnMenuItemClick="Menu2_MenuItemClick" StaticMenuStyle-CssClass="nav navbar-nav" class="navbar-collapse collapse sidebar-navbar-collapse">

                <Items>
                    <asp:MenuItem Text="Course Info"></asp:MenuItem>
                    <%-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
                    <asp:MenuItem Text="Module Info"></asp:MenuItem>
                    <asp:MenuItem Text="Student Info"></asp:MenuItem>

                </Items>
            </asp:Menu>


        </div>

    </div>




</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
        <ContentTemplate>




         

           
       
                <asp:Panel ID="Panel1" class="panel panel-danger" runat="server">
                    <div class="panel-heading"><h3 class="panel-title">Enter Course Info.</h3></div>
                    <div class="panel-body">
                        <div class="form-group">
                            <asp:Label ID="Label1" runat="server" Width="160px" class="col-lg-3 control-label" Text="Select Course Here"></asp:Label>
                             

                            <div class="col-lg-4">
                          
                                 <asp:DropDownList ID="DropDownList1" class="form-control" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="courseID" AppendDataBoundItems="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                <asp:ListItem Text="--Select Course--" Value="0" Selected="True" ></asp:ListItem>

                            </asp:DropDownList>

                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="select courseID,name from  Course where adminID=@userID">
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
                    <table>

                        <tr>
                            <td colspan="2">
                                <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="
 select courseID,Course.name,batch,University.universityID as universityID,University.name as universityName,Faculty.facultyID as facultyID,Faculty.name as facultyName,Department.departmentID as departmentID,Department.name as departmentName

 from Course join University on Course.universityID=University.universityID join Faculty on Faculty.facultyID=Course.facultyID
 join Department on Department.departmentID=Course.departmentID
where Course.courseID=@courseID
">
                                    <SelectParameters>
                                        <asp:Parameter Name="courseID" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="courseID" OnItemUpdating="DetailsView1_ItemUpdating" CssClass="table-condensed table-striped  detailsView" HeaderText="Edit Course Info" DefaultMode="Edit" AutoGenerateEditButton="True" GridLines="Horizontal" HorizontalAlign="Center">
                                    <Fields>
                                        <asp:TemplateField HeaderText="Course name">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </EditItemTemplate>

                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Batch">
                                            <EditItemTemplate>
                                                <asp:DropDownList ID="DropDownList5" runat="server" SelectedValue='<%# Eval("batch") %>'>
                                                    <asp:ListItem Value="-1" Selected="True">--Select Batch--</asp:ListItem>
                                                    <asp:ListItem>2009</asp:ListItem>

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

                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownList5" Display="Dynamic" ErrorMessage="*Required" ForeColor="Red" InitialValue="-1"></asp:RequiredFieldValidator>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("batch") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="University">
                                            <EditItemTemplate>
                                                <asp:DropDownList ID="DropDownList6" AppendDataBoundItems="True" runat="server" DataSourceID="SqlDataSource4" DataValueField="universityID" SelectedValue='<%# Eval("universityID") %>' DataTextField="universityName">
                                                    <asp:ListItem Value="-1" Text="--Select University--"></asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DropDownList6" Display="Dynamic" ErrorMessage="*Required" ForeColor="Red" InitialValue="-1"></asp:RequiredFieldValidator>
                                                <br />
                                                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT universityID ,name as universityName FROM [University]"></asp:SqlDataSource>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("universityName") %>'></asp:Label>
                                                <br />
                                                <br />
                                                <br />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Faculty ">
                                            <EditItemTemplate>
                                                <asp:DropDownList ID="DropDownList7" AppendDataBoundItems="True" runat="server" DataSourceID="SqlDataSource5" DataValueField="facultyID" SelectedValue='<%# Eval("facultyID") %>' DataTextField="facultyName">
                                                    <asp:ListItem Value="-1" Text="--Select faculty--"></asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT facultyID, name as facultyName FROM [Faculty]"></asp:SqlDataSource>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DropDownList7" Display="Dynamic" ErrorMessage="*Required" ForeColor="Red" InitialValue="-1"></asp:RequiredFieldValidator>
                                            </EditItemTemplate>
                                            <InsertItemTemplate>
                                                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource2" DataValueField="facultyID" ToolTip="Select Faculty">
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT * FROM [Faculty]"></asp:SqlDataSource>
                                            </InsertItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("facultyName") %>'></asp:Label>
                                                <br />
                                                <br />
                                                <br />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Department">
                                            <EditItemTemplate>
                                                <asp:DropDownList ID="DropDownList8" AppendDataBoundItems="True" runat="server" DataSourceID="SqlDataSource6" DataValueField="departmentID" SelectedValue='<%# Eval("departmentID") %>' DataTextField="departmentName">
                                                    <asp:ListItem Value="-1" Text="--Select Department--"></asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT departmentID,name as departmentName FROM [Department]"></asp:SqlDataSource>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="DropDownList8" Display="Dynamic" ErrorMessage="*Required" ForeColor="Red" InitialValue="-1"></asp:RequiredFieldValidator>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("departmentName") %>'></asp:Label>
                                                <br />
                                                <br />
                                                <br />
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
                                <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="
 select courseID,Course.name,batch,University.universityID as universityID,University.name as universityName,Faculty.facultyID as facultyID,Faculty.name as facultyName,Department.departmentID as departmentID,Department.name as departmentName

 from Course join University on Course.universityID=University.universityID join Faculty on Faculty.facultyID=Course.facultyID
 join Department on Department.departmentID=Course.departmentID
where Course.courseID=@courseID
"
                                    UpdateCommand="UPDATE Course SET universityID =@universityID, facultyID =@facultyID, departmentID =@departmentID, name =@name, batch =@batch
where courseID=@courseID">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DropDownList1" Name="courseID" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="universityID" />
                                        <asp:Parameter Name="facultyID" />
                                        <asp:Parameter Name="departmentID" />
                                        <asp:Parameter Name="name" />
                                        <asp:Parameter Name="batch" />
                                        <asp:Parameter Name="courseID" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>



                    </table>
                </asp:View>
                <asp:View ID="View2" runat="server">
                    Module Information
                        <asp:GridView ID="GridView1" ShowHeaderWhenEmpty="True" runat="server" AutoGenerateColumns="False" DataKeyNames="semesterID" GridLines="Horizontal" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnDataBound="GridView1_DataBound" OnLoad="GridView1_Load" CssClass="table table-striped table-hover  table-condensed  gridViewCustom">
                            <Columns>

                                <asp:CommandField ShowSelectButton="True" />
                                <asp:BoundField DataField="semesterID" HeaderText="semesterID" SortExpression="Semester ID" />
                                <asp:BoundField DataField="yearNumber" HeaderText="Year" SortExpression="Acedemic Year" />

                                <asp:BoundField DataField="semesterNumber" HeaderText="Semester" SortExpression="Semester" />
                            </Columns>
                            <SelectedRowStyle CssClass="selectedRow" />
                        </asp:GridView>
                    <br />
                    <br />
                    <br />
                    <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource6" DefaultMode="Insert" HeaderText="Add New Modules " OnItemInserted="DetailsView2_ItemInserted" OnItemInserting="DetailsView2_ItemInserting" OnPreRender="DetailsView2_PreRender" CssClass="table-condensed  table-striped  detailsView" GridLines="Horizontal">
                        <Fields>
                            <asp:BoundField DataField="semesterID" HeaderText="semesterID" InsertVisible="False" ReadOnly="True" SortExpression="semesterID" Visible="False" />
                            <asp:TemplateField HeaderText="moduleCode" SortExpression="moduleCode">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("moduleCode") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT [moduleCode] FROM [Module]"></asp:SqlDataSource>
                                    <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="SqlDataSource7" DataTextField="moduleCode" DataValueField="moduleCode" AppendDataBoundItems="true">
                                        <asp:ListItem Text="--Select Module--" Value="-1" Selected="True"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Required" InitialValue="-1" ForeColor="Red" ControlToValidate="DropDownList6" Display="Dynamic" ValidationGroup="newModule"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <br />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="lecturerName" SortExpression="lecturerName">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("lecturerName") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox2" ErrorMessage="*Required" ForeColor="Red" ValidationGroup="group3"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1" ErrorMessage="*Required" ForeColor="Red" Display="Dynamic" ValidationGroup="newModule"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("lecturerName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Fields>
                        <FooterTemplate>
                            <asp:LinkButton ID="LinkButton4" runat="server" OnClick="insertButton_click" ValidationGroup="newModule">Insert</asp:LinkButton>
                        </FooterTemplate>
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
                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" InsertCommand="spInsertModuleBySemester" InsertCommandType="StoredProcedure" SelectCommand="spGetModuleInfoBySemesterNew2" SelectCommandType="StoredProcedure">
                        <InsertParameters>
                            <asp:Parameter Name="semesterID" Type="Int32" />
                            <asp:Parameter Name="moduleCode" Type="String" />
                            <asp:Parameter Name="lecturerName" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridView1" Name="semesterID" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <br />
                    <br />
                    <br />

                </asp:View>
                <asp:View ID="View3" runat="server">
                    Student Information<br />
                    <br />
                    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" AutoGenerateEditButton="True" DataKeyNames="userID" GridLines="Horizontal" OnRowEditing="GridView3_RowEditing" OnRowUpdating="GridView3_RowUpdating" AllowPaging="True" OnRowUpdated="GridView3_RowUpdated" CssClass="table table-striped table-hover  table-condensed  gridViewCustom" HorizontalAlign="Center" OnPageIndexChanging="GridView3_PageIndexChanging">
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
                        <EditRowStyle CssClass="selectedRow  editCustom" />
                        <PagerStyle HorizontalAlign="Center" />
                    </asp:GridView>
                    <br />

                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />

                </asp:View>
            </asp:MultiView>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
