<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="staffRegForm.aspx.cs" Inherits="State_Pharmaceutical_Cooperation.staffRegForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Staff Registration</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
                            <h2 class="text-center mb-4">Staff Registration</h2>
                            
                           <div class="row">
                                <div class="col-md-6 mb-3">
                                    <asp:Label ID="lblStaffID" runat="server" CssClass="form-label">Staff ID</asp:Label>
                                    <asp:TextBox ID="txtStaffID" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvStaffID" runat="server" 
                                        ControlToValidate="txtStaffID"
                                        ErrorMessage="Staff ID is required"
                                        CssClass="text-danger"
                                        Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                                </div>
                                
                                <div class="col-md-6 mb-3">
                                    <asp:Label ID="lblUsername" runat="server" CssClass="form-label">Username</asp:Label>
                                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvUsername" runat="server" 
                                        ControlToValidate="txtUsername"
                                        ErrorMessage="Username is required"
                                        CssClass="text-danger"
                                        Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <asp:Label ID="lblStaffType" runat="server" CssClass="form-label">Staff Type</asp:Label>
                                    <asp:DropDownList ID="ddlStaffType" runat="server" CssClass="form-select" AutoPostBack="true">
                                        <asp:ListItem Text="Select Staff Type" Value="" />
                                        <asp:ListItem Text="Manufacturing Plant Staff" Value="plant" />
                                        <asp:ListItem Text="Warehouse Staff" Value="warehouse" />
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvStaffType" runat="server"
                                        ControlToValidate="ddlStaffType"
                                        ErrorMessage="Staff type is required"
                                        CssClass="text-danger"
                                        Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                                </div>

                                <div class="col-md-6 mb-3">
                                    <asp:Label ID="lblLocation" runat="server" CssClass="form-label">Location Assignment</asp:Label>
                                    <asp:DropDownList ID="ddlLocation" runat="server" CssClass="form-select">
                                        <asp:ListItem Text="Select Location" Value="" />
                                       
                                        <asp:ListItem Text="Ratmalana Plant" Value="plant_ratmalana" Group="Manufacturing Plants" />
                                        <asp:ListItem Text="Kandy Plant" Value="plant_kandy" Group="Manufacturing Plants" />
                                        <asp:ListItem Text="Galle Plant" Value="plant_galle" Group="Manufacturing Plants" />

                                        <asp:ListItem Text="Colombo Central Warehouse" Value="wh_colombo" Group="Warehouses" />
                                        <asp:ListItem Text="Kurunegala Warehouse" Value="wh_kurunegala" Group="Warehouses" />
                                        <asp:ListItem Text="Batticaloa Warehouse" Value="wh_batticaloa" Group="Warehouses" />
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvLocation" runat="server"
                                        ControlToValidate="ddlLocation"
                                        ErrorMessage="Location assignment is required"
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
                                    <asp:Label ID="lblPhone" runat="server" CssClass="form-label">Phone Number</asp:Label>
                                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvPhone" runat="server" 
                                        ControlToValidate="txtPhone"
                                        ErrorMessage="Phone number is required"
                                        CssClass="text-danger"
                                        Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                                </div>
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
                                <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-primary" OnClick="btnRegister_Click1" />
                            </div>

                            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>


                            <div class="text-center mt-3">
                                <p>Already registered? <a href="staffLoginForm.aspx">Login here</a></p>
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