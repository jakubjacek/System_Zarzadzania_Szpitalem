<%@page import="jj.systemszpitalny.service.DoctorServiceImp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import ="jj.systemszpitalny.model.*"%>
<%@ page import ="jj.systemszpitalny.dao.*"%>
<%@ page import ="jj.systemszpitalny.resource.*"%>
<%@ page import ="jj.systemszpitalny.constants.*"%>
<%@ page import ="java.sql.*"%>
<%@ page import ="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Aktualizacja Lekarstwa</title>
    <%@ include file="./components/common_cs_js.jsp"%>
</head>
<body>
<%@ include file="./components/navbar.jsp"%>

<%
    Medicine  medicine = (Medicine)request.getAttribute("medicine");
%>

<div class="container-fluid">
    <div class="row mt-2">
        <div class="col-md-4 offset-md-4 admin" >
            <div class="card">
                <%@ include file="./components/message.jsp"%>
                <div class="card-body px-5">
                    <h3 class="text-center my-3">Aktualizowanie Lekarstwa</h3>
                    <form action="updatemedicine" method="post">

                        <div class="form-group">
                            <label for="id">Id Lekarstwa</label>
                            <input type="text" class="form-control" id="id" aria-describedby="emailHelp" name="id" value="<%=medicine.getId()%>" readonly required>
                        </div>

                        <div class="row">
                            <div class="form-group">
                                <label for="name">Nazwa</label>
                                <input type="text" class="form-control" id="firstname" aria-describedby="emailHelp" name="name" value="<%= medicine.getName()%>" required>
                            </div>

                            <div class="form-group ml-4">
                                <label for="email">Typ </label>
                                <select name="type" class="form-control">
                                    <option value="0">Wybierz typ</option>
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
                                <label for="date">Data Produkcji</label>
                                <div class="input-group date">
                                    <input type="text" class="form-control" id="username" aria-describedby="emailHelp" name="manufacturedate" value="<%= medicine.getManufacturedate()%>" required>

                                </div>
                            </div>

                            <div class="form-group ml-4">
                                <label for="date">Data Ważności</label>
                                <input type="text" class="form-control" id="emailid" aria-describedby="emailHelp" name="expirydate" value="<%= medicine.getExpirydate()%>" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label for="email">Ilość</label>
                                <input type="number" class="form-control" id="mobileno" aria-describedby="emailHelp" name="quantity" value="<%= medicine.getQuantity()%>" required>
                            </div>

                            <div class="form-group ml-4">
                                <label for="email">Cena</label>
                                <input type="number" class="form-control" id="mobileno" aria-describedby="emailHelp" name="price" value="<%= medicine.getPrice()%>" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label for="email">Dystrybutor Lekarstwa</label>
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
                                <label for="email">Firma Medyczna</label>
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

                        <div class="form-group">
                            <label for="datereg">Data Lekarstwa Dodana</label>
                            <input type="text" class="form-control" id="datereg" aria-describedby="emailHelp" name="dateAdded" value="<%= medicine.getDateAdded()%>" readonly required>
                        </div>

                        <div class="container text-center">
                            <button class="btn custom-bg text-color"><b>Zatwierdź</b></button>
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