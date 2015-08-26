<%@ Page Title="" Language="C#" MasterPageFile="~/PresentationLayer/Admin/CourseAminMaster.Master" AutoEventWireup="true" CodeBehind="CourseView.aspx.cs" Inherits="PerformanceAnalyzer2.PresentationLayer.Admin.WebForm5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Menu ID="Menu2" runat="server" OnMenuItemClick="Menu2_MenuItemClick">

        <Items>
            <asp:MenuItem Text="Course Info" ></asp:MenuItem>
            <asp:MenuItem Text="Module Info" ></asp:MenuItem>
            <asp:MenuItem Text="Student Info" ></asp:MenuItem>

        </Items>
    </asp:Menu>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
     <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
    <asp:Panel ID="Panel1" runat="server">
        <table>
              <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Select Course Here"></asp:Label>

                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="courseID" AppendDataBoundItems="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                            <asp:ListItem Text="--Select Module--" Value="0" Selected="True"></asp:ListItem>

                        </asp:DropDownList>

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="select courseID,name from  Course where adminID=@userID">
                            <SelectParameters>
                                <asp:SessionParameter Name="userID" SessionField="userID" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
        </table>


    </asp:Panel>



    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <table>
              
                <tr>
                    <td colspan="2">
                        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="courseID" Height="50px" Width="303px" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemUpdating="DetailsView1_ItemUpdating">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                            <EditRowStyle BackColor="#999999" />
                            <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                            <Fields>
                                <asp:TemplateField HeaderText="Course name">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                                    </EditItemTemplate>

                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Batch">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="DropDownList5" runat="server" SelectedValue='<%# Eval("batch") %>'>

                                            <asp:ListItem>2009</asp:ListItem>
                                            <asp:ListItem>2010</asp:ListItem>
                                            <asp:ListItem>2011</asp:ListItem>
                                            <asp:ListItem>2012</asp:ListItem>
                                            <asp:ListItem>2013</asp:ListItem>
                                            <asp:ListItem>2014</asp:ListItem>
                                            <asp:ListItem Selected="True">2015</asp:ListItem>
                                            <asp:ListItem>2016</asp:ListItem>
                                            <asp:ListItem>2017</asp:ListItem>
                                            <asp:ListItem>2018</asp:ListItem>

                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server"  Text='<%# Bind("batch") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="University">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="SqlDataSource4" DataTextField="name" DataValueField="universityID" Height="16px">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT * FROM [University]"></asp:SqlDataSource>
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
                                        <asp:DropDownList ID="DropDownList7" runat="server" DataSourceID="SqlDataSource5" DataTextField="name" DataValueField="facultyID">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT * FROM [Faculty]"></asp:SqlDataSource>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="facultyID" ToolTip="Select Faculty">
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
                                        <asp:DropDownList ID="DropDownList8" runat="server" DataSourceID="SqlDataSource6" DataTextField="name" DataValueField="departmentID">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT * FROM [Department]"></asp:SqlDataSource>
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
                                        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource7" ShowHeader="False">
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
                                        <asp:GridView ID="GridView2" runat="server" DataSourceID="SqlDataSource8" ShowHeader="False">
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
                                        <asp:GridView ID="GridView3" runat="server" DataSourceID="SqlDataSource9" ShowHeader="False" SelectedRowStyle-BorderWidth="0px">
                                        </asp:GridView>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Fields>
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        </asp:DetailsView>
                    </td>
                </tr>



            </table>
        </asp:View>
        <asp:View ID="View2" runat="server">
          Module Information
                        <asp:GridView ID="GridView1" ShowHeaderWhenEmpty="true"  runat="server" AutoGenerateColumns="False" DataKeyNames="semesterID" CellPadding="4"  ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                
                                <asp:CommandField ShowSelectButton="True" />
                                 <asp:BoundField DataField="semesterID"  HeaderText="semesterID" SortExpression="Semester ID" />
                                <asp:BoundField DataField="yearNumber" HeaderText="Year" SortExpression="Acedemic Year" />
                             
                                <asp:BoundField DataField="semesterNumber" HeaderText="Semester" SortExpression="Semester" />
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
                        <br />
                        <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource6" DefaultMode="Insert" HeaderText="Add New Modules Here" Height="50px" Width="167px" OnItemInserted="DetailsView2_ItemInserted" OnItemInserting="DetailsView2_ItemInserting">
                            <Fields>
                                <asp:BoundField DataField="semesterID" HeaderText="semesterID" InsertVisible="False" ReadOnly="True" SortExpression="semesterID" Visible="False" />
                                <asp:TemplateField HeaderText="moduleCode" SortExpression="moduleCode">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("moduleCode") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT [moduleCode] FROM [Module]"></asp:SqlDataSource>
                                        <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="SqlDataSource7"  DataTextField="moduleCode" DataValueField="moduleCode" AppendDataBoundItems="true">
                                          <asp:ListItem Text="--Select Module--" Value="-1" Selected="True"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Required" InitialValue="-1" ForeColor="Red" ControlToValidate="DropDownList6"></asp:RequiredFieldValidator>
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
                                        <asp:TextBox ID="TextBox1" runat="server"  ></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("lecturerName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField ShowInsertButton="True" />
                            </Fields>
                        </asp:DetailsView>
                        <br />
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" OnRowDeleting="GridView2_RowDeleting">
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
                        <br />
                        <br />
                        <br />
                        <br />
                   
        </asp:View>
      <asp:View ID="View3" runat="server">
                 
                Student Information<br />
                <br />
                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" AutoGenerateEditButton="True" DataKeyNames="userID"  CellPadding="4" ForeColor="#333333" GridLines="None" OnRowEditing="GridView3_RowEditing"  OnRowUpdating="GridView3_RowUpdating" AllowPaging="True" OnRowUpdated="GridView3_RowUpdated" >
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
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
