<%@ Page Title="" Language="C#" MasterPageFile="~/PresentationLayer/Admin/CourseAminMaster.Master" AutoEventWireup="true" CodeBehind="NewCourseView.aspx.cs" Inherits="PerformanceAnalyzer2.PresentationLayer.Admin.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Menu ID="Menu1" runat="server" StaticMenuItemStyle-BorderStyle="Solid"  Orientation="Vertical" >
                        <Items>
                            <asp:MenuItem Text="Step1: Basic Info"  NavigateUrl="NewCourseView.aspx?activeView=0"></asp:MenuItem>
                            <asp:MenuItem Text="Step2: Acedemic Info" NavigateUrl="NewCourseView.aspx?activeView=1" ></asp:MenuItem>
                            <asp:MenuItem Text="Step3: Student Info"  NavigateUrl="NewCourseView.aspx?activeView=2" ></asp:MenuItem>
                            <asp:MenuItem Text="Step4: Finish"   NavigateUrl="NewCourseView.aspx?activeView=3" ></asp:MenuItem>
                            
                        </Items>

<StaticMenuItemStyle BorderStyle="Solid"></StaticMenuItemStyle>

                        <StaticSelectedStyle BackColor="#FF99FF" ForeColor="#6666FF" />

                    </asp:Menu>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <p>
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateInsertButton="True" AutoGenerateRows="False" DataKeyNames="courseID" DefaultMode="Insert" Height="50px" Width="303px" OnItemInserting="DetailsView1_ItemInserting" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemInserted="DetailsView1_ItemInserted">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                    <EditRowStyle BackColor="#999999" />
                    <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                    <Fields>
                        <asp:BoundField DataField="name" HeaderText="Course name" />
                        <asp:TemplateField HeaderText="Batch">
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server">
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
                                    <asp:ListItem></asp:ListItem>
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="University">
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
                            <ItemTemplate>
                               
                                <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource3" DataTextField="name" DataValueField="departmentID" ToolTip="Select Department">
                                </asp:DropDownList>
                                <br />
                                <br />
                               <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT * FROM [Department] "></asp:SqlDataSource>
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                          <asp:BoundField DataField="studentCount" HeaderText="Number of student" />
                          <asp:BoundField DataField="yearCount" HeaderText="Number of acedemic years" />
                          <asp:BoundField DataField="semesterCount" HeaderText="Number of semesters" />
                    </Fields>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                </asp:DetailsView>
                <br />
                <br />
            </asp:View>
            <asp:View ID="View2" runat="server">
                <br />
                <asp:UpdatePanel ID="UpdatePanel3" runat="server" OnLoad="UpdatePanel3_Load" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:GridView ID="GridView1" ShowHeaderWhenEmpty="true"  runat="server" AutoGenerateColumns="False" DataKeyNames="semesterID" CellPadding="4"  ForeColor="#333333" GridLines="None" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
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
                        <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource6" DefaultMode="Insert" HeaderText="Add New Modules Here" Height="50px" Width="167px" OnItemInserted="DetailsView2_ItemInserted" OnItemInserting="DetailsView2_ItemInserting" OnItemUpdated="DetailsView2_ItemUpdated" OnPageIndexChanging="DetailsView2_PageIndexChanging">
                            <Fields>
                                <asp:BoundField DataField="semesterID" HeaderText="semesterID" InsertVisible="False" ReadOnly="True" SortExpression="semesterID" Visible="False" />
                                <asp:TemplateField HeaderText="moduleCode" SortExpression="moduleCode">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("moduleCode") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" OnSelecting="SqlDataSource7_Selecting" SelectCommand="SELECT [moduleCode] FROM [Module]"></asp:SqlDataSource>
                                        <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="SqlDataSource7"  DataTextField="moduleCode" DataValueField="moduleCode" OnDataBound="DropDownList6_DataBound" OnDataBinding="DropDownList6_DataBinding" AppendDataBoundItems="true">
                                          <asp:ListItem Text="--Select Module--" Value="-1" Selected="True"></asp:ListItem>
                                        </asp:DropDownList>
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
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Next" />
                        <br />
                        <br />
                        <br />
                        <br />
                    </ContentTemplate>
                </asp:UpdatePanel>
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
            </asp:View>
           

          

            <asp:View ID="View3" runat="server">
                 <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                     <ContentTemplate>
                Update Student Information<br />
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
                         <asp:Button ID="Button2" runat="server" Text="Next" OnClick="Button2_Click" />
                         <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                         </ContentTemplate>
                       </asp:UpdatePanel>
            </asp:View>

            <asp:View ID="View4" runat="server">
                <asp:Panel ID="Panel1" runat="server">

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
                            </td>
                         
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label5" runat="server" Text="re enterPassword"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox6" runat="server" TextMode="Password"></asp:TextBox>
                            </td>
                            
                        </tr>
                         <tr>
                            <td>&nbsp;</td>
                            <td>
                                <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Finish" />
                             </td>
                            
                        </tr>
                    </table>

                </asp:Panel>

            </asp:View>
            
        </asp:MultiView>
        <br />
    </p>
    <p>
    </p>
</asp:Content>
