<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PharmacyRegForm.aspx.cs" Inherits="State_Pharmaceutical_Cooperation.PharmacyRegForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pharmacy Registration</title>
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
                <div class="col-md-8">
                    <div class="card shadow">
                        <div class="card-body">
                            <h2 class="text-center mb-4">Pharmacy Registration Form</h2>
                            
                         

                            <div class="form-group mb-3">
                                <asp:Label ID="lblPharmacyID" runat="server" Text="PharmacyID:"></asp:Label>
                                <asp:TextBox ID="txtPharmacyID" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvPharmacyID" runat="server" 
                                    ControlToValidate="txtPharmacyID" 
                                    ErrorMessage="PharmacyID is required" 
                                    CssClass="text-danger"
                                    Display="Dynamic">
                                </asp:RequiredFieldValidator>
                            </div>

                             <div class="form-group mb-3">
                                <asp:Label ID="lblPharmacyName" runat="server" Text="Pharmacy Name:"></asp:Label>
                                <asp:TextBox ID="txtPharmacyName" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvPharmacyName" runat="server" 
                                     ControlToValidate="txtPharmacyName" 
                                     ErrorMessage="Pharmacy Name is required" 
                                     CssClass="text-danger"
                                     Display="Dynamic">
                                </asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group mb-3">
                                <asp:Label ID="lblEmail" runat="server" Text="Email:"></asp:Label>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                                    ControlToValidate="txtEmail" 
                                    ErrorMessage="Email is required" 
                                    CssClass="text-danger"
                                    Display="Dynamic">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revEmail" runat="server" 
                                    ControlToValidate="txtEmail"
                                    ErrorMessage="Invalid Email Format"
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    CssClass="text-danger"
                                    Display="Dynamic">
                                </asp:RegularExpressionValidator>
                            </div>

                            <div class="form-group mb-3">
                                <asp:Label ID="lblPhone" runat="server" Text="Phone Number:"></asp:Label>
                                <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvPhone" runat="server" 
                                    ControlToValidate="txtPhone" 
                                    ErrorMessage="Phone Number is required" 
                                    CssClass="text-danger"
                                    Display="Dynamic">
                                </asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group mb-3">
                                <asp:Label ID="lblAddress" runat="server" Text="Address:"></asp:Label>
                                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvAddress" runat="server" 
                                    ControlToValidate="txtAddress" 
                                    ErrorMessage="Address is required" 
                                    CssClass="text-danger"
                                    Display="Dynamic">
                                </asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group mb-3">
                                <asp:Label ID="lblPassword" runat="server" Text="Password:"></asp:Label>
                                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
                                    ControlToValidate="txtPassword" 
                                    ErrorMessage="Password is required" 
                                    CssClass="text-danger"
                                    Display="Dynamic">
                                </asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group text-center">
                                <asp:Button ID="btnRegister" runat="server" Text="Register" 
                                    CssClass="btn btn-primary btn-lg px-5" OnClick="btnRegister_Click" />
                            </div>

                            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                            
                            <div class="text-center mt-3">
                                <a href="PharmacyLoginForm.aspx" class="text-decoration-none">Already registered? Login here</a>
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