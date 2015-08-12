<%@ Page Title="" Language="C#" MasterPageFile="~/PresentationLayer/Student/StudentMaster.Master" AutoEventWireup="true" CodeBehind="MyCourseView.aspx.cs" Inherits="PerformanceAnalyzer2.PresentationLayer.Student.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Menu ID="Menu1" runat="server" OnMenuItemClick="Menu1_MenuItemClick">
               <Items>
                   <asp:MenuItem Text="Basic Details">  </asp:MenuItem>
                   <asp:MenuItem Text="Modules">  </asp:MenuItem>
                   <asp:MenuItem Text="Student Details">  </asp:MenuItem>

               </Items>
            </asp:Menu>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="courseID" Height="50px" Width="303px" CellPadding="4" ForeColor="#333333" GridLines="None" >
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                            <EditRowStyle BackColor="#999999" />
                            <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                            <Fields>
                                <asp:TemplateField HeaderText="Course name">
                                   
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Batch">
                                   
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server"  Text='<%# Bind("batch") %>'></asp:Label>
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
                         
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        </asp:DetailsView>
        </asp:View>
        <asp:View ID="View2" runat="server">

            <asp:GridView ID="GridView4" runat="server"  AutoGenerateColumns="False" DataKeyNames="semesterID" OnDataBinding="GridView4_DataBinding" OnRowDataBound="GridView4_RowDataBound">
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
                            <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource10">
                                <Columns>
                                    <asp:BoundField DataField="moduleCode" HeaderText="moduleCode" SortExpression="moduleCode" />
                                    <asp:BoundField DataField="moduleName" HeaderText="moduleName" SortExpression="moduleName" />
                                    <asp:BoundField DataField="GPA" HeaderText="GPA" SortExpression="GPA" />
                                    <asp:BoundField DataField="credits" HeaderText="credits" SortExpression="credits" />
                                    <asp:BoundField DataField="courseID" InsertVisible="false" Visible="false" HeaderText="courseID" SortExpression="courseID" />

                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <table style="width:100%;">
                                                <tr>
                                                    <td>
                                                        <asp:LinkButton ID="LinkButton1"  runat="server" >My Results</asp:LinkButton></td>
                                                    <td>
                                                        <asp:LinkButton ID="LinkButton2" runat="server">Batch Results</asp:LinkButton></td>
                                                    <td>
                                                        <asp:LinkButton ID="LinkButton3" runat="server">Previous Results</asp:LinkButton></td>
                                                </tr>
                                                
                                            </table>
                                        </ItemTemplate>
                                    </asp:TemplateField>

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
           <tr><td>
               <div>
            <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False" DataKeyNames="userID" DataSourceID="SqlDataSource11" OnSelectedIndexChanged="GridView6_SelectedIndexChanged" AllowPaging="True" PageSize="20">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="userID" Visible="false" HeaderText="userID" InsertVisible="False" ReadOnly="True" SortExpression="userID" />
                    <asp:TemplateField HeaderText="Name" SortExpression="userName">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("userName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <table style="width:100%;">
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
                    <asp:TemplateField>
                      
                        <ItemTemplate>
                              <table style="width: 100%;">
                            <tr>
                                <td>
                                    <asp:LinkButton ID="LinkButton4" runat="server">Performance</asp:LinkButton></td>
                                <td>
                                    <asp:LinkButton ID="LinkButton5" runat="server">Comapare</asp:LinkButton></td>
                           
                            </tr>
                            
                        </table>
                        </ItemTemplate>
                      
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
                </div></td>
          <td> 
               <div >

                <asp:DetailsView ID="DetailsView2" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="userID" DataSourceID="SqlDataSource12">
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
                        <asp:BoundField DataField="userID" visible="false" HeaderText="userID" InsertVisible="False" ReadOnly="True" SortExpression="userID" />
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
            </div></td></tr>
                </table>
            <br />
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
            <br />
        </asp:View>

         </asp:MultiView>
        </ContentTemplate>
        </asp:UpdatePanel>
   
</asp:Content>
