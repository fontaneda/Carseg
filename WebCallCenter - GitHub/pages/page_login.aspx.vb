Imports System.CodeDom
Imports System.Reflection

Public Class page_login
    Inherits System.Web.UI.Page

#Region "Eventos de la pagina"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            cierra_sesion()
            If Request.Cookies("cc_usuario") IsNot Nothing Then
                txt_loginusuario.Text = Request.Cookies("cc_usuario").Value
            Else
                txt_loginusuario.Focus()
            End If
            If Request.Cookies("cc_contrasenia") IsNot Nothing Then
                txt_logincontrasenia.Attributes.Add("value", Request.Cookies("cc_contrasenia").Value)
            End If
            If Request.Cookies("cc_usuario") IsNot Nothing AndAlso Request.Cookies("cc_contrasenia") IsNot Nothing Then
                chk_loginrecordar.Checked = True
            End If
        End If
    End Sub

#End Region

#Region "Eventos de los controles"

    Private Sub btn_loginsesion_Click(sender As Object, e As EventArgs) Handles btn_loginsesion.Click
        Dim resultado As String = valida()
        If resultado = "" Then
            login()
        Else
            mensaje(resultado)
        End If
    End Sub

#End Region

#Region "Procedimientos generales"

    Private Sub login()
        Dim clase As New class_coneccion
        Dim dTCstGeneral As New System.Data.DataSet
        dTCstGeneral = clase.consulta_login(txt_loginusuario.Text, txt_logincontrasenia.Text)
        If dTCstGeneral.Tables.Count > 0 Then
            If dTCstGeneral.Tables(0).Rows.Count > 0 Then
                For i As Integer = 0 To dTCstGeneral.Tables(0).Rows.Count - 1
                    Dim mensaje_retorno As String = dTCstGeneral.Tables(0).Rows(i).Item("MENSAJE").ToString
                    Dim tipo_retorno As String = dTCstGeneral.Tables(0).Rows(i).Item("TIPO").ToString
                    If mensaje_retorno = "" Then
                        Session("usr_login") = txt_loginusuario.Text
                        Session("dt_login") = dTCstGeneral
                        Session("usr_tipo") = tipo_retorno
                        If tipo_retorno = "ADM" Then
                            guarda_inicio_sesion()
                            Response.Redirect("page_admintablero.aspx")
                        ElseIf tipo_retorno = "OPE" Then
                            guarda_inicio_sesion()
                            Response.Redirect("page_adminconsulta")
                        Else
                            mensaje(ConfigurationManager.AppSettings.Get("str_NoAcceso").ToString())
                        End If
                    Else
                        mensaje(mensaje_retorno)
                        If mensaje_retorno = "PWDI" Then
                            mensaje(ConfigurationManager.AppSettings.Get("str_PwdIncorrectobase").ToString())
                        ElseIf mensaje_retorno = "USRI" Then
                            mensaje(ConfigurationManager.AppSettings.Get("str_UsrInactivo").ToString())
                        ElseIf mensaje_retorno = "USRN" Then
                            mensaje(ConfigurationManager.AppSettings.Get("str_UsrnoPermiso").ToString())
                        ElseIf mensaje_retorno = "PWDC" Then
                            mensaje(ConfigurationManager.AppSettings.Get("str_PwdCaducada").ToString())
                        ElseIf mensaje_retorno = "USRV" Then
                            mensaje(ConfigurationManager.AppSettings.Get("str_UsrCaducado").ToString())
                        End If
                    End If
                Next
            Else
                mensaje(ConfigurationManager.AppSettings.Get("str_NoDatos").ToString())
            End If
        Else
            mensaje(ConfigurationManager.AppSettings.Get("str_NoDatos").ToString())
        End If
    End Sub

    Private Sub btn_loginmodalclose_Click(sender As Object, e As EventArgs) Handles btn_loginmodalclose.Click
        myModal.Attributes("Style") = "display: none;"
    End Sub

    Private Function valida() As String
        Dim retorno As String = ""
        If txt_loginusuario.Text = "" Then
            retorno = ConfigurationManager.AppSettings.Get("str_UsrIncorrecto").ToString()
        ElseIf txt_logincontrasenia.Text = "" Then
            retorno = ConfigurationManager.AppSettings.Get("str_PwdIncorrecto").ToString()
        ElseIf txt_loginusuario.Text.Length <> 6 Then
            retorno = ConfigurationManager.AppSettings.Get("str_UsrFormato").ToString()
        End If
        Return retorno
    End Function

    Private Sub mensaje(texto As String)
        txt_loginmodaltexto.Text = texto
        myModal.Attributes("Style") = "display: block;"
    End Sub

    Private Sub cierra_sesion()
        Session("usr_login") = ""
        Session("dt_login") = ""
        Session("usr_tipo") = ""
    End Sub

    Private Sub guarda_inicio_sesion()
        If chk_loginrecordar.Checked Then
            Response.Cookies("cc_usuario").Value = txt_loginusuario.Text
            Response.Cookies("cc_usuario").Expires = DateAndTime.Now.AddDays(150)
            Response.Cookies("cc_contrasenia").Value = txt_logincontrasenia.Text
            Response.Cookies("cc_contrasenia").Expires = DateAndTime.Now.AddDays(150)
        Else
            Response.Cookies("cc_usuario").Expires = DateAndTime.Now.AddDays(-1)
            Response.Cookies("cc_contrasenia").Expires = DateAndTime.Now.AddDays(-1)
        End If
    End Sub

#End Region

End Class