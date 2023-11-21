<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/pages/page_master.Master" CodeBehind="page_admintablero.aspx.vb" Inherits="WebCallCenterAutomatizado.page_admintablero" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row clearfix">
            <div class="col-lg-3 col-md-6 col-sm-12">
                <div class="widget">
                    <div class="widget-body">
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="state">
                                <h6>
                                    Total
                                </h6>
                                <h2>
                                    <asp:Label ID="lbl_tablerototalcampania" runat="server" Text="0"></asp:Label>
                                </h2>
                            </div>
                            <div class="icon">
                                <i class="ik ik-award"></i>
                            </div>
                        </div>
                        <small class="text-small mt-10 d-block">
                            Total de campañas creadas
                        </small>
                    </div>
                    <div class="progress progress-sm">
                        <div id="dv_tablerototalcampania" runat="server" class="progress-bar bg-success" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12">
                <div class="widget">
                    <div class="widget-body">
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="state">
                                <h6>
                                    Completado
                                </h6>
                                <h2>
                                    <asp:Label ID="lbl_tablerocampaniacompletas" runat="server" Text="0"></asp:Label>
                                </h2>
                            </div>
                            <div class="icon">
                                <i class="ik ik-thumbs-up"></i>
                            </div>
                        </div>
                        <small class="text-small mt-10 d-block">
                            Total de campañas completadas
                        </small>
                    </div>
                    <div class="progress progress-sm">
                        <div id="dv_tablerocampaniascompletas" runat="server" class="progress-bar bg-danger" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12">
                <div class="widget">
                    <div class="widget-body">
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="state">
                                <h6>
                                    Actualizaciones
                                </h6>
                                <h2>
                                    <asp:Label ID="lbl_tableroregistros" runat="server" Text="0">
                                    </asp:Label>
                                </h2>
                            </div>
                            <div class="icon">
                                <i class="ik ik-calendar"></i>
                            </div>
                        </div>
                        <small class="text-small mt-10 d-block">Total de registros actualizados</small>
                    </div>
                    <div class="progress progress-sm">
                        <div id="dv_tableroregistros" runat="server" class="progress-bar bg-warning" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12">
                <div class="widget">
                    <div class="widget-body">
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="state">
                                <h6>
                                    Novedades
                                </h6>
                                <h2>
                                    <asp:Label ID="lbl_tableronovedades" runat="server" Text="0">
                                    </asp:Label>
                                </h2>
                            </div>
                            <div class="icon">
                                <i class="ik ik-message-square"></i>
                            </div>
                        </div>
                        <small class="text-small mt-10 d-block">
                            Registros con novedades
                        </small>
                    </div>
                    <div class="progress progress-sm">
                        <div id="dv_tableronovedades" runat="server" class="progress-bar bg-info" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="card">
            <div class="card-header row">
                <div class="col col-sm-3">
                    <div class="dropdown d-inline-block">
                        <a class="btn-icon checkbox-dropdown dropdown-toggle" href="#" id="moreDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></a>
                        <div class="dropdown-menu" aria-labelledby="moreDropdown">
                            <a class="dropdown-item" id="checkbox_select_all" href="javascript:void(0);">
                                Seleccionar todo
                            </a>
                            <a class="dropdown-item" id="checkbox_deselect_all" href="javascript:void(0);">
                                Deseleccionar todo
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col col-sm-6">
                    <div class="card-search with-adv-search dropdown">
                        <asp:Label ID="lbl_tablerogrid" runat="server" Text="Campañas completadas">
                        </asp:Label>
                    </div>
                </div>
                <div class="col col-sm-3">
                    <div class="card-options text-right">
                        <%--<span class="mr-5">1 - 10</span>
                        <a href="#">
                            <i class="ik ik-chevron-left">
                            </i>
                        </a>
                        <a href="#">
                            <i class="ik ik-chevron-right">
                            </i>
                        </a>--%>
                        <div class="list-actions">
                            <a runat="server" ID="acc_tablerodescargar">
                                <i class="ik ik-download">
                                </i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card-body p-0">
                <div class="list-item-wrap">
                    <asp:Repeater ID="rpt_tablero_grid" runat="server">
                        <ItemTemplate>
                            <div class="list-item">
                                <div class="item-inner">
                                    <label class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="item_checkbox" value="option1" runat="server"/>
                                        <%--<asp:checkbox class="custom-control-input" id="itm_checkbox" runat="server" ValidationGroup="itmtablero" />--%>
                                        <span class="custom-control-label">
                                            &nbsp;
                                        </span>
                                    </label>
                                    <div class="list-title">
                                        <a href="javascript:void(0)">
                                            <asp:Label ID="lbl_tablerogriditm1" runat="server" Text='<%# Eval("DESCRIPCION")%>'>
                                            </asp:Label>
                                        </a>
                                    </div>
                                    <%--<div class="list-actions">
                                        <a runat="server" ID="myLink">
                                            <i class="ik ik-download">
                                                <asp:Button ID="btntablero_descargar" runat="server" BorderWidth="0" Width="100%" Height="100%" Text="" style="margin:0px 0 0 -18px;" BackColor="Transparent" />
                                            </i>
                                        </a>
                                        <a href="#">
                                            <i class="ik ik-trash-2">
                                            </i>
                                        </a>
                                    </div>--%>
                                </div>
                                <%--<div class="qickview-wrap">
                                    <div class="desc">
                                        <p>
                                            <asp:Label ID="lbl_tablerogriditm2" runat="server">
                                            </asp:Label>
                                        </p>
                                    </div>
                                </div>--%>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
