<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/pages/page_master.Master" CodeBehind="page_adminconsulta.aspx.vb" Inherits="WebCallCenterAutomatizado.page_adminconsulta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../styles/select2.min.css">
    <link rel="stylesheet" href="../styles/summernote-bs4.css">
    <link rel="stylesheet" href="../styles/bootstrap-tagsinput.css">
    <link rel="stylesheet" href="../styles/switchery.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h3>Filtros de búsqueda</h3>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="">
                                        Selección de Tipo de Campaña
                                    </label>
                                    <select class="form-control select2" id="cmb_consulta_tipo" runat="server">
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="">
                                        Selección de Convenio
                                    </label>
                                    <select class="form-control select2" id="cmb_consulta_convenio" runat="server">
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="date">
                                        Fecha desde
                                    </label>
                                    <input type="date" class="form-control" id="dtp_consulta_fechadesde" runat="server">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="date">
                                        Fecha hasta
                                    </label>
                                    <input type="date" class="form-control" id="dtp_consulta_fechahasta" runat="server">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="">
                                        Ejecutiva
                                    </label>
                                    <select class="form-control select2" id="cmb_consulta_ejecutiva" runat="server">
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="card-body template-demo">
                                    <asp:Button type="button" class="btn btn-success btn-block" ID="btn_consultafiltros" runat="server" Text="Consultar">
                                    </asp:Button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <h3>
                                Resultados
                            </h3>
                        </div>
                        <div class="card-body">
                            <table id="data_table" class="table">
                                <thead>
                                    <tr>
                                        <th>Id</th>
                                        <th>Campaña</th>
                                        <th>Fecha</th>
                                        <th></th>
                                        <th class="nosort">&nbsp;</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="rpt_consulta_cabecera" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td>
                                                    <asp:Label runat="server" ID="lbl_consultacabeceraid"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label runat="server" ID="lbl_consultacabeceranombre"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label runat="server" ID="lbl_consultacabecerafecha"></asp:Label>
                                                </td>
                                                <td>
                                                    <div class="table-actions">
                                                        <a href="#"><i class="ik ik-eye"></i></a>
                                                        <a href="#"><i class="ik ik-edit-2"></i></a>
                                                        <a href="#"><i class="ik ik-trash-2"></i></a>
                                                    </div>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header d-block">
                            <h3>
                                <asp:Label ID="lbl_consultacabeceradetalle" runat="server" Text="Detalle"></asp:Label>
                            </h3>
                        </div>
                        <div class="card-body">
                            <div class="dt-responsive" style="overflow-x:scroll;">
                                <table id="alt-pg-dt" class="table table-striped table-bordered nowrap">
                                    <thead>
                                    <tr>
                                        <th>Id Cliente</th>
                                        <th>Cliente</th>
                                        <th>Convenio</th>
                                        <th>Ejecutiva</th>
                                        <th>Telefono Contacto</th>
                                        <th>Placa</th>
                                        <th>Direccion</th>
                                        <th>Email</th>
                                        <th>Celular</th>
                                        <th>Comentario</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="rpt_consultadetalle" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lbl_consultadetalleidcliente" runat="server" Text="Juan Martinez">
                                                        </asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lbl_consultadetallenombre" runat="server" Text="">
                                                        </asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lbl_consultadetalleconvenio" runat="server" Text="">
                                                        </asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lbl_consultadetalleejecutiva" runat="server" Text="">
                                                        </asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lbl_consultadetalletelefonocontacto" runat="server" Text="">
                                                        </asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txt_consultadetalleplaca" runat="server" Text="">
                                                        </asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txt_consultadetalledireccion" runat="server" Text="">
                                                        </asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txt_consultadetalleemail" runat="server" Text="">
                                                        </asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txt_consultadetallecelular" runat="server" Text="">
                                                        </asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txt_consultadetallecomentario" runat="server" Text="">
                                                        </asp:TextBox>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </tbody>
                                    <%--<tfoot>
                                    <tr>
                                        <th>Cliente</th>
                                        <th>Convenio</th>
                                        <th>Ejecutiva</th>
                                        <th>Placa</th>
                                        <th>Direccion</th>
                                        <th>Email</th>
                                        <th>Celular</th>
                                        <th>Comentario</th>
                                    </tr>
                                    </tfoot>--%>
                                </table>
                            </div>
                            <div class="card-body template-demo">
                                <asp:Button type="btn_consulta" id="btn_consultadetallegrabar" class="btn btn-success btn-block" runat="server" Text="Grabar">
                                </asp:Button>
                            </div>
                        </div>
                    </div>
                </div>
            </div> 
        </div>
    <script src="../scripts/datatables.js"></script>
    <script src="../scripts/select2.min.js"></script>
    <script src="../scripts/summernote-bs4.min.js"></script>
    <script src="../scripts/bootstrap-tagsinput.min.js"></script>
    <script src="../scripts/jquery.repeater.min.js"></script>
    <script src="../scripts/switchery.min.js"></script>
    <script src="../scripts/form-advanced.js"></script>
</asp:Content>