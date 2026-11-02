<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SupplierHomePage.aspx.cs" Inherits="State_Pharmaceutical_Cooperation.SupplierHomePage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Supplier Dashboard</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" rel="stylesheet" />
    <!-- Font Awesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
</head>
<body class="bg-gray-100">
    <form id="form1" runat="server">
        <div class="min-h-screen p-8">
            <!-- Header Section -->
            <div class="mb-8">
                <h1 class="text-3xl font-bold text-gray-800">
                    <asp:Label ID="lblWelcome" runat="server" Text="Welcome back, "></asp:Label>
                    <asp:Label ID="lblSupplierName" runat="server"></asp:Label>
                </h1>
                <p class="text-gray-600 mt-2">
                    Last login: <asp:Label ID="lblLastLogin" runat="server"></asp:Label>
                </p>
            </div>

            <!-- Stats Grid -->
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
                <!-- Pending Orders Card -->
                <div class="bg-white rounded-lg shadow p-6">
                    <div class="flex items-center justify-between pb-2">
                        <span class="text-sm font-medium text-gray-600">Pending Orders</span>
                        <i class="fas fa-box text-blue-500"></i>
                    </div>
                    <div>
                        <asp:Label ID="lblPendingOrders" runat="server" CssClass="text-2xl font-bold"></asp:Label>
                        <p class="text-xs text-gray-600 mt-1">
                            <asp:Label ID="lblUrgentOrders" runat="server"></asp:Label> need immediate attention
                        </p>
                    </div>
                </div>

                <!-- On-time Delivery Card -->
                <div class="bg-white rounded-lg shadow p-6">
                    <div class="flex items-center justify-between pb-2">
                        <span class="text-sm font-medium text-gray-600">On-time Delivery Rate</span>
                        <i class="fas fa-clock text-green-500"></i>
                    </div>
                    <div>
                        <asp:Label ID="lblDeliveryRate" runat="server" CssClass="text-2xl font-bold"></asp:Label>
                        <p class="text-xs text-gray-600 mt-1">Last 30 days</p>
                    </div>
                </div>

                <!-- Quality Issues Card -->
                <div class="bg-white rounded-lg shadow p-6">
                    <div class="flex items-center justify-between pb-2">
                        <span class="text-sm font-medium text-gray-600">Quality Issues</span>
                        <i class="fas fa-exclamation-circle text-red-500"></i>
                    </div>
                    <div>
                        <asp:Label ID="lblQualityIssues" runat="server" CssClass="text-2xl font-bold"></asp:Label>
                        <p class="text-xs text-gray-600 mt-1">Open quality reports</p>
                    </div>
                </div>

                <!-- Monthly Revenue Card -->
                <div class="bg-white rounded-lg shadow p-6">
                    <div class="flex items-center justify-between pb-2">
                        <span class="text-sm font-medium text-gray-600">Monthly Revenue</span>
                        <i class="fas fa-chart-line text-purple-500"></i>
                    </div>
                    <div>
                        <asp:Label ID="lblMonthlyRevenue" runat="server" CssClass="text-2xl font-bold"></asp:Label>
                        <p class="text-xs text-gray-600 mt-1">
                            <asp:Label ID="lblRevenueChange" runat="server"></asp:Label> from last month
                        </p>
                    </div>
                </div>
            </div>

            <!-- Notifications & Quick Actions -->
            <div class="grid grid-cols-1 lg:grid-cols-2 gap-8">
                <!-- Recent Notifications -->
                <div class="bg-white rounded-lg shadow">
                    <div class="p-6">
                        <h2 class="text-xl font-semibold flex items-center gap-2">
                            <i class="fas fa-bell"></i> Recent Notifications
                        </h2>
                        <asp:Repeater ID="rptNotifications" runat="server">
                            <ItemTemplate>
                                <div class="border-l-4 border-blue-500 pl-4 mt-4">
                                    <p class="font-medium"><%# Eval("Title") %></p>
                                    <p class="text-sm text-gray-600"><%# Eval("Message") %></p>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>

                <!-- Quick Actions -->
                <div class="bg-white rounded-lg shadow">
                    <div class="p-6">
                        <h2 class="text-xl font-semibold">Quick Actions</h2>
                        <div class="grid grid-cols-2 gap-4 mt-4">
                            <asp:LinkButton ID="btnViewOrders" runat="server" CssClass="p-4 bg-blue-50 hover:bg-blue-100 rounded-lg text-left" OnClick="btnViewOrders_Click">
                                <i class="fas fa-box text-blue-600 text-xl mb-2"></i>
                                <p class="font-medium text-blue-900">View Orders</p>
                            </asp:LinkButton>

                            <asp:LinkButton ID="btnUpdateInventory" runat="server" CssClass="p-4 bg-green-50 hover:bg-green-100 rounded-lg text-left" OnClick="btnUpdateInventory_Click">
                                <i class="fas fa-chart-line text-green-600 text-xl mb-2"></i>
                                <p class="font-medium text-green-900">Update Inventory</p>
                            </asp:LinkButton>

                            <asp:LinkButton ID="btnDeliverySchedule" runat="server" CssClass="p-4 bg-purple-50 hover:bg-purple-100 rounded-lg text-left" OnClick="btnDeliverySchedule_Click">
                                <i class="fas fa-clock text-purple-600 text-xl mb-2"></i>
                                <p class="font-medium text-purple-900">Delivery Schedule</p>
                            </asp:LinkButton>

                            <asp:LinkButton ID="btnReportIssue" runat="server" CssClass="p-4 bg-orange-50 hover:bg-orange-100 rounded-lg text-left" OnClick="btnReportIssue_Click">
                                <i class="fas fa-exclamation-circle text-orange-600 text-xl mb-2"></i>
                                <p class="font-medium text-orange-900">Report Issue</p>
                            </asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
