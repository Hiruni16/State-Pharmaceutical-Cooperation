# Pharmacy Management System – Service-Oriented Computing

## Project Overview

The Pharmacy Management System is a web-based application designed based on the requirements of the State Pharmaceutical Corporation (SPC) of Sri Lanka. The system aims to simplify pharmaceutical operations by managing drug inventory, supplier information, pharmacy registrations, drug orders, and supplier tenders.

The application follows the concepts of **Service-Oriented Architecture (SOA)** to support modularity, scalability, flexibility, and integration between different system components.

## Main Objectives

- Manage pharmaceutical drug inventory efficiently.
- Provide separate access for Staff, Suppliers, and Pharmacies.
- Simplify the drug ordering process.
- Allow suppliers to submit tenders for drug supply.
- Improve communication between pharmacies, suppliers, and staff.
- Support efficient management of pharmaceutical operations.

## User Roles and Features

### 1. Staff
- Staff registration and login.
- Staff dashboard.
- Add, update, delete, search, and view drugs.
- View registered suppliers and pharmacies.
- View drug order history.
- View supplier tenders.
- Manage pharmaceutical inventory.

### 2. Supplier
- Supplier registration and login.
- Supplier dashboard.
- View and search available drugs.
- Submit tenders for drug supply.
- Provide tender details such as quantity, unit price, and expiry date.

### 3. Pharmacy
- Pharmacy registration and login.
- Pharmacy dashboard.
- View and search available drugs.
- Place drug orders.
- Provide order details, including quantity and priority.
- Access drug ordering functionalities.

## Technologies Used

- **Backend:** ASP.NET Web Application (.NET Framework)
- **Frontend:** HTML, CSS, JavaScript, Bootstrap
- **Database:** Microsoft SQL Server
- **Database Management:** SQL Server Management Studio (SSMS)
- **Development Environment:** Visual Studio 2022

## System Design

The project includes the following UML and database design diagrams:

- Entity Relationship (ER) Diagram
- Use Case Diagram
- Class Diagram
- Sequence Diagram
- Activity Diagram
- Normalized Relational Schema

## Database Design

The system uses a Microsoft SQL Server database named `SPC_10`.

Main database tables include:

- Staff
- Supplier
- Pharmacy
- Drugs
- Drug Orders
- Tenders

## Testing

Manual testing was carried out to verify the main system functionalities.

The tested functionalities include:

- User registration and login.
- Adding, updating, searching, and deleting drugs.
- Viewing drug order history.
- Supplier tender submission.
- Pharmacy drug ordering.
- Cross-browser compatibility.
- Mobile responsiveness.

The documented test cases were marked as passed.

## Deployment Strategy

The report recommends **Docker + Kubernetes on a Cloud Platform** (Azure, AWS, or GCP) as a suitable deployment strategy for the proposed SPC system.

This approach supports scalability, high availability, automated deployment, and efficient service management.

## Future Improvements

- Integration with third-party payment gateways.
- Advanced analytics and drug demand forecasting.
- Improved security and authentication mechanisms.
- Further cloud-based deployment and service integration.

## Academic Information

- **Module:** CSE5013 – Service Oriented Computing
- **Qualification:** HD in Computing and Software Engineering
- **Institution:** ICBT Campus
- **University:** Cardiff Metropolitan University
- **Student:** D.M. Chathurya Hiruni Gunathilaka

## Author

**D.M. Chathurya Hiruni Gunathilaka**

---

*This project was developed as part of the Service Oriented Computing academic coursework.*
