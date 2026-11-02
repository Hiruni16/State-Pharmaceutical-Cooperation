<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="State_Pharmaceutical_Cooperation.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Contact Us - State Pharmaceutical Cooperation</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Hero Section -->
    <div class="hero-section" style="background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)), url('images/contact_us_image.jpg') center/cover; height: 300px; display: flex; align-items: center;">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-white text-center">
                    <h1 class="display-4">Contact Us</h1>
                    <p class="lead">We're Here to Help</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Contact Form Section -->
    <section class="py-5">
        <div class="container">
            <div class="row">
               
                <div class="col-md-6">
                    <h2 class="mb-4">Contact Information</h2>
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Head Office</h5>
                            <p class="card-text">
                                <i class="fas fa-map-marker-alt me-2"></i>Colombo, Sri Lanka
                            </p>
                            <p class="card-text">
                                <i class="fas fa-phone me-2"></i>+94 11 2320356
                            </p>
                            <p class="card-text">
                                <i class="fas fa-envelope me-2"></i>info@spc.lk
                            </p>
                            <h5 class="card-title mt-4">Business Hours</h5>
                            <p class="card-text">
                                Monday - Friday: 8:30 AM - 5:00 PM<br />
                                Saturday: 9:00 AM - 1:00 PM<br />
                                Sunday: Closed
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Map Section -->
    <section class="py-5 bg-light">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <h2 class="text-center mb-4">Our Location</h2>
                    <!-- Add your map implementation here -->
                    <div class="ratio ratio-16x9">
                       <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d63371.80380051701!2d79.82662404022509!3d6.9220864353223865!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ae253d10f7a7003%3A0x320b2e4d32d3838d!2sColombo%2C%20Sri%20Lanka!5e0!3m2!1sen!2sus!4v1708329967134!5m2!1sen!2sus" 
                         style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>