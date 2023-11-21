Public Class page_admincampania
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

    Private Sub cmb_creacionfiltroconvenios_ServerChange(sender As Object, e As EventArgs) Handles cmb_creacionfiltroconvenios.SelectedIndexChanged
        Dim clase As New class_coneccion
        Dim dTCstGeneral As New System.Data.DataSet
        dTCstGeneral = clase.consulta_creacion_inicial(1, Session("usr_login"), cmb_creacionfiltroconvenios.SelectedValue)
        If dTCstGeneral.Tables.Count > 0 Then
            If dTCstGeneral.Tables(0).Rows.Count > 0 Then
                cmb_creacionfiltrocampanias.DataSource = dTCstGeneral.Tables(0)
                cmb_creacionfiltrocampanias.DataValueField = "CODIGO"
                cmb_creacionfiltrocampanias.DataTextField = "DESCRIPCION"
                cmb_creacionfiltrocampanias.DataBind()
            Else
                mensaje_master(ConfigurationManager.AppSettings.Get("str_NoDatos").ToString())
            End If
        End If
    End Sub

    Private Sub btn_creacionfiltros_Click(sender As Object, e As EventArgs) Handles btn_creacionfiltros.Click
        Dim clase As New class_coneccion
        Dim dTCstGeneral As New System.Data.DataSet
        dTCstGeneral = clase.consulta_creacion_filtrado(3, Session("usr_login"), cmb_creacionfiltroconvenios.SelectedValue,
                                                        cmb_creacionfiltrocampanias.SelectedValue, cmb_creacionfiltromeses.SelectedValue)
        If dTCstGeneral.Tables.Count > 0 Then
            If dTCstGeneral.Tables(0).Rows.Count > 0 Then
                rpt_creaciondetalle.DataSource = dTCstGeneral.Tables(0)
                rpt_creaciondetalle.DataBind()
            Else
                mensaje_master(ConfigurationManager.AppSettings.Get("str_NoDatos").ToString())
            End If
        End If
    End Sub

    Private Sub btn_consultadetallegrabar_Click(sender As Object, e As EventArgs) Handles btn_consultadetallegrabar.Click

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
        dTCstGeneral = clase.consulta_creacion_inicial(1, Session("usr_login"), "TODOS")
        If dTCstGeneral.Tables.Count > 0 Then
            If dTCstGeneral.Tables(0).Rows.Count > 0 Then
                cmb_creacionfiltrocampanias.DataSource = dTCstGeneral.Tables(0)
                cmb_creacionfiltrocampanias.DataValueField = "CODIGO"
                cmb_creacionfiltrocampanias.DataTextField = "DESCRIPCION"
                cmb_creacionfiltrocampanias.DataBind()
            Else
                mensaje_master(ConfigurationManager.AppSettings.Get("str_NoDatos").ToString())
            End If
            If dTCstGeneral.Tables(1).Rows.Count > 0 Then
                cmb_creacionfiltroconvenios.DataSource = dTCstGeneral.Tables(1)
                cmb_creacionfiltroconvenios.DataValueField = "CODIGO"
                cmb_creacionfiltroconvenios.DataTextField = "DESCRIPCION"
                cmb_creacionfiltroconvenios.DataBind()
            Else
                mensaje_master(ConfigurationManager.AppSettings.Get("str_NoDatos").ToString())
            End If
            If dTCstGeneral.Tables(2).Rows.Count > 0 Then
                cmb_creacionfiltromeses.DataSource = dTCstGeneral.Tables(2)
                cmb_creacionfiltromeses.DataValueField = "CODIGO"
                cmb_creacionfiltromeses.DataTextField = "DESCRIPCION"
                cmb_creacionfiltromeses.DataBind()
            Else
                mensaje_master(ConfigurationManager.AppSettings.Get("str_NoDatos").ToString())
            End If
        Else
            mensaje_master(ConfigurationManager.AppSettings.Get("str_NoDatos").ToString())
        End If
    End Sub

#End Region

End Class