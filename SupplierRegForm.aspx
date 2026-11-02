<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SupplierRegForm.aspx.cs" Inherits="State_Pharmaceutical_Cooperation.SupplierRegForm" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Supplier Registration</title>
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
       <div class="container">
           <div class="row justify-content-center">
               <div class="col-md-8">
                   <div class="card shadow-sm my-5">
                       <div class="card-body p-4">
                           <h2 class="text-center mb-4">Supplier Registration</h2>
                           
                           <!-- Added SupplierID field -->
                           <div class="row">
                               <div class="col-md-6 mb-3">
                                   <asp:Label ID="lblSupplierID" runat="server" CssClass="form-label">Supplier ID</asp:Label>
                                   <asp:TextBox ID="txtSupplierID" runat="server" CssClass="form-control"></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="rfvSupplierID" runat="server" 
                                       ControlToValidate="txtSupplierID"
                                       ErrorMessage="Supplier ID is required"
                                       CssClass="text-danger"
                                       Display="Dynamic">
                                   </asp:RequiredFieldValidator>
                               </div>
                          
                               <div class="col-md-6 mb-3">
                                   <asp:Label ID="lblCompanyName" runat="server" CssClass="form-label">Company Name</asp:Label>
                                   <asp:TextBox ID="txtCompanyName" runat="server" CssClass="form-control"></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="rfvCompanyName" runat="server" 
                                       ControlToValidate="txtCompanyName"
                                       ErrorMessage="Company name is required"
                                       CssClass="text-danger"
                                       Display="Dynamic">
                                   </asp:RequiredFieldValidator>
                               </div>
                               
                              
                           </div>

                           <div class="row">
                               <div class="col-md-6 mb-3">
                                   <asp:Label ID="lblEmail" runat="server" CssClass="form-label">Email</asp:Label>
                                   <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                                       ControlToValidate="txtEmail"
                                       ErrorMessage="Email is required"
                                       CssClass="text-danger"
                                       Display="Dynamic">
                                   </asp:RequiredFieldValidator>
                               </div>
                               
                               <div class="col-md-6 mb-3">
                                   <asp:Label ID="lblContactNo" runat="server" CssClass="form-label">Contact Number</asp:Label>
                                   <asp:TextBox ID="txtContactNo" runat="server" CssClass="form-control"></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="rfvContactNo" runat="server" 
                                       ControlToValidate="txtContactNo"
                                       ErrorMessage="Contact number is required"
                                       CssClass="text-danger"
                                       Display="Dynamic">
                                   </asp:RequiredFieldValidator>
                               </div>
                           </div>

                           <div class="mb-3">
                               <asp:Label ID="lblAddress" runat="server" CssClass="form-label">Business Address</asp:Label>
                               <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="rfvAddress" runat="server" 
                                   ControlToValidate="txtAddress"
                                   ErrorMessage="Address is required"
                                   CssClass="text-danger"
                                   Display="Dynamic">
                               </asp:RequiredFieldValidator>
                           </div>

                           <div class="row">
                               <div class="col-md-6 mb-3">
                                   <asp:Label ID="lblPassword" runat="server" CssClass="form-label">Password</asp:Label>
                                   <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
                                       ControlToValidate="txtPassword"
                                       ErrorMessage="Password is required"
                                       CssClass="text-danger"
                                       Display="Dynamic">
                                   </asp:RequiredFieldValidator>
                               </div>
                               
                               <div class="col-md-6 mb-3">
                                   <asp:Label ID="lblConfirmPassword" runat="server" CssClass="form-label">Confirm Password</asp:Label>
                                   <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                   <asp:CompareValidator ID="cvPassword" runat="server"
                                       ControlToCompare="txtPassword"
                                       ControlToValidate="txtConfirmPassword"
                                       ErrorMessage="Passwords do not match"
                                       CssClass="text-danger"
                                       Display="Dynamic">
                                   </asp:CompareValidator>
                               </div>
                           </div>

                           <div class="d-grid gap-2 mt-4">
                               <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-primary" OnClick="btnRegister_Click1"  />
                           </div>

                           <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>

                           <div class="text-center mt-3">
                               <p>Already registered? <a href="SupplierLoginForm.aspx">Login here</a></p>
                           </div>
                       </div>
                   </div>
               </div>
           </div>
       </div>
   </form>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>