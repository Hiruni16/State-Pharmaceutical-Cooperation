<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tenderView.aspx.cs" Inherits="State_Pharmaceutical_Cooperation.Staff.tenderView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Supplier View</title>
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
    bottom: 20px;  /* Changed from -425px to 20px */
    width: 85%;
    margin: 0 20px;
    left: -13px;
}

/* You might also want to ensure the sidebar has proper positioning */
.sidebar {
    height: 100vh;
    background-color: #005eb8;
    color: white;
    position: fixed;
    padding-top: 20px;
    display: flex;
    flex-direction: column;
}

/* Add this to ensure proper spacing for the navigation items */
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
            <asp:LinkButton ID="lnkDashboard" runat="server" CssClass="nav-link" OnClick="lnkDashboard_Click">
                <i class="fas fa-home me-2"></i> Dashboard
            </asp:LinkButton>
        </li>
       
        <li class="nav-item">
            <asp:LinkButton ID="lnkSuppliers" runat="server" CssClass="nav-link" OnClick="lnkSuppliers_Click">
                <i class="fas fa-truck me-2"></i> Suppliers
            </asp:LinkButton>
        </li>
        <li class="nav-item">
            <asp:LinkButton ID="lnkPharmacy" runat="server" CssClass="nav-link" OnClick="lnkPharmacy_Click">
                <i class="fas fa-clinic-medical me-2"></i> Pharmacy
            </asp:LinkButton>
        </li>
        <li class="nav-item">
            <asp:LinkButton ID="lnkDrugs" runat="server" CssClass="nav-link" OnClick="lnkDrugs_Click" >
                <i class="fas fa-pills me-2"></i> Drug Management
            </asp:LinkButton>
        </li>
         <li class="nav-item">
              <asp:LinkButton ID="lnkOrders" runat="server" CssClass="nav-link" OnClick="lnkOrders_Click">
                 <i class="fas fa-shopping-cart me-2"></i> Order History
                </asp:LinkButton>
            </li>
        <li class="nav-item">
            <asp:LinkButton ID="lnkViewTender" runat="server" CssClass="nav-link" OnClick="lnkViewTender_Click">
         <i class="fas fa-chart-bar me-2"></i> View Tender
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
                    <i class="fas fa-chart-bar me-2"></i>View Tender 
                </h2>
            </div>
        </div>

        <!-- supplier Table -->
<div class="drug-table-container">
      <asp:GridView ID="gvTender" runat="server" CssClass="table table-striped table-hover mt-4" AutoGenerateColumns="False" 
       Width="100%" OnSelectedIndexChanged="gvTender_SelectedIndexChanged"
        OnRowCommand="gvTender_RowCommand">

   <Columns>   
       <asp:BoundField DataField="TenderID" HeaderText="TenderID" />
       <asp:BoundField DataField="TenderTitle" HeaderText="Tender Title" />
       <asp:BoundField DataField="Email" HeaderText="Email" />
       <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" />
       <asp:BoundField DataField="DrugName" HeaderText="Drug Name" />
       <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
       <asp:BoundField DataField="UnitPrice" HeaderText="Unit Price" />
       <asp:BoundField DataField="Manufacturer" HeaderText="Manufacturer" />
       <asp:BoundField DataField="ExpiryDate" HeaderText="ExpiryDate" />
       <asp:BoundField DataField="Description" HeaderText="Description" />
        <asp:TemplateField HeaderText="Actions">
     <ItemTemplate>
         <asp:Button ID="btnDelete" runat="server" 
             Text="Delete" 
             CssClass="btn btn-danger btn-sm"
             CommandName="DeleteTender"
             CommandArgument='<%# Eval("TenderID") %>'
             OnClientClick="return confirm('Are you sure you want to delete this tender?');" />
     </ItemTemplate>
 </asp:TemplateField>

   </Columns>
   <HeaderStyle CssClass="table-light" />
    </asp:GridView>
       
 </div>
<asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
        
        <div>
        </div>
    </form>
</body>
</html>
