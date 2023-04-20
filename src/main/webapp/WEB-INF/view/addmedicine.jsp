<%@page import="jj.systemszpitalny.service.DoctorServiceImp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import ="jj.systemszpitalny.model.*"%>
<%@ page import ="jj.systemszpitalny.dao.*"%>
<%@ page import ="jj.systemszpitalny.resource.*"%>
<%@ page import ="jj.systemszpitalny.constants.*"%>
<%@ page import ="java.sql.*"%>
<%@ page import ="java.util.Date"%>
<%@ page import ="java.util.*"%>
<%@ page import ="java.text.SimpleDateFormat"%>
<%@ page import ="java.text.DateFormat"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dodaj Lekarstwo</title>
    <%@ include file="./components/common_cs_js.jsp"%>
</head>
<body>
<%@ include file="./components/navbar.jsp"%>
<div class="container-fluid">
    <div class="row mt-2">
        <div class="col-md-4 offset-md-4 admin" >
            <div class="card">
                <%@ include file="./components/message.jsp"%>
                <div class="card-body px-5">
                    <h3 class="text-center my-3">Dodaj Lekarstwo</h3>
                    <form action="addmedicine" method="post">
                        <div class="row">
                            <div class="form-group">
                                <label for="name">Nazwa</label>
                                <input type="text" class="form-control" id="firstname" aria-describedby="emailHelp" name="name" placeholder="Wprowadź nazwę.." required>
                            </div>

                            <div class="form-group ml-4">
                                <label for="email">Rodzaj Lekarstwa</label>
                                <select name="type" class="form-control">
                                    <option value="0">Wybierz rodzaj lekarstwa</option>
                                    <%

                                        for(DatabaseConstants.MedicineType medicineType : DatabaseConstants.MedicineType.values())
                                        {
                                    %>
                                    <option value="<%=medicineType.value()%>"><%=medicineType.value() %></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label for="data">Data Produkcji</label>
                                <div class="input-group date">
                                    <input type="text" class="form-control" id="username" aria-describedby="emailHelp" name="manufacturedate" placeholder="Wybierz datę..." required>

                                </div>
                            </div>

                            <div class="form-group ml-4">
                                <label for="date">Data Ważności</label>
                                <input type="text" class="form-control" id="emailid" aria-describedby="emailHelp" name="expirydate" placeholder="Wprowadź datę ważności..." required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label for="email">Ilość</label>
                                <input type="number" class="form-control" id="mobileno" aria-describedby="emailHelp" name="quantity" placeholder="Wprowadź ilość.." required>
                            </div>

                            <div class="form-group ml-4">
                                <label for="email">Cena</label>
                                <input type="number" class="form-control" id="mobileno" aria-describedby="emailHelp" name="price" placeholder="Wprowadź cenę.." required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label for="email">Dystrybutor</label>
                                <select name="distributorid" class="form-control">
                                    <option value="0">Wybierz Dystrybutora</option>
                                    <%
                                        MedicineDistributorResource medicineDistributorResource = (MedicineDistributorResource) request.getAttribute("medicineDistributorResource");
                                        List<MedicineDistributor> medicineDistributors = medicineDistributorResource.getAllDistributors();
                                        for(MedicineDistributor medicineDistributor : medicineDistributors)
                                        {
                                    %>
                                    <option value="<%=medicineDistributor.getId()%>"><%=medicineDistributor.getName() %></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>

                            <div class="form-group ml-4">
                                <label for="email">Firma</label>
                                <select name="companyid" class="form-control">
                                    <option value="0">Wybierz Firmę</option>
                                    <%
                                        MedicineCompanyResource medicineCompanyResource = (MedicineCompanyResource) request.getAttribute("medicineCompanyResource");
                                        List<MedicineCompany> medicineCompanys = medicineCompanyResource.getAllCompanys();
                                        for(MedicineCompany medicineCompany : medicineCompanys)
                                        {
                                    %>
                                    <option value="<%=medicineCompany.getId()%>"><%=medicineCompany.getName() %></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                        </div>

                        <%
                            Date date = new Date();
                            SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
                            String strDate= formatter.format(date);
                        %>

                        <div class="form-group">
                            <label for="datereg">Data dodania Lekarstwa</label>
                            <input type="text" class="form-control" id="datereg" aria-describedby="emailHelp" name="dateAdded" value="<%=strDate%>" readonly required>
                        </div>

                        <div class="container text-center">
                            <button class="btn custom-bg text-color"><b>Zarejestruj</b></button>
                        </div>

                    </form>
                </div>
            </div>

        </div>
    </div>
</div>
<script type="text/javascript">
    $(function() {
        $('#datapicker').datepicker();
    });
</script>
</body>
</html>