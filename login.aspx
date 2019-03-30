<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="SonyWeb_3.login" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <link rel="icon" type="image/png" href="assets/img/favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <title>Sony World</title>

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="assets/css/animate.min.css" rel="stylesheet" />

    <!--  Light Bootstrap Table core CSS    -->
    <link href="assets/css/light-bootstrap-dashboard.css" rel="stylesheet" />


    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="assets/css/demo.css" rel="stylesheet" />


    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
    <link href="assets/css/pe-icon-7-stroke.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="wrapper">
            <div class="sidebar" data-color="purple" data-image="assets/img/sidebar-5.jpg">

                <!--   you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple" -->


                <div class="sidebar-wrapper">
                    <div class="logo">
                        <a href="#" class="simple-text">Sony World
                        </a>
                    </div>


                </div>
            </div>

            <div class="main-panel">
                <nav class="navbar navbar-default navbar-fixed">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example-2">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" href="#">Login</a>
                        </div>

                    </div>
                </nav>


                <div class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="header">
                                        <h4 class="title">Please Enter Your Information</h4>

                                        <asp:Literal ID="lblVal" runat="server"></asp:Literal>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                User Name
                                                   
                                                        <asp:TextBox ID="txtUserName" class="form-control" runat="server"></asp:TextBox>
                                                <%-- <input type="text" class="form-control" placeholder="Username" />--%>
                                                <i class="ace-icon fa fa-user"></i>

                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ControlToValidate="txtUserName" ErrorMessage="*"></asp:RequiredFieldValidator>


                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                Password
                                                   
                                                        <asp:TextBox ID="txtPass" TextMode="Password" class="form-control" runat="server"></asp:TextBox>
                                                <%-- <input type="password" class="form-control" placeholder="Password" />--%>
                                                <i class="ace-icon fa fa-lock"></i>

                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" ControlToValidate="txtPass" ErrorMessage="*"></asp:RequiredFieldValidator>


                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group">

                                                <BotDetect:WebFormsCaptcha ID="ExampleCaptcha" runat="server" />

                                                <asp:TextBox ID="CaptchaCodeTextBox" class="form-control" runat="server"></asp:TextBox>
                                                <%-- <input type="password" class="form-control" placeholder="Password" />--%>
                                            </div>
                                        </div>

                                        <div class="space"></div>

                                        <div class="clearfix">
                                            <label class="inline">
                                                <input type="checkbox" class="ace" />
                                                <span class="lbl">Remember Me</span>
                                            </label>
                                            <i class="ace-icon fa fa-key"></i>
                                            <asp:Button ID="btnLogin" class="btn btn-info btn-fill pull-right" runat="server" Text="Login" CausesValidation="true" OnClick="btnLogin_Click" />

                                        </div>

                                        <div class="space-4"></div>
                                        </fieldset>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <footer class="footer">
                    <div class="container-fluid">
                        <p class="copyright pull-right">
                            © 2017 <a href="#">Riddhi-Edu Soft</a>
                        </p>
                    </div>
                </footer>


            </div>
        </div>
    </form>
    <!--   Core JS Files   -->
    <script src="assets/js/jquery-1.10.2.js" type="text/javascript"></script>
    <script src="assets/js/bootstrap.min.js" type="text/javascript"></script>

    <!--  Checkbox, Radio & Switch Plugins -->
    <script src="assets/js/bootstrap-checkbox-radio-switch.js"></script>

    <!--  Charts Plugin -->
    <script src="assets/js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="assets/js/bootstrap-notify.js"></script>

    <!--  Google Maps Plugin    -->
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>

    <!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
    <script src="assets/js/light-bootstrap-dashboard.js"></script>

    <!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
    <script src="assets/js/demo.js"></script>
</body>




</html>


