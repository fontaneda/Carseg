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
                                    Convenio
                                </label> 
                                <asp:DropDownList CssClass="form-control select2" ID="cmb_creacionfiltroconvenios" runat="server" AutoPostBack="true" >
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="">
                                    Mes
                                </label>
                                <asp:DropDownList CssClass="form-control select2" ID="cmb_creacionfiltromeses" runat="server" AutoPostBack="false" >
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="">
                                    Selección de Campaña
                                </label>
                                <asp:DropDownList CssClass="form-control select2" ID="cmb_creacionfiltrocampanias" runat="server" AutoPostBack="false" >
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-6">
                           <%-- <div class="form-group">
                                <label for="">
                                    Tipo de datos
                                </label>
                                <select class="form-control select2" id="cmb_creacionfiltrodatos" runat="server">
                                </select>buen
                            </div>--%>
                            <div class="card-body template-demo">
                                <asp:Button type="button" class="btn btn-success btn-block" ID="btn_creacionfiltros" runat="server" Text="Consultar">
                                </asp:Button>
                            </div>
                        </div>
                        <div class="col-md-6">
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
              
                        <div class="row">
                            <div class="col-md-6">
                                <div class="input-group input-group-warning">
                                    <span class="input-group-prepend"><label class="input-group-text"><i class="ik ik-users"></i></label></span>
                                    <asp:DropDownList CssClass="form-control select2" ID="cmb_creacionagentecampania" runat="server" AutoPostBack="false" >
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="input-group input-group-warning">
                                    <span class="input-group-prepend"><label class="input-group-text"><i class="ik ik-slack"></i></label></span>
                                    <asp:TextBox ID="txt_creacioncantidadcampania" runat="server" Text="" class="form-control" placeholder="Coloque cantidad de clientes">
                                    </asp:TextBox>
                                    <asp:Button type="button" class="btn btn-warning" ID="btn_creacionasigna" runat="server" Text="Asignar" Width="100px" Style="margin:2px 0 0 50px;" >
                                    </asp:Button>
                                </div>
                            </div>
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
                                    <th>Fin cobertura</th>
                                    <th>Ejecutiva servicio</th>
                                    <th>Ejecutiva renovación</th>
                                    <th>Ejecutiva referencia</th>
                                    <th>Vendedor concesionario</th>
                                    <th>Oficina creación</th>
                                    <th>Dirección domicilio</th>
                                    <th>Email</th>
                                    <th>Teléfono convencional</th>
                                    <th>Teléfono celular</th>
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
                                                    <asp:Label ID="lbl_creaciondetalleidcliente" text='<%# Eval("CODIGO_CLIENTE")%>' runat="server">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetallenombrecliente" text='<%# Eval("NOMBRE_CLIENTE")%>' runat="server">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetallecodivehiculo" text='<%# Eval("CODIGO_VEHICULO")%>' runat="server">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetalleplaca" text='<%# Eval("PLACA")%>' runat="server">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetallemarca" text='<%# Eval("VEHICULO_MARCA")%>' runat="server">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetallemodelo" text='<%# Eval("VEHICULO_MODELO")%>' runat="server">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetalleproducto" text='<%# Eval("PRODUCTO")%>' runat="server">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetalleaseguradora" text='<%# Eval("ASEGURADORA")%>' runat="server">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetalleconcesionario" text='<%# Eval("CONCESIONARIO")%>' runat="server">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetallefinanciera" text='<%# Eval("FINANCIERA")%>' runat="server">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetallefincobertura" text='<%# Eval("FIN_COBERTURA")%>' runat="server">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetalleejecservicio" text='<%# Eval("EJECUTIVO_SERVICIO")%>' runat="server">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetalleejecrenovacion" text='<%# Eval("EJECUTIVO_RENOVACION")%>' runat="server">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetalleejecreferencia" text='<%# Eval("EJECUTIVO_INICIO_GESTION")%>' runat="server">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetallevendedorconces" text='<%# Eval("VENDEDOR_CONSEC")%>' runat="server">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetalleoficinacrea" text='<%# Eval("OFICINA")%>' runat="server">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetalledireccdomicilio" text='<%# Eval("DIRECCION_DOMICILIO")%>' runat="server">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetalleemail" text='<%# Eval("EMAIL")%>' runat="server">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetalletelefono" text='<%# Eval("TELEFONO")%>' runat="server">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetallecelular" text='<%# Eval("CELULAR")%>' runat="server">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetallemonitoreocliente" text='<%# Eval("CLIENTE_MONITOREO")%>' runat="server">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetallemonitoreodirecc" text='<%# Eval("DIRECCION_DOMICILIO_MONITOREO")%>' runat="server">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetallemonitoreotelefono" text='<%# Eval("TELEFONO_MONITOREO")%>' runat="server">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetallemonitporeocelular" text='<%# Eval("CELULAR_MONITOREO")%>' runat="server">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetallemonitporeoemail" text='<%# Eval("EMAIL_MONITOREO")%>' runat="server">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetalletrabajada" text='<%# Eval("TRABAJADA")%>' runat="server">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetalledispositivofact" text='<%# Eval("DISPOSITIVO_FACTURADO")%>' runat="server">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetalledispositivocobr" text='<%# Eval("DISPOSITIVO_COBRADO")%>' runat="server">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetalledispositivoinst" text='<%# Eval("DISPOSITIVO_INSTALADO")%>' runat="server">
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbl_creaciondetalleconvenio" text='<%# Eval("CONVENIO")%>' runat="server">
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
