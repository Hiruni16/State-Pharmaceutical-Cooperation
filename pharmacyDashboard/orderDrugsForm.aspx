<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="orderDrugsForm.aspx.cs" Inherits="State_Pharmaceutical_Cooperation.pharmacyDashboard.orderDrugsForm" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Order Drugs - Pharmacy Dashboard</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
        }

        .sidebar {
            height: 100vh;
            background-color: #005eb8;
            color: white;
            position: fixed;
            padding-top: 20px;
            display: flex;
            flex-direction: column;
        }

        .sidebar .nav-link {
            color: white;
            padding: 15px 20px;
            margin: 5px 0;
        }

        .sidebar .nav-link:hover {
            background-color: rgba(255,255,255,0.1);
        }

        .main-content {
            margin-left: 250px;
            padding: 20px;
        }

        .order-form-container {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin-top: 20px;
        }

        .form-control:focus {
            border-color: #005eb8;
            box-shadow: 0 0 0 0.2rem rgba(0, 94, 184, 0.25);
        }

        .logout-btn {
            position: absolute;
            bottom: 20px;
            width: 85%;
            margin: 0 20px;
            left: -13px;
        }

        .nav.flex-column {
            flex: 1;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Sidebar -->
        <div class="sidebar col-md-3 col-lg-2">
            <div class="text-center mb-4">
                <h5 class="mt-3">Pharmacy Dashboard</h5>
            </div>
            
            <ul class="nav flex-column">
                <li class="nav-item">
                   <asp:LinkButton ID="lnkDashboard" runat="server" CssClass="nav-link" OnClick="lnkDashboard_Click">
                     <i class="fas fa-home me-2"></i> Dashboard
                   </asp:LinkButton>
                </li>
                <li class="nav-item">
                    <asp:LinkButton ID="lnkDrugs" runat="server" CssClass="nav-link" OnClick="lnkDrugs_Click">
                        <i class="fas fa-pills me-2"></i>View Drugs
                    </asp:LinkButton>
                </li>
                <li class="nav-item">
                    <asp:LinkButton ID="lnkOrderDrugs" runat="server" CssClass="nav-link" OnClick="lnkOrderDrugs_Click">
                        <i class="fas fa-pills me-2"></i> Order Drugs
                    </asp:LinkButton>
                </li>
            </ul>

            <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn btn-danger logout-btn" OnClick="btnLogout_Click" />
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <div class="container-fluid">
                <div class="row mb-4">
                    <div class="col-12">
                        <h2 class="text-primary">
                            <i class="fas fa-pills me-2"></i>Place Drug Order
                        </h2>
                    </div>
                </div>
                         <!-- Order Form -->
<div class="mb-4">
    <label for="txtOrderDate" class="form-label">Order Date</label>
    <asp:TextBox ID="txtOrderDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvOrderDate" runat="server" 
        ControlToValidate="txtOrderDate" 
        ErrorMessage="Order date is required" 
        CssClass="text-danger"
        Display="Dynamic" ValidationGroup="test"></asp:RequiredFieldValidator>
</div>

<div class="mb-4">
    <label for="ddlDrug" class="form-label">Select Drug</label>
    <asp:DropDownList ID="ddlDrug" runat="server" CssClass="form-select"></asp:DropDownList>
    <asp:RequiredFieldValidator ID="rfvDrug" runat="server" 
        ControlToValidate="ddlDrug" 
        InitialValue="" 
        ErrorMessage="Please select a drug" 
        CssClass="text-danger"
        Display="Dynamic" ValidationGroup="test"></asp:RequiredFieldValidator>
</div>


<div class="row">
    <div class="col-md-6 mb-4">
        <label for="txtQuantity" class="form-label">Quantity</label>
        <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control" TextMode="Number" min="1"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvQuantity" runat="server" 
            ControlToValidate="txtQuantity" 
            ErrorMessage="Quantity is required" 
            CssClass="text-danger"
            Display="Dynamic" ValidationGroup="test"></asp:RequiredFieldValidator>
        <asp:RangeValidator ID="rvQuantity" runat="server"
            ControlToValidate="txtQuantity"
            MinimumValue="1" MaximumValue="1000"
            Type="Integer"
            ErrorMessage="Quantity must be between 1 and 1000"
            CssClass="text-danger"
            Display="Dynamic" ValidationGroup="test"></asp:RangeValidator>
    </div>

    <div class="col-md-6 mb-4">
        <label for="txtDeliveryDate" class="form-label">Required Delivery Date</label>
        <asp:TextBox ID="txtDeliveryDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvDeliveryDate" runat="server" 
            ControlToValidate="txtDeliveryDate" 
            ErrorMessage="Delivery date is required" 
            CssClass="text-danger"
            Display="Dynamic" ValidationGroup="test"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="cvDeliveryDate" runat="server"
            ControlToValidate="txtDeliveryDate"
            ControlToCompare="txtOrderDate"
            Operator="GreaterThan"
            Type="Date"
            ErrorMessage="Delivery date must be after order date"
            CssClass="text-danger"
            Display="Dynamic" ValidationGroup="test"></asp:CompareValidator>
    </div>
</div>

<div class="mb-4">
    <label for="ddlPriority" class="form-label">Priority Level</label>
    <asp:DropDownList ID="ddlPriority" runat="server" CssClass="form-select">
        <asp:ListItem Text="Normal" Value="normal" />
        <asp:ListItem Text="Urgent" Value="urgent" />
        <asp:ListItem Text="Emergency" Value="emergency" />
    </asp:DropDownList>
</div>

<div class="mb-4">
    <label for="txtNotes" class="form-label">Special Instructions (Optional)</label>
    <asp:TextBox ID="txtNotes" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
</div>

<div class="mt-4">
    <asp:Button ID="btnSubmitOrder" runat="server" Text="Submit Order" 
        CssClass="btn btn-primary me-2" OnClick="btnSubmitOrder_Click" ValidationGroup="test" />
    <asp:Button ID="btnClear" runat="server" Text="Clear Form" 
         CssClass="btn btn-secondary" OnClick="btnClear_Click" CausesValidation="false" />
   
</div>
                <asp:Label ID="lblMessage" runat="server" CssClass="alert alert-info mt-3" Visible="false"></asp:Label>
            </div>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
