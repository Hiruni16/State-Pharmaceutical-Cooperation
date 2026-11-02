<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="State_Pharmaceutical_Cooperation.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>SPC - State Pharmaceutical Cooperation</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Hero Section -->
    <div class="hero-section" style="background: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url('images/pharmaceutical_background.jpg') center/cover; height: 500px; display: flex; align-items: center;">
        <div class="container">
            <div class="row">
                <div class="col-md-8 text-white">
                    <h1 class="display-4">Welcome to State Pharmaceutical Cooperation</h1>
                    <p class="lead">Your trusted partner in healthcare solutions</p>
                    <div class="mt-4">
                        <a href="supplierRegForm.aspx" class="btn btn-primary btn-lg me-3">Register as Supplier</a>
                        <a href="PharmacyLoginForm.aspx" class="btn btn-outline-light btn-lg">Pharmacy Portal</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Services Section -->
    <section class="py-5">
        <div class="container">
            <h2 class="text-center mb-5">Our Services</h2>
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="card h-100">
                        <div class="card-body text-center">
                            <i class="fas fa-user-plus fa-3x text-primary mb-3"></i>
                            <h4>Supplier Registration</h4>
                            <p>Register your company through our online portal or visit any of our main branches</p>
                            <a href="SupplierRegForm.aspx" class="btn btn-outline-primary">Register Now</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card h-100">
                        <div class="card-body text-center">
                            <i class="fas fa-warehouse fa-3x text-primary mb-3"></i>
                            <h4>Inventory Management</h4>
                            <p>Real-time stock updates from manufacturing plants and warehouses</p>
                            <a href="staffLoginForm.aspx" class="btn btn-outline-primary">Access System</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card h-100">
                        <div class="card-body text-center">
                            <i class="fas fa-shopping-cart fa-3x text-primary mb-3"></i>
                            <h4>Order Management</h4>
                            <p>Search and place orders directly from our main warehouse</p>
                            <a href="PharmacyLoginForm.aspx" class="btn btn-outline-primary">Place Order</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

 <!-- Search Section -->
    <section class="py-5 bg-light">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8 text-center">
                    <h2 class="mb-4">Search Drug Availability</h2>
                    <div class="input-group mb-3">
                        <asp:DropDownList ID="ddlDrugs" runat="server" CssClass="form-control form-control-lg">
                            <asp:ListItem Text="Select a Drug" Value="" />
                        </asp:DropDownList>
                        <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary btn-lg" OnClick="btnSearch_Click" />
                    </div>
                </div>
            </div>

            <!-- Drug Results Grid -->
            <div class="row mt-4">
                <div class="col-12">
                    <asp:GridView ID="gvDrugs" runat="server" CssClass="table table-hover" AutoGenerateColumns="False" Visible="false">
                        <Columns>
                            <asp:BoundField DataField="DrugID" HeaderText="Drug ID" />
                            <asp:BoundField DataField="DrugName" HeaderText="Drug Name" />
                            <asp:BoundField DataField="Manufacture" HeaderText="Manufacturer" />
                            <asp:BoundField DataField="Price" HeaderText="Price" />
                            <asp:BoundField DataField="Stock" HeaderText="Available Stock" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </section>

  
</asp:Content>