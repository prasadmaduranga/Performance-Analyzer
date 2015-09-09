<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PerformanceAnalyzer2.Login" %>

<!DOCTYPE html>

<%--<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body runat="server">
    <form id="Form1" runat="server">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
         
            <ContentTemplate>


                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="View1" runat="server">

                        <div>

                            <br />
                            <asp:Panel ID="Panel1" runat="server">
                                <table style="width: 40%; height: 121px;">
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label1" runat="server" Text="User Name"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="*Required" ForeColor="Red" ValidationGroup="group1"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="*Required" ForeColor="Red" ValidationGroup="group1"></asp:RequiredFieldValidator>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Button ID="Button1" runat="server" Text="Sign In" OnClick="Button1_Click" CausesValidation="False" />
                                        </td>
                                        <td>
                                            <asp:Button ID="Button2" runat="server" Text="Login" OnClick="Button2_Click" ValidationGroup="group1" />
                                        </td>

                                    </tr>
                                    
                                </table>
                            </asp:Panel>
                            <br />
                            <br />
                            <br />

                        </div>

                    </asp:View>
                    <asp:View ID="View2" runat="server">

                        <div>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SIGN IN<br />
                            <br />
                            <table style="width: 100%;">
                                <tr>
                                    <td class="auto-style1">
                                        <asp:Label ID="Label3" runat="server" Text="Select Your Role"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                                            <asp:ListItem Value="0">Course Administrator</asp:ListItem>
                                            <asp:ListItem Value="1">Lecturer</asp:ListItem>
                                            <asp:ListItem Selected="True" Value="2">Industry Personal</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>

                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <table style="width: 100%;">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label4"
                                                        runat="server" Text="User Name"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="TextBox3"
                                                        runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="*Required" ForeColor="Red" ValidationGroup="group1"></asp:RequiredFieldValidator>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label5"
                                                        runat="server" Text="E mail"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="TextBox4"
                                                        runat="server"></asp:TextBox>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox4" ErrorMessage="*Invalid Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                        ForeColor="Red"></asp:RegularExpressionValidator>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label6"
                                                        runat="server" Text="Linkedin Profile"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="TextBox5"
                                                        runat="server"></asp:TextBox>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label7"
                                                        runat="server" Text="Upload Profile Picture"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:FileUpload ID="FileUpload1"
                                                        runat="server" />
                                                    <asp:Button ID="Button3"
                                                        runat="server" Text="Upload" OnClick="Button3_Click" />
                                                </td>

                                            </tr>


                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label8"
                                                        runat="server" Text="Password"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="TextBox7"
                                                        runat="server" TextMode="Password"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox7" ErrorMessage="*Required" ForeColor="Red" ValidationGroup="group2"></asp:RequiredFieldValidator>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label9"
                                                        runat="server" Text="Re-enter Password"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="TextBox8"
                                                        runat="server" TextMode="Password"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox8" Display="Dynamic" ErrorMessage="*Required" ForeColor="Red" ValidationGroup="group2"></asp:RequiredFieldValidator>
                                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox7" ControlToValidate="TextBox8" Display="Dynamic" ErrorMessage="*Password mismatch" ForeColor="Red" ValidationGroup="group2"></asp:CompareValidator>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td>

                                                    <asp:Button ID="Button4"
                                                        runat="server" Text="Cancel" CausesValidation="False" />

                                                </td>
                                                <td>
                                                    <asp:Button ID="Button5"
                                                        runat="server" Text="Submit" OnClick="Button5_Click" ValidationGroup="group2" />
                                                </td>

                                            </tr>
                                        </table>

                                    </td>


                                </tr>

                            </table>
                            <br />
                            <br />

                            <br />

                        </div>


                    </asp:View>

                </asp:MultiView>

            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>--%>
