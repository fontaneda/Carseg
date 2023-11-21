Public Class page_admintablero
    Inherits System.Web.UI.Page

#Region "Eventos de la pagina"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Session("usr_login") <> "" Then
                If Session("usr_tipo") = "ADM" Then
                    datos_inicial()
                Else
                    mensaje_master(ConfigurationManager.AppSettings.Get("str_NoAcceso").ToString())
                    Response.Redirect("page_login.aspx")
                End If
            Else
                mensaje_master(ConfigurationManager.AppSettings.Get("str_SesionCaducada").ToString())
                Response.Redirect("page_login.aspx")
            End If
        End If

    End Sub

#End Region

#Region "Eventos de los controles"

    Private Function descargar_archivo() As Integer
        Dim retorno As Integer = 0
        Try
            'formato de archivo y extension
            retorno = 1
        Catch ex As Exception
            retorno = 0
            mensaje_master(ConfigurationManager.AppSettings.Get("str_errorProceso").ToString())
        End Try
        Return retorno
    End Function

    Private Sub acc_tablerodescargar_ServerClick(sender As Object, e As EventArgs) Handles acc_tablerodescargar.ServerClick
        Dim contador, checks, success As Integer
        contador = rpt_tablero_grid.Items.Count
        checks = 0
        success = 0
        If contador > 0 Then
            For Each itm As RepeaterItem In rpt_tablero_grid.Items
                Dim chkcheck_ As HtmlInputCheckBox = CType(itm.FindControl("item_checkbox"), HtmlInputCheckBox)
                If chkcheck_.Checked Then
                    checks += 1
                    success += descargar_archivo()
                    chkcheck_.Checked = False
                End If
            Next
            If checks <= 0 Then
                mensaje_master(ConfigurationManager.AppSettings.Get("str_SinSeleccion").ToString())
            ElseIf success = checks Then
                mensaje_master(ConfigurationManager.AppSettings.Get("str_correctoProceso").ToString())
            End If
        Else
            mensaje_master(ConfigurationManager.AppSettings.Get("str_SinRegistros").ToString())
        End If
    End Sub


#End Region

#Region "Procedimientos generales"

    Private Sub mensaje_master(mensaje As String)
        Dim myMasterPage As page_master = CType(Page.Master, page_master)
        myMasterPage.mostrar_mensaje(mensaje)
    End Sub

    Private Sub datos_inicial()
        Dim clase As New class_coneccion
        Dim dTCstGeneral As New System.Data.DataSet
        dTCstGeneral = clase.consulta_tablero(Session("usr_login"))
        If dTCstGeneral.Tables.Count > 0 Then
            If dTCstGeneral.Tables(0).Rows.Count > 0 Then
                Dim total_campanias As Integer = dTCstGeneral.Tables(0).Rows(0).Item(1)
                Dim total_completos As Integer = dTCstGeneral.Tables(0).Rows(1).Item(1)
                Dim total_actualiza As Integer = dTCstGeneral.Tables(0).Rows(2).Item(1)
                Dim total_novedades As Integer = dTCstGeneral.Tables(0).Rows(3).Item(1)
                Dim total_registros As Integer = dTCstGeneral.Tables(0).Rows(4).Item(1)
                Dim porcentaje_completo As Integer = total_completos / IIf(total_campanias = 0, 1, total_campanias) * 100
                Dim porcentaje_actualizado As Integer = total_actualiza / IIf(total_registros = 0, 1, total_registros) * 100
                Dim porcentaje_novedad As Integer = total_novedades / IIf(total_actualiza = 0, 1, total_actualiza) * 100
                lbl_tablerocampaniacompletas.Text = total_completos
                lbl_tablerototalcampania.Text = total_campanias
                lbl_tableroregistros.Text = total_actualiza
                lbl_tableronovedades.Text = total_novedades
                dv_tablerototalcampania.Attributes("Style") = "width: 100%;"
                dv_tablerocampaniascompletas.Attributes("Style") = "width: " & porcentaje_completo & "%;"
                dv_tableroregistros.Attributes("Style") = "width: " & porcentaje_actualizado & "%;"
                dv_tableronovedades.Attributes("Style") = "width: " & porcentaje_novedad & "%;"
            Else
                mensaje_master(ConfigurationManager.AppSettings.Get("str_NoDatos").ToString())
            End If
            If dTCstGeneral.Tables(1).Rows.Count > 0 Then
                Me.rpt_tablero_grid.DataSource = dTCstGeneral.Tables(1)
                Me.rpt_tablero_grid.DataBind()
            Else
                mensaje_master(ConfigurationManager.AppSettings.Get("str_SinDatos").ToString())
            End If
        Else
            mensaje_master(ConfigurationManager.AppSettings.Get("str_NoDatos").ToString())
        End If
    End Sub

#End Region

End Class