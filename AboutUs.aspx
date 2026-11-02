<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="State_Pharmaceutical_Cooperation.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>About Us - State Pharmaceutical Cooperation</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Hero Section -->
    <div class="hero-section" style="background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)), url('images/about_us_image.jpg') center/cover; height: 300px; display: flex; align-items: center;">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-white text-center">
                    <h1 class="display-4">About Us</h1>
                    <p class="lead">Leading Sri Lanka's Healthcare Distribution</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Mission & Vision Section -->
    <section class="py-5">
        <div class="container">
            <div class="row">
                <div class="col-md-6 mb-4">
                    <div class="card h-100">
                        <div class="card-body">
                            <h3 class="card-title text-primary"><i class="fas fa-bullseye me-2"></i>Our Mission</h3>
                            <p class="card-text">To ensure the reliable and efficient distribution of high-quality pharmaceutical products across Sri Lanka, making healthcare accessible to all citizens at affordable prices.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 mb-4">
                    <div class="card h-100">
                        <div class="card-body">
                            <h3 class="card-title text-primary"><i class="fas fa-eye me-2"></i>Our Vision</h3>
                            <p class="card-text">To be the leading pharmaceutical distributor in Sri Lanka, known for reliability, quality, and commitment to public health and wellness.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>


   
</asp:Content>