<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" runat="server">
    <link href="bootstrap-3.3.5-dist/css/Custom.css" rel="stylesheet" />

    <link href="bootstrap-3.3.5-dist/css/bootstrap.css" rel="stylesheet" />
    <meta charset="UTF-8" />
    <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">  -->
    <title>Grade Performance Analyzer</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Login and Registration Form with HTML5 and CSS3" />
    <meta name="keywords" content="html5, css3, form, switch, animation, :target, pseudo-class" />
    <meta name="author" content="Codrops" />
    <link rel="shortcut icon" href="../favicon.ico">
    <link rel="stylesheet" type="text/css" href="Login/css/demo.css" />
    <link rel="stylesheet" type="text/css" href="Login/css/style2.css" />
    <link rel="stylesheet" type="text/css" href="Login/css/animate-custom.css" />
</head>
<body>
    <%-- <form id="Form1" runat="server">

        <div class="container">
        
            <div class="codrops-top">


                <div class="clr"></div>
            </div>
          
            <header>


                <div>
                    <h1>
                        <asp:Image ID="Image1" runat="server" Height="115px" Width="105px" ImageUrl="Images/imagefinal5.png" />Grade Performance Analyzer</h1>
                </div>

            </header>
            <section>
                <div id="container_demo">
                  
                    <div id="wrapper">
                        <div id="login" class="animate form">
                            <h1>Log in</h1>
                            <p>

                                <asp:Label ID="Label1" runat="server" Text="User Name" for="username" class="uname" data-icon="u"></asp:Label>

                                <asp:TextBox ID="TextBox1" runat="server" name="username" type="text" placeholder="Your User Name"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="*Required" ForeColor="Red" ValidationGroup="group1"></asp:RequiredFieldValidator>
                            </p>
                            <p>

                                <asp:Label ID="Label2" runat="server" Text="Password" class="youpasswd" data-icon="p"></asp:Label>


                                <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" placeholder="Your Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="*Required" ForeColor="Red" ValidationGroup="group1"></asp:RequiredFieldValidator>


                            </p>

                            <p class="login button">

                                <asp:Button ID="Button2" runat="server" Text="Login" OnClick="Button2_Click" ValidationGroup="group1" />
                            </p>
                            <p class="change_link">
                                Not a member yet ?
									<a href="#toregister" class="to_register">Join us</a>
                            </p>

                        </div>

                        <div id="register" class="animate form">
                            
                                <h1> Sign up </h1> 
                                <p> 
                                
                                     <asp:Label ID="Label3" runat="server" Text="Select Your Role" class="uname" data-icon="u"></asp:Label>
       
                                  <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                                            <asp:ListItem Value="0">Course Administrator</asp:ListItem>
                                            <asp:ListItem Value="1">Lecturer</asp:ListItem>
                                            <asp:ListItem Selected="True" Value="2">Industry Personal</asp:ListItem>
                                        </asp:RadioButtonList>
                                
                                </p>
                                <p> 
                                  

                                     <asp:Label ID="Label4" class="youmail" data-icon="e"
                                                        runat="server" Text="User Name"></asp:Label>
                                        <asp:TextBox ID="TextBox3" placeholder="User Name"
                                                        runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="*Required" ForeColor="Red" ValidationGroup="group1"></asp:RequiredFieldValidator>
                                                
                                
                                </p>
                                <p> 

                                     <asp:Label ID="Label5" class="youmail" data-icon="e"
                                                        runat="server" Text="E mail"></asp:Label>

                                         <asp:TextBox ID="TextBox4" placeholder="mysupermail@mail.com"
                                                        runat="server"></asp:TextBox>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox4" ErrorMessage="*Invalid Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                        ForeColor="Red"></asp:RegularExpressionValidator>

                                </p>
                                 <p> 
                                   

                                     <asp:Label ID="Label6" class="youmail" data-icon="e"
                                                        runat="server" Text="Linkedin Profile"></asp:Label>

                                         <asp:TextBox ID="TextBox5" placeholder="myname@linkedin.com"
                                                        runat="server"></asp:TextBox>
                  

                                </p>
                                 <p> 

                                    <asp:Label ID="Label7"
                                                        runat="server" Text="Upload Profile Picture" class="youmail" data-icon="e" ></asp:Label>
                                         <asp:FileUpload ID="FileUpload1"
                                                        runat="server" />
                                                    <asp:Button ID="Button3"
                                                        runat="server" Text="Upload" OnClick="Button3_Click" />
                                      

                                </p>
                                <p> 
                                    
                                     <asp:Label ID="Label8" class="youpasswd" data-icon="p"
                                                        runat="server" Text="Password"></asp:Label>
                                 
                                          <asp:TextBox ID="TextBox7" placeholder="Password"
                                                        runat="server" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" placeholder="Password" ControlToValidate="TextBox7" ErrorMessage="*Required" ForeColor="Red" ValidationGroup="group2"></asp:RequiredFieldValidator>
                                               
                                </p>
                                <p> 
                               

                                    <asp:Label ID="Label9" class="youpasswd" data-icon="p"
                                                        runat="server" Text="Re-enter Password"></asp:Label>
                                    

                                       <asp:TextBox ID="TextBox8" placeholder="Confirm Password"
                                                        runat="server" TextMode="Password"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox8" Display="Dynamic" ErrorMessage="*Required" ForeColor="Red" ValidationGroup="group2"></asp:RequiredFieldValidator>
                                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox7" ControlToValidate="TextBox8" Display="Dynamic" ErrorMessage="*Password mismatch" ForeColor="Red" ValidationGroup="group2"></asp:CompareValidator>
                                                
                                </p>
                                <p class="signin button"> 
								  <asp:Button ID="Button5"
                                                        runat="server" Text="Submit" OnClick="Button5_Click" ValidationGroup="group2" />
								</p>
                                <p class="change_link">  
									Already a member ?
									 <a href="#tologin" class="to_register"> Go and log in </a>
								</p>
                            
                        </div>
                    </div>


                </div>
            </section>
        </div>
    </form>--%>

    <form id="Form1" runat="server">
        <div class="container">
            <!-- Codrops top bar -->
            <div class="codrops-top">


                <div class="clr"></div>
            </div>
            <!--/ Codrops top bar -->
            <header>
               <div style="float:left">
                     
                <asp:Image ID="Image1" CssClass ="img2" ImageUrl="Images/imagefinal5.png" runat="server" />  
                    
  </div>
                <h1 style="width:78%;     padding-left: 215px;">Grade Performance Analyzer</h1>
            </header>
            <section>
                <div id="container_demo">
                    <!-- hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4  -->
                    <a class="hiddenanchor" id="toregister"></a>
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">
                        <asp:MultiView ID="MultiView1" runat="server">
                            <asp:View ID="View1" runat="server">
                                <div id="login" class="animate form">

                                    <h1>Log in</h1>
                                    <p>

                                        <asp:Label ID="Label1" runat="server" Text="User Name" for="username" class="uname" data-icon="u"></asp:Label>

                                        <asp:TextBox ID="TextBox1" runat="server" name="username" type="text" placeholder="Your User Name"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="*Required" ForeColor="Red" ValidationGroup="group1"></asp:RequiredFieldValidator>
                                    </p>
                                    <p>

                                        <asp:Label ID="Label2" runat="server" Text="Password" class="youpasswd" data-icon="p"></asp:Label>


                                        <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" placeholder="Your Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="*Required" ForeColor="Red" ValidationGroup="group1"></asp:RequiredFieldValidator>


                                    </p>

                                    <p class="login button">

                                        <asp:Button ID="Button2" runat="server" Text="Login" OnClick="Button2_Click" ValidationGroup="group1" />
                                    </p>
                                    <p class="change_link">
                                        Not a member yet ?

                                        <asp:LinkButton ID="LinkButton1" class="to_register" runat="server" OnClick="LinkButton1_Click">Join Us</asp:LinkButton>
                                    </p>

                                </div>
                            </asp:View>
                            <asp:View ID="View2" runat="server">
                                <div id="Div4" style="border: solid 1px black" class="animate form">
                                    <h1> Sign up </h1>
                               




                                <p> 
                                
                                     <asp:Label ID="Label3" runat="server" Text="Select Your Role" class="uname" data-icon="u"></asp:Label>
       
                                  <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                                            <asp:ListItem Value="0">Course Administrator</asp:ListItem>
                                            <asp:ListItem Value="1">Lecturer</asp:ListItem>
                                            <asp:ListItem Selected="True" Value="2">Industry Personal</asp:ListItem>
                                        </asp:RadioButtonList>
                                
                                </p>
                                <p> 
                                  

                                     <asp:Label ID="Label4" class="youmail" data-icon="e"
                                                        runat="server" Text="User Name"></asp:Label>
                                        <asp:TextBox ID="TextBox3" placeholder="User Name"
                                                        runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3"  Display="Dynamic" runat="server" ControlToValidate="TextBox3" ErrorMessage="*Required" ForeColor="Red" ValidationGroup="group1"></asp:RequiredFieldValidator>
                                    <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="CustomValidator" ControlToValidate="TextBox3" OnServerValidate="CustomValidator1_ServerValidate" ValidationGroup="group1" ForeColor="Red"></asp:CustomValidator>
                                </p>
                                <p> 

                                     <asp:Label ID="Label5" class="youmail" data-icon="e"
                                                        runat="server" Text="E mail"></asp:Label>

                                         <asp:TextBox ID="TextBox4" placeholder="mysupermail@mail.com"
                                                        runat="server"></asp:TextBox>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox4" ErrorMessage="*Invalid Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                        ForeColor="Red"></asp:RegularExpressionValidator>

                                </p>
                                 <p> 
                                   

                                     <asp:Label ID="Label6" class="youmail" data-icon="e"
                                                        runat="server" Text="Linkedin Profile"></asp:Label>

                                         <asp:TextBox ID="TextBox5" placeholder="myname@linkedin.com"
                                                        runat="server"></asp:TextBox>
                  

                                </p>
                                 <p hidden="hidden"> 

                                    <asp:Label ID="Label7"
                                                        runat="server" Text="Upload Profile Picture" class="youmail" data-icon="e" ></asp:Label>
                                         <asp:FileUpload ID="FileUpload1"
                                                        runat="server" />
                                                    <asp:Button ID="Button3"
                                                        runat="server" Text="Upload" OnClick="Button3_Click" />
                                      

                                </p>
                                <p> 
                                    
                                     <asp:Label ID="Label8" class="youpasswd" data-icon="p"
                                                        runat="server" Text="Password"></asp:Label>
                                 
                                          <asp:TextBox ID="TextBox7" placeholder="Password"
                                                        runat="server" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" placeholder="Password" ControlToValidate="TextBox7" ErrorMessage="*Required" ForeColor="Red" ValidationGroup="group2"></asp:RequiredFieldValidator>
                                               
                                </p>
                                <p> 
                               

                                    <asp:Label ID="Label9" class="youpasswd" data-icon="p"
                                                        runat="server" Text="Re-enter Password"></asp:Label>
                                    

                                       <asp:TextBox ID="TextBox8" placeholder="Confirm Password"
                                                        runat="server" TextMode="Password"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox8" Display="Dynamic" ErrorMessage="*Required" ForeColor="Red" ValidationGroup="group2"></asp:RequiredFieldValidator>
                                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox7" ControlToValidate="TextBox8" Display="Dynamic" ErrorMessage="*Password mismatch" ForeColor="Red" ValidationGroup="group2"></asp:CompareValidator>
                                                
                                </p>
                                <p class="signin button"> 
								  <asp:Button ID="Button5"
                                                        runat="server" Text="Submit" OnClick="Button5_Click" ValidationGroup="group2" />
								</p>
                                <p class="change_link">  
									Already a member ?
									 
                                    <asp:LinkButton ID="LinkButton2"  CausesValidation="false" class="to_register" runat="server" OnClick="LinkButton2_Click">Go and log in </asp:LinkButton></p>


                                </div>

                            </asp:View>
                        </asp:MultiView>




                    </div>
                </div>
            </section>
        </div>
    </form>
</body>
</html>
