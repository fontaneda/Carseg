<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/pages/page_master.Master" CodeBehind="page_admincampania.aspx.vb" Inherits="WebCallCenterAutomatizado.page_admincampania" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h3>Filtros</h3>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="">
                                    Selección de Campaña
                                </label>
                                <select class="form-control select2" id="cmb_creacionfiltrocampania" runat="server">
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="">
                                    Mes
                                </label>
                                <select class="form-control select2" id="cmb_creacionfiltromes" runat="server">
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="">
                                    Convenio
                                </label>
                                <select class="form-control select2" id="cmb_creacionfiltroconvenio" runat="server">
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="">
                                    Tipo de datos
                                </label>
                                <select class="form-control select2" id="cmb_creacionfiltrodatos" runat="server">
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card-body template-demo">
                                <asp:Button type="button" class="btn btn-success btn-block" ID="btn_creacionfiltros" runat="server" Text="Consultar">
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
                    <div class="card-header d-block">
                        <div class="input-group input-group-warning">
                            <span class="input-group-prepend"><label class="input-group-text"><i class="ik ik-clipboard"></i></label></span>
                            <asp:TextBox ID="txt_creacioncabeceracampania" runat="server" Text="" class="form-control" placeholder="Coloque nombre de la campaña">
                            </asp:TextBox>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="dt-responsive" style="overflow-x:scroll;">
                            <table id="alt-pg-dt" class="table table-striped table-bordered nowrap">
                                <thead>
                                <tr>
                                    <th>Ejecutiva</th>
                                    <th>Id cliente</th>
                                    <th>Nombres completos</th>
                                    <th>Código vehículo</th>
                                    <th>Placa</th>
                                    <th>Marca</th>
                                    <th>Modelo</th>
                                    <th>Producto</th>
                                    <th>Aseguradora</th>
                                    <th>Concesionario</th>
                                    <th>Financiera</th>
                                    <th>Inicio cobertura</th>
                                    <th>Fin cobertura</th>
                                    <th>Ejecutiva servicio</th>
                                    <th>Ejecutiva gestión</th>
                                    <th>Ejecutiva renovación</th>
                                    <th>Ejecutiva referencia</th>
                                    <th>Vendedor concesionario</th>
                                    <th>Estado dispositivo</th>
                                    <th>Oficina creación</th>
                                    <th>Dirección domicilio</th>
                                    <th>Dirección oficina</th>
                                    <th>Dirección infohunter</th>
                                    <th>Teléfono convencional</th>
                                    <th>Teléfono celular</th>
                                    <th>Otro celular</th>
                                    <th>Email</th>
                                    <th>Monitoreo cliente</th>
                                    <th>Monitoreo dirección</th>
                                    <th>Monitoreo telefono</th>
                                    <th>Monitoreo celular</th>
                                    <th>Trabajada</th>
                                    <th>Dispositivo facturado</th>
                                    <th>Dispositivo cobrado</th>
                                    <th>Dispositivo instalado</th>
                                    <th>Convenio</th>
                                </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="rpt_creaciondetalle" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td>
                                                    <select class="form-control select2" id="cmb_creaciondetalleejecutiva" runat="server">
                                                    </select>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetalleidcliente" runat="server" Text="">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetallenombrecliente" runat="server" Text="">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetallecodivehiculo" runat="server" Text="">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetalleplaca" runat="server" Text="">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetallemarca" runat="server" Text="">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetallemodelo" runat="server" Text="">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetalleproducto" runat="server" Text="">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetalleaseguradora" runat="server" Text="">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetalleconcesionario" runat="server" Text="">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetallefinanciera" runat="server" Text="">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetalleiniciocobertura" runat="server" Text="">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetallefincobertura" runat="server" Text="">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetalleejecservicio" runat="server" Text="">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetalleejecgestion" runat="server" Text="">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetalleejecrenovacion" runat="server" Text="">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetalleejecreferencia" runat="server" Text="">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetallevendedorconces" runat="server" Text="">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetalleestadodispositivo" runat="server" Text="">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetalleoficinacrea" runat="server" Text="">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetalledireccdomicilio" runat="server" Text="">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetalledireccoficina" runat="server" Text="">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetalledireccinfohunter" runat="server" Text="">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetalletelefono" runat="server" Text="">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetallecelular" runat="server" Text="">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetalleotrocelular" runat="server" Text="">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetalleemail" runat="server" Text="">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetallemonitoreocliente" runat="server" Text="">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetallemonitoreodirecc" runat="server" Text="">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetallemonitoreotelefono" runat="server" Text="">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetallemonitporeocelular" runat="server" Text="">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetalletrabajada" runat="server" Text="">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetalledispositivofact" runat="server" Text="">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetalledispositivocobr" runat="server" Text="">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetalledispositivoinst" runat="server" Text="">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetalleconvenio" runat="server" Text="">
                                                    </asp:Label>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                               <%-- <tfoot>
                                <tr>
                                    <th>Ejecutiva</th>
                                    <th>Id cliente</th>
                                    <th>Nombres completos</th>
                                    <th>Código vehículo</th>
                                    <th>Placa</th>
                                    <th>Marca</th>
                                    <th>Modelo</th>
                                    <th>Producto</th>
                                    <th>Aseguradora</th>
                                    <th>Concesionario</th>
                                    <th>Financiera</th>
                                    <th>Inicio cobertura</th>
                                    <th>Fin cobertura</th>
                                    <th>Ejecutiva servicio</th>
                                    <th>Ejecutiva gestión</th>
                                    <th>Ejecutiva renovación</th>
                                    <th>Ejecutiva referencia</th>
                                    <th>Vendedor concesionario</th>
                                    <th>Estado dispositivo</th>
                                    <th>Oficina creación</th>
                                    <th>Dirección domicilio</th>
                                    <th>Dirección oficina</th>
                                    <th>Dirección infohunter</th>
                                    <th>Teléfono convencional</th>
                                    <th>Teléfono celular</th>
                                    <th>Otro celular</th>
                                    <th>Email</th>
                                    <th>Monitoreo cliente</th>
                                    <th>Monitoreo dirección</th>
                                    <th>Monitoreo telefono</th>
                                    <th>Monitoreo celular</th>
                                    <th>Trabajada</th>
                                    <th>Dispositivo facturado</th>
                                    <th>Dispositivo cobrado</th>
                                    <th>Dispositivo instalado</th>
                                    <th>Convenio</th>
                                </tr>
                                </tfoot>--%>
                            </table>
                        </div>
                        <div class="card-body template-demo">
                            <asp:Button type="btn_consulta" id="btn_consultadetallegrabar" class="btn btn-warning btn-block" runat="server" Text="Grabar">
                            </asp:Button>
                        </div>
                    </div>
                </div>
            </div>
        </div> 
    </div>
</asp:Content>
