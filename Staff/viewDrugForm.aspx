<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewDrugForm.aspx.cs" Inherits="State_Pharmaceutical_Cooperation.Staff.viewDrugForm" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Staff View</title>
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

        .form-container {
            width: 600px;
            margin: 20px auto;
            padding: 30px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 30px;
            padding-bottom: 10px;
            border-bottom: 2px solid #3498db;
        }

        .form-group {
            margin-bottom: 20px;
            position: relative;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #34495e;
            font-weight: 500;
        }

        .form-group input[type="text"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            transition: border-color 0.3s ease;
        }

        .form-group input[type="text"]:focus {
            outline: none;
            border-color: #3498db;
            box-shadow: 0 0 5px rgba(52, 152, 219, 0.3);
        }

        .button-group {
            margin-top: 30px;
            display: flex;
            gap: 10px;
            justify-content: center;
            flex-wrap: wrap;
        }

        .button-group input[type="submit"] {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
            transition: all 0.3s ease;
            min-width: 120px;
        }

        #btnRegister { background-color: #2ecc71; color: white; }
        #btnUpdate { background-color: #3498db; color: white; }
        #btnDelete { background-color: #e74c3c; color: white; }
        #btnSearch { background-color: #f39c12; color: white; }
        #btnClear { background-color: #95a5a6; color: white; }
        #btnAllDrugs { background-color: #9b59b6; color: white; }

        .button-group input[type="submit"]:hover {
            transform: translateY(-2px);
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }

        .message {
            margin-top: 20px;
            text-align: center;
            padding: 10px;
            border-radius: 5px;
        }

        .drug-table-container {
            margin-top: 30px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        .drug-table {
            width: 100%;
            border-collapse: collapse;
        }

        .drug-table th, .drug-table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .drug-table th {
            background-color: #f8f9fa;
            color: #2c3e50;
            font-weight: 600;
        }

        .drug-table tr:hover {
            background-color: #f5f5f5;
        }

        .sidebar {
            height: 100vh;
            background-color: #005eb8;
            color: white;
            position: fixed;
            padding-top: 20px;
        }

        .sidebar .nav-link {
            color: white;
            padding: 15px 20px;
            margin: 5px 0;
        }

        .sidebar .nav-link.active {
            background-color: rgba(255,255,255,0.2);
            border-left: 4px solid white;
        }

        .sidebar .nav-link:hover {
            background-color: rgba(255,255,255,0.1);
        }

        .main-content {
            margin-left: 250px;
            padding: 20px;
        }

        .logout-btn {
            position: absolute;
            bottom: -425px;
            width: 85%;
            margin: 0 20px;
            left: -13px;
        }

        @media (max-width: 650px) {
            .form-container {
                width: 90%;
                padding: 20px;
            }

            .button-group input[type="submit"] {
                width: 100%;
                margin-bottom: 10px;
            }
        }
         .all-drugs-container {
            margin-top: 20px;
            text-align: center;
        }

        #btnAllDrugs {
            background-color: #9b59b6;
            color: white;
            padding: 12px 30px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s ease;
            width: 100%;
            max-width: 200px;
        }

        #btnAllDrugs:hover {
            transform: translateY(-2px);
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }
        .main-content {
    margin-left: 250px; /* Adjust based on your sidebar width */
    padding: 20px;
}

