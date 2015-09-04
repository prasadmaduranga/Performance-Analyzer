<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login2.aspx.cs" Inherits="PerformanceAnalyzer2.Login2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

 <head runat="server">
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
        <div class="container">
            <!-- Codrops top bar -->
            <div class="codrops-top">
                
              
                <div class="clr"></div>
            </div><!--/ Codrops top bar -->
            <header>
               
                
                <div><h1><div><asp:Image ID="Image1" runat="server" Height="115px" Width="105px" ImageUrl="Images/imagefinal5.png"/></div>Grade Performance Analyzer</h1></div>
              
            </header>
            <section>				
                <div id="container_demo" >
                    <!-- hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4  -->
                    <a class="hiddenanchor" id="toregister"></a>
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">
                        <div id="login" class="animate form">
                            <form  action="mysuperscript.php" autocomplete="on"> 
                                <h1>Log in</h1> 
                                <p> 
                            <%--        <label for="username" class="uname" data-icon="u" > Your email or username </label>--%>
                                     <asp:Label ID="Label1" runat="server" Text="User Name" for="username" class="uname" data-icon="u"></asp:Label>
        <%--                            <input id="username" name="username" required="required" type="text" placeholder="myusername or mymail@mail.com"/>--%>

                                     <asp:TextBox ID="TextBox1" runat="server" name="username"  type="text" placeholder="myusername or mymail@mail.com"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="*Required" ForeColor="Red" ValidationGroup="group1"></asp:RequiredFieldValidator>
                                </p>
                                <p> 
                                   <%-- <label for="password" class="youpasswd" data-icon="p"> Your password </label>--%>
                                     <asp:Label ID="Label2" runat="server" Text="Password"  class="youpasswd" data-icon="p"></asp:Label>

                                    <%--<input id="password" name="password" required="required" type="password" placeholder="eg. X8df!90EO" /> 
                                    --%> 
                                     <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"  placeholder="Password" ></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="*Required" ForeColor="Red" ValidationGroup="group1"></asp:RequiredFieldValidator>
                                       
                                
                                </p>
                               
                                <p class="login button"> 
                                
                                                   <asp:Button ID="Button2" runat="server" Text="Login" OnClick="Button2_Click" ValidationGroup="group1" />
								</p>
                                <p class="change_link">
									Not a member yet ?
									<a href="#toregister" class="to_register">Join us</a>
								</p>
                            </form>
                        </div>

                        <div id="register" class="animate form">
                            <form  action="mysuperscript.php" autocomplete="on"> 
                                <h1> Sign up </h1> 
                                <p> 
                                    <label for="usernamesignup" class="uname" data-icon="u">Your username</label>
                                    <input id="usernamesignup" name="usernamesignup" required="required" type="text" placeholder="mysuperusername690" />
                                </p>
                                <p> 
                                    <label for="emailsignup" class="youmail" data-icon="e" > Your email</label>
                                    <input id="emailsignup" name="emailsignup" required="required" type="email" placeholder="mysupermail@mail.com"/> 
                                </p>
                                <p> 
                                    <label for="passwordsignup" class="youpasswd" data-icon="p">Your password </label>
                                    <input id="passwordsignup" name="passwordsignup" required="required" type="password" placeholder="eg. X8df!90EO"/>
                                </p>
                                <p> 
                                    <label for="passwordsignup_confirm" class="youpasswd" data-icon="p">Please confirm your password </label>
                                    <input id="passwordsignup_confirm" name="passwordsignup_confirm" required="required" type="password" placeholder="eg. X8df!90EO"/>
                                </p>
                                <p class="signin button"> 
									<input type="submit" value="Sign up"/> 
								</p>
                                <p class="change_link">  
									Already a member ?
									<a href="#tologin" class="to_register"> Go and log in </a>
								</p>
                            </form>
                        </div>
						
                    </div>
                </div>  
            </section>
        </div>
    </body>
</html>