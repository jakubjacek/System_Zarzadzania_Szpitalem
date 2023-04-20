<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
    <title>Dodaj Dystrybutora Lekarstw</title>
    <%@ include file="./components/common_cs_js.jsp"%>
</head>
<body>
<%@ include file="./components/navbar.jsp"%>
<div class="container-fluid">
    <div class="row mt-2">
        <div class="col-md-4 offset-md-4 admin" >
            <div class="card">
                <%@ include file="./components/message.jsp"%>
                <%
                    Date date = new Date();
                    SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
                    String strDate = formatter.format(date);
                %>
                <div class="card-body px-5">
                    <h3 class="text-center my-3">Dodaj Dystrybutora</h3>
                    <form action="addmedicinedistributor" method="post">
                        <div class="row">
                            <div class="form-group">
                                <label for="name">Nazwa</label>
                                <input type="text" class="form-control" id="firstname" aria-describedby="emailHelp" name="name" placeholder="Wprowadź nazwę..." required>
                            </div>

                            <div class="form-group ml-4">
                                <label for="name">Email</label>
                                <input type="email" class="form-control" id="lastname" aria-describedby="emailHelp" name="emailid" placeholder="Wprowadź email..." required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label for="email">Numer telefonu</label>
                                <input type="text" class="form-control" id="username" aria-describedby="emailHelp" name="mobileno" placeholder="Wprowadź numer telefonu..." required>
                            </div>

                            <div class="form-group ml-4">
                                <label for="name">Ulica</label>
                                <input type="text" class="form-control" id="street" aria-describedby="emailHelp" name="street" placeholder="Wprowadź ulicę.." required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label for="name">Miasto</label>
                                <input type="text" class="form-control" id="city" aria-describedby="emailHelp" name="city" placeholder="Wprowadź miasto.." required>
                            </div>

                            <div class="form-group   ml-4">
                                <label for="email">Kod Pin</label>
                                <input type="number" class="form-control" id="pincode" aria-describedby="emailHelp" name="pincode" placeholder="Wprowadź kod pin.." required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="name">Data Rejestracji</label>
                            <input type="text" class="form-control" id="street" aria-describedby="emailHelp" name="registerdate" value="<%=strDate %>" required>
                        </div>
                        <div class="container text-center">
                            <button class="btn custom-bg text-color"><b>Zarejestruj Dystrybutora</b></button>
                        </div>

                    </form>
                </div>
            </div>


        </div>
    </div>
</div>
</body>
</html>