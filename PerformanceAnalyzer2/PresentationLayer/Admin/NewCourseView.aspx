<%@ Page Title="" Language="C#" MasterPageFile="~/PresentationLayer/Admin/CourseAminMaster.Master" AutoEventWireup="true" CodeBehind="NewCourseView.aspx.cs" Inherits="PerformanceAnalyzer2.PresentationLayer.Admin.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <p>
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateInsertButton="True" AutoGenerateRows="False" DataKeyNames="courseID" DefaultMode="Insert" Height="50px" Width="303px" OnItemInserting="DetailsView1_ItemInserting" CellPadding="4" ForeColor="#333333" GridLines="None">
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
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
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
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" ShowFooter="True" CellPadding="4" ForeColor="#333333" GridLines="None"  OnRowDeleted="GridView2_RowDeleted">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:CommandField ShowDeleteButton="True" />
                                <asp:TemplateField HeaderText="semesterID" InsertVisible="False"  SortExpression="semesterID">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label1" runat="server"   Text='<%# Eval("semesterID") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("semesterID") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:LinkButton ID="LinkButton1" OnClick="lbi_Click" runat="server">Add</asp:LinkButton>
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="moduleCode" SortExpression="moduleCode">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("moduleCode") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("moduleCode") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" SelectCommand="SELECT * FROM [Module]"></asp:SqlDataSource>
                                        <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="SqlDataSource5" DataTextField="moduleCode" DataValueField="moduleCode"></asp:DropDownList>

                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="name"  HeaderText="name" SortExpression="name" />
                                <asp:TemplateField HeaderText="lecturerName" SortExpression="lecturerName">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("lecturerName") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("lecturerName") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>

                                        <asp:TextBox ID="TextBox3" runat="server" MaxLength="60"></asp:TextBox>

                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="GPA" HeaderText="GPA" SortExpression="GPA" />
                                <asp:BoundField DataField="credits" HeaderText="credits" SortExpression="credits" />
                                <asp:BoundField DataField="compulary" HeaderText="compulary" SortExpression="compulary" />
                               
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
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:PerformanceAnalyzerConnectionString %>" DeleteCommand="spDeleteModuleBySemester" DeleteCommandType="StoredProcedure" InsertCommand="spInsertModuleBySemester" InsertCommandType="StoredProcedure" SelectCommand="spGetModuleInfoBySemesterNew" SelectCommandType="StoredProcedure">
                            <DeleteParameters>
                                <asp:Parameter Name="semesterID" Type="Int32" />
                                <asp:Parameter Name="moduleCode" Type="String" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="semesterID" Type="Int32" />
                                <asp:Parameter Name="moduleCode" Type="String" />
                                <asp:Parameter Name="lecturerName" Type="String" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:SessionParameter Name="semesterID" SessionField="&quot;selectedSemester&quot;" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
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
                <br />
                <br />
                <br />
            </asp:View>
            
        </asp:MultiView>
        <br />
    </p>
    <p>
    </p>
</asp:Content>
