<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PharmacyLoginForm.aspx.cs" Inherits="State_Pharmaceutical_Cooperation.PharmacyLoginForm" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pharmacy Login</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Matching the master page styling -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        .main-header {
            background-color: #005eb8;
            color: white;
            padding: 20px 0;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Header matching master page -->
        <header class="main-header">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-6">
                        <h1 class="mb-0">State Pharmaceutical Cooperation</h1>
                    </div>
                    <div class="col-md-6 text-end">
                        <i class="fas fa-phone me-2"></i> +94 11 2320356
                        <i class="fas fa-envelope ms-3 me-2"></i> info@spc.lk
                    </div>
                </div>
            </div>
        </header>

        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6 col-lg-5">
                    <div class="card shadow">
                        <div class="card-body p-4">
                            <h2 class="text-center mb-4">Pharmacy Login</h2>
                            
                            <div class="mb-3">
                                <asp:Label ID="lblEmail" runat="server" CssClass="form-label">Email</asp:Label>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                                    ControlToValidate="txtEmail"
                                    ErrorMessage="Email is required"
                                    CssClass="text-danger"
                                    Display="Dynamic">
                                </asp:RequiredFieldValidator>
                            </div>

                            <div class="mb-3">
                                <asp:Label ID="lblPassword" runat="server" CssClass="form-label">Password</asp:Label>
                                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
                                    ControlToValidate="txtPassword"
                                    ErrorMessage="Password is required"
                                    CssClass="text-danger"
                                    Display="Dynamic">
                                </asp:RequiredFieldValidator>
                            </div>

                          

                            <div class="mb-3">
                                <asp:Button ID="btnLogin" runat="server" Text="Login" 
                                    CssClass="btn btn-primary w-100" OnClick="btnLogin_Click" />
                            </div>

                            <div class="text-center">
                                <p class="mb-0">New pharmacy? 
                                    <asp:HyperLink ID="lnkRegister" runat="server" 
                                        NavigateUrl="~/PharmacyRegForm.aspx">Register here</asp:HyperLink>
                                </p>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>