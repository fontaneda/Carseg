<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="page_login.aspx.vb" Inherits="WebCallCenterAutomatizado.page_login" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta charset="utf-8"/>
    <meta http-equiv="x-ua-compatible" content="ie=edge"/>
    <title>Hunter - CallCenter Autmatizacion</title>
    <meta name="description" content=""/>
    <meta name="keywords" content=""/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:300,400,600,700,800" rel="stylesheet"/>
    <link rel="icon" href="../images/icons/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="../styles/bootstrap.min.css"/>
    <link rel="stylesheet" href="../styles/all.min.css"/>
    <link rel="stylesheet" href="../styles/ionicons.min.css"/>
    <link rel="stylesheet" href="../styles/iconkit.min.css"/>
    <link rel="stylesheet" href="../styles/perfect-scrollbar.css"/>
    <link rel="stylesheet" href="../styles/theme.min.css"/>
    <link rel="stylesheet" href="../styles/style_custom.css" />
    <script src="../scripts/modernizr-2.8.3.min.js"></script>
</head>
<body>
    <div class="auth-wrapper">
        <div class="container-fluid h-100">
            <div class="row flex-row h-100 bg-white">
                <div class="col-xl-8 col-lg-6 col-md-5 p-0 d-md-block d-lg-block d-sm-none d-none">
                    <div class="lavalite-bg" style="background-image: url('../images/bg/login-bg.jpg')">
                        <div class="lavalite-overlay"></div>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-6 col-md-7 my-auto p-0">
                    <div class="authentication-form mx-auto">
                        <div class="logo-centered">
                            <a href="../pages/page_login.aspx">
                                <img src="../images/svg/brand.svg" alt=""/>
                            </a>
                        </div>
                        <h3>Inicia sesión en Hunter/CallCenter</h3>
                        <form runat="server">
                            <div class="form-group">
                                <asp:TextBox runat="server" ID="txt_loginusuario" AutoCompleteType="DisplayName" class="form-control" MaxLength="6" placeholder="Email" required >
                                </asp:TextBox>
                                <i class="ik ik-user"></i>
                            </div>
                            <div class="form-group">
                                <asp:TextBox runat="server" ID="txt_logincontrasenia" type="password" class="form-control" MaxLength="15" placeholder="Contraseña" required >
                                </asp:TextBox>
                                <i class="ik ik-lock"></i>
                            </div>
                            <div class="row">
                                <div class="col text-left">
                                    <label class="custom-control custom-checkbox">
                                        <%--<asp:CheckBox ID="chk_loginrecordar" runat="server" Text="Recordar datos de inicio de sesión" class="custom-control-input" />--%>
                                        <input type="checkbox" class="custom-control-input" id="item_checkbox" name="item_checkbox" value="option1" runat="server" />
                                        <span class="custom-control-label">&nbsp;Recordar datos de inicio de sesión</span>
                                    </label>
                                </div>
                            </div>
                            <div class="sign-btn text-center">
                                <asp:button runat="server" ID="btn_loginsesion" class="btn btn-theme" Text="Ingresar">
                                </asp:button>
                            </div>
                            <div id="myModal" class="modal" runat="server">
                                <div class="modal-content">
                                    <span>
                                    <asp:Label ID="lbl_loginmodaltitulo" runat="server" Text="Mensaje del sistema" CssClass="titulo" >
                                    </asp:Label>
                                        <asp:Button ID="btn_loginmodalclose" runat="server" Text="X" BorderWidth="0px" CssClass="close" />
                                    </span>
                                    <hr class="linea" />
                                    <p>
                                        <asp:Label ID="txt_loginmodaltexto" runat="server" Text="">
                                        </asp:Label>
                                    </p>
                                </div>
                            </div>
                        </form>
                        <div class="register">
                            <p>Recuerda <a href="#l">usar tus credenciales del 3S turnos</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script>window.jQuery || document.write('<script src="../scripts/jquery-3.3.1.min.js"><\/script>')</script>
    <script src="../scripts/popper.min.js"></script>
    <script src="../scripts/bootstrap.min.js"></script>
    <script src="../scripts/perfect-scrollbar.min.js"></script>
    <script src="../scripts/screenfull.js"></script>
    <script src="../scripts/theme.min.js"></script>
</body>
</html>