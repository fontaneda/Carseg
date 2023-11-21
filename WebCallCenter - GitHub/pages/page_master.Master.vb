Imports System.Runtime.CompilerServices

Public Class page_master
    Inherits System.Web.UI.MasterPage

#Region "Eventos de la pagina Master"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Session("usr_login") = "" Then
                Response.Redirect("page_login.aspx")
            End If
        End If
    End Sub

#End Region

#Region "Eventos de los menu"

    Private Sub btn_mnu_consulta_Click(sender As Object, e As EventArgs) Handles btn_mnu_consulta.Click
        Dim pagina_hija As String = ContentPlaceHolder1.Page.GetType.FullName
        If pagina_hija <> "ASP.pages_page_admintablero_aspx" Then
            Response.Redirect("page_adminconsulta.aspx")
        End If
    End Sub

    Private Sub btn_mnu_creacion_Click(sender As Object, e As EventArgs) Handles btn_mnu_creacion.Click
        If Session("usr_tipo") = "ADM" Then
            Dim pagina_hija As String = ContentPlaceHolder1.Page.GetType.FullName
            If pagina_hija <> "ASP.pages_page_admincampania_aspx" Then
                Response.Redirect("page_admincampania.aspx")
            End If
        Else
            mostrar_mensaje(ConfigurationManager.AppSettings.Get("str_NoAcceso").ToString())
        End If
    End Sub

    Private Sub btn_mnu_tablero_Click(sender As Object, e As EventArgs) Handles btn_mnu_tablero.Click
        If Session("usr_tipo") = "ADM" Then
            Dim pagina_hija As String = ContentPlaceHolder1.Page.GetType.FullName
            If pagina_hija <> "ASP.pages_page_admintablero_aspx" Then
                Response.Redirect("page_admintablero.aspx")
            End If
        Else
            mostrar_mensaje(ConfigurationManager.AppSettings.Get("str_NoAcceso").ToString())
        End If
    End Sub

    Private Sub btnm_master_itmcerrarsesion_Click(sender As Object, e As EventArgs) Handles btnm_master_itmcerrarsesion.Click
        Response.Redirect("page_login.aspx")
    End Sub

    Private Sub btn_master_itmconfiguracion_Click(sender As Object, e As EventArgs) Handles btn_master_itmconfiguracion.Click
        mostrar_mensaje(ConfigurationManager.AppSettings.Get("str_NoDisponible").ToString())
    End Sub

    Private Sub btn_master_itmperfil_Click(sender As Object, e As EventArgs) Handles btn_master_itmperfil.Click
        mostrar_mensaje(ConfigurationManager.AppSettings.Get("str_NoDisponible").ToString())
    End Sub

    Private Sub btn_mnu_consultaavanzada_Click(sender As Object, e As EventArgs) Handles btn_mnu_consultaavanzada.Click
        Dim pagina_hija As String = ContentPlaceHolder1.Page.GetType.FullName
        If pagina_hija <> "ASP.pages_page_admintablero_aspx" Then
            Response.Redirect("page_adminconsultaavanzada.aspx")
        End If
    End Sub

    Private Sub btn_mnu_reporte_Click(sender As Object, e As EventArgs) Handles btn_mnu_reporte.Click
        Dim pagina_hija As String = ContentPlaceHolder1.Page.GetType.FullName
        If pagina_hija <> "ASP.pages_page_admintablero_aspx" Then
            Response.Redirect("page_reporte.aspx")
        End If
    End Sub

#End Region

#Region "Modal mensaje"

    Private Sub btn_mastermodalclose_Click(sender As Object, e As EventArgs) Handles btn_mastermodalclose.Click
        ocultar_mensaje()
    End Sub

    Public Sub mostrar_mensaje(texto As String)
        txt_mastermodaltexto.Text = texto
        myModalmaster.Attributes("Style") = "display: block;"
    End Sub

    Public Sub ocultar_mensaje()
        myModalmaster.Attributes("Style") = "display: none;"
    End Sub

#End Region

End Class