.text-center {
    text-align: center;
}
  .logout-btn {
    position: absolute;
    bottom: 20px;  
    width: 85%;
    margin: 0 20px;
    left: -13px;
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
                <h5 class="mt-3">Staff Dashboard</h5>
            </div>
            
            <ul class="nav flex-column">
                <li class="nav-item">
                    <asp:LinkButton ID="lnkDashboard" runat="server" CssClass="nav-link" OnClick="lnkDashboard_Click1">
                        <i class="fas fa-home me-2"></i> Dashboard
                    </asp:LinkButton>
                </li>
              
                <li class="nav-item">
                    <asp:LinkButton ID="lnkSuppliers" runat="server" CssClass="nav-link" OnClick="lnkSuppliers_Click1">
                        <i class="fas fa-truck me-2"></i> Suppliers
                    </asp:LinkButton>
                </li>
                <li class="nav-item">
                    <asp:LinkButton ID="lnkPharmacy" runat="server" CssClass="nav-link" OnClick="lnkPharmacy_Click1">
                        <i class="fas fa-clinic-medical me-2"></i> Pharmacy
                    </asp:LinkButton>
                </li>
                <li class="nav-item">
                    <asp:LinkButton ID="lnkDrugs" runat="server" CssClass="nav-link" OnClick="lnkDrugs_Click3">
                        <i class="fas fa-pills me-2"></i> Drug Management
                    </asp:LinkButton>
                </li>
                  <li class="nav-item">
                   <asp:LinkButton ID="lnkOrders" runat="server" CssClass="nav-link" OnClick="lnkOrders_Click1">
                   <i class="fas fa-shopping-cart me-2"></i> Order History
                  </asp:LinkButton>
                    </li>
                <li class="nav-item">
                    <asp:LinkButton ID="lnkViewTender" runat="server" CssClass="nav-link" OnClick="lnkViewTender_Click">
                        <i class="fas fa-chart-bar me-2"></i> View Tender
                    </asp:LinkButton>
                </li>
            </ul>

            <asp:Button ID="Button1" runat="server" Text="Logout" CssClass="btn btn-danger logout-btn" OnClick="Button1_Click" />
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <div class="container-fluid">
                <div class="row mb-4">
                    <div class="col-12">
                        <h2 class="text-primary">
                            <i class="fas fa-pills me-2"></i>Drug Management
                        </h2>
                    </div>
                </div>

                <div class="form-container">
                    <h2>Drug Registration Form</h2>
                    
                    <div class="form-group">
                        <label for="txtDrugID">Drug ID:</label>
                        <asp:TextBox ID="txtDrugID" runat="server"></asp:TextBox>
                    </div>
                    
                    <div class="form-group">
                        <label for="txtDrugName">Drug Name:</label>
                        <asp:TextBox ID="txtDrugName" runat="server"></asp:TextBox>
                    </div>
                    
                    <div class="form-group">
                        <label for="txtManufacturer">Manufacturer:</label>
                        <asp:TextBox ID="txtManufacturer" runat="server"></asp:TextBox>
                    </div>
                    
                    <div class="form-group">
                        <label for="txtPrice">Price:</label>
                        <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
                    </div>
                    
                    <div class="form-group">
                        <label for="txtStock">Stock Quantity:</label>
                        <asp:TextBox ID="txtStock" runat="server"></asp:TextBox>
                    </div>
                    
                    <div class="button-group">
                        <asp:Button ID="btnRegister" runat="server" Text="Register Drug" OnClick="btnRegister_Click"  />
                        <asp:Button ID="btnUpdate" runat="server" Text="Update Stock" OnClick="btnUpdate_Click"  />
                        <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click"  />
                        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click"  />
                        <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click"   />
                    </div>
                    
                    <div class="message">
                        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                    </div>

                    <!-- New All Drugs button position -->
                    <div class="all-drugs-container">
                        <asp:Button ID="btnAllDrugs" runat="server" Text="All Drugs" OnClick="btnAllDrugs_Click"  />
                    </div>
                </div>

                <!-- Drug Table -->
                <div class="drug-table-container">
                    <asp:GridView ID="gvDrugs" runat="server" CssClass="table table-striped table-hover mt-4" AutoGenerateColumns="False" 
                        Width="100%" GridLines="None" OnSelectedIndexChanged="gvDrugs_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="DrugID" HeaderText="Drug ID" />
                            <asp:BoundField DataField="DrugName" HeaderText="Drug Name" />
                            <asp:BoundField DataField="Manufacture" HeaderText="Manufacturer" />
                            <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0:C2}" />
                            <asp:BoundField DataField="Stock" HeaderText="Stock" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>