using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Services;
using Business;

namespace State_Pharmaceutical_Cooperation
{
    /// <summary>
    /// Summary description for SPCService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class SPCService : System.Web.Services.WebService
    {

        [WebMethod]

        public int insertStaff(int id, string username, string stafftype, string locationId, string email, int phoneNumber, string password)
        {
            try
            {
                tblStaff staff = new tblStaff();
                staff.StaffId = id;
                staff.Username = username;
                staff.StaffType = stafftype;
                staff.LocationID = locationId;
                staff.Email = email;
                staff.PhoneNumber = phoneNumber;
                staff.Password = password;
                return staff.RegStaff();
            }
            catch
            {
                throw;
            }
        }
        [WebMethod]
        public bool staffLogin(string email, string password)
        {
            try
            {
                tblStaff staff = new tblStaff();
                staff.Email = email;
                staff.Password = password;
                return staff.LoginStaff();
            }
            catch
            {
                throw;
            }
        }
        [WebMethod]
        public DataSet getAllStaff()
        {
            try
            {
                tblStaff staff = new tblStaff();
                return staff.GetAllStaff();
            }
            catch
            {
                throw;
            }
        }

        [WebMethod]

        public int insertSupplier(int id, string companyName, string email, int contactNumber, string businessAddress, string password)
        {
            try
            {
                Supplier supplier = new Supplier();
                supplier.SupplierID = id;
                supplier.CompanyName = companyName;
                supplier.Email = email;
                supplier.ContactNumber = contactNumber;
                supplier.BusinessAddress = businessAddress;
                supplier.Password = password;
                return supplier.RegSupplier();
            }
            catch
            {
                throw;
            }
        }

        [WebMethod]
        public bool supplierLogin(string email, string password)
        {
            try
            {
                Supplier supplier = new Supplier();
                supplier.Email = email;
                supplier.Password = password;
                return supplier.LoginSupplier();
            }
            catch
            {
                throw;
            }
        }
        [WebMethod]
        public DataSet getAllSupplier()
        {
            try
            {
                Supplier supplier = new Supplier();
                return supplier.GetAllSuppliers();
            }
            catch
            {
                throw;
            }
        }
        [WebMethod]
        public int deleteSupplier(int id)
        {
            try
            {
                Supplier supplier = new Supplier();
                supplier.SupplierID = id;
                return supplier.deleteSupplier();
            }
            catch
            {
                throw;
            }
        }


        [WebMethod]

        public int insertPharmacy(int id, string pharmacyName, string email, int phoneNumber, string address, string password)
        {
            try
            {
                Pharmacy pha = new Pharmacy();
                pha.PharmacyID = id;
                pha.PharmacyName = pharmacyName;
                pha.Email = email;
                pha.PhoneNumber = phoneNumber;
                pha.Address = address;
                pha.Password = password;
                return pha.RegPharmacy();
            }
            catch
            {
                throw;
            }
        }
        [WebMethod]
        public bool pharmacyLogin(string email, string password)
        {
            try
            {
                Pharmacy pharmacy = new Pharmacy();
                pharmacy.Email = email;
                pharmacy.Password = password;
                return pharmacy.LoginPharmacy();
            }
            catch
            {
                throw;
            }
        }

        [WebMethod]
        public DataSet getAllPharmacies()
        {
            try
            {
                Pharmacy pharmacy = new Pharmacy();
                return pharmacy.GetAllPharmacies();
            }
            catch
            {
                throw;
            }
        }
        [WebMethod]
        public int deletePharmacy(int id)
        {
            try
            {
                Pharmacy pharmacy = new Pharmacy();
                pharmacy.PharmacyID = id;
                return pharmacy.deletePharmacy();
            }
            catch
            {
                throw;
            }
        }


        [WebMethod]
        public int drugInsert(int id, string drugname, string manufacture, string price, string stock)
        {
            try
            {
                Drugs drug = new Drugs();
                drug.DrugID = id;
                drug.DrugName = drugname;
                drug.Manufacture = manufacture;
                drug.Price = price;
                drug.Stock = stock;
                return drug.insertDrug();
            }
            catch
            {
                throw;
            }
        }

        [WebMethod]

        public List<string> findDrugByID(int id)
        {
            try
            {
                Drugs drug = new Drugs();
                drug.DrugID = id;
                return drug.selectById();
            }
            catch
            {
                throw;
            }
        }

        [WebMethod]

        public int drugUpdate(int id, string drugname, string manufacture, string price, string stock)
        {
            try
            {
                Drugs drug = new Drugs();
                drug.DrugID = id;
                drug.DrugName = drugname;
                drug.Manufacture = manufacture;
                drug.Price = price;
                drug.Stock = stock;
                return drug.updateDrug();
            }
            catch
            {
                throw;
            }
        }

        [WebMethod]

        public int drugDelete(int id)
        {
            try
            {
                Drugs drug = new Drugs();
                drug.DrugID = id;
                return drug.deleteDrug();
            }
            catch
            {
                throw;
            }
        }

        [WebMethod]

        public DataSet selectAll()
        {
            try
            {
                Drugs drug = new Drugs();
                return drug.selectAll();
            }
            catch (Exception)
            {
                throw;
            }
        }
        [WebMethod]
        public int insertTender(string tenderTitle, string email, string phoneNumber, string drugName,
                       int quantity, decimal unitPrice, string manufacturer,
                       DateTime expiryDate, string description)
        {
            try
            {
                Tenders tender = new Tenders();
                tender.TenderTitle = tenderTitle;
                tender.Email = email;
                tender.PhoneNumber = phoneNumber;
                tender.DrugName = drugName;
                tender.Quantity = quantity;
                tender.UnitPrice = unitPrice;
                tender.Manufacturer = manufacturer;
                tender.ExpiryDate = expiryDate;
                tender.Description = description;
                return tender.SubmitTender();
            }
            catch
            {
                throw;
            }
        }
        [WebMethod]
        public DataSet getAllTenders()
        {
            try
            {
                Tenders tender = new Tenders();
                return tender.GetAllTenders();
            }
            catch
            {
                throw;
            }
        }
        [WebMethod]
        public bool DeleteTender(int tenderId)
        {
            try
            {
                Tenders tender = new Tenders();
                tender.TenderID = tenderId;
                return tender.deleteTender() > 0;
            }
            catch
            {
                throw;
            }
        }


        [WebMethod]
        public int insertOrder(int id, DateTime orderDate, string drugName, int quantity, DateTime deliveryDate, string priority, string notes)
        {
            try
            {
                Order order = new Order();
                order.OrderID = id;
                order.OrderDate = orderDate;
                order.DrugName = drugName;
                order.Quantity = quantity;
                order.DeliveryDate = deliveryDate;
                order.Priority = priority;
                order.Notes = notes;
                return order.insertOrder();
            }
            catch
            {
                throw;
            }
        }


        [WebMethod]
        public int deleteOrder(int id)
        {
            try
            {
                Order order = new Order();
                order.OrderID = id;
                return order.deleteOrder();
            }
            catch
            {
                throw;
            }
        }

        [WebMethod]
        public string[] getOrderById(int id)
        {
            try
            {
                Order order = new Order();
                order.OrderID = id;
                return order.selectById().ToArray();
            }
            catch
            {
                throw;
            }
        }

        [WebMethod]
        public DataSet getAllOrders()
        {
            try
            {
                Order order = new Order();
                return order.selectAll();
            }
            catch
            {
                throw;
            }
        }
    }
}
