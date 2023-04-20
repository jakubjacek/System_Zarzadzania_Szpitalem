<%@page import="jj.systemszpitalny.service.DoctorServiceImp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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
    <title>Recepcjonista Rejestracja</title>
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
                    <img src="resources/images/zdjrejestracja.png" class="rounded mx-auto d-block" alt="img" height="90px" width="90px">
                    <h3 class="text-center my-3">Recepcjonista Rejestracja</h3>
                    <form action="receptionistregister" method="post">
                        <div class="row">
                            <div class="form-group">
                                <label for="name">Imię</label>
                                <input type="text" class="form-control" id="firstname" aria-describedby="emailHelp" name="firstname" placeholder="Wprowadź imię..." required>
                            </div>

                            <div class="form-group ml-4">
                                <label for="name">Nazwisko</label>
                                <input type="text" class="form-control" id="lastname" aria-describedby="emailHelp" name="lastname" placeholder="Wprowadź nazwisko..." required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="email" class="form-control" id="emailid" aria-describedby="emailHelp" name="emailid" placeholder="Wprowadź email..." required>
                            </div>
                            <div class="form-group ml-4">
                                <label for="email">Nazwa użytkownika</label>
                                <input type="text" class="form-control" id="emailid" aria-describedby="emailHelp" name="username" placeholder="Wprowadź nazwę użytkownika..." required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label for="email">Wiek</label>
                                <input type="number" class="form-control" id="mobileno" aria-describedby="emailHelp" name="age" placeholder="Wprowadź wiek..." required>
                            </div>
                            <div class="form-group ml-4">
                                <label for="email">Ulica</label>
                                <input type="text" class="form-control" id="street" aria-describedby="emailHelp" name="street" placeholder="Wprowadź ulicę..." required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label for="name">Miasto</label>
                                <input type="text" class="form-control" id="city" aria-describedby="emailHelp" name="city" placeholder="Wprowadź miasto" required>
                            </div>

                            <div class="form-group   ml-4">
                                <label for="email">Kod <Pin></Pin></label>
                                <input type="number" class="form-control" id="pincode" aria-describedby="emailHelp" name="pincode" placeholder="Wprowadź kod pin..." required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label for="email">Numer Telefonu</label>
                                <input type="number" class="form-control" id="password" aria-describedby="emailHelp" name="mobileno" placeholder="Wprowadź numer telefonu..." required>
                            </div>

                            <div class="form-group ml-4">
                                <label for="name">Hasło</label>
                                <input type="password" class="form-control" id="password" aria-describedby="emailHelp" name="password" placeholder="Wprowadź hasło..." required>
                            </div>
                        </div>
                        <%
                            Date date = new Date();
                            SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
                            String strDate= formatter.format(date);
                        %>
                        <div class="row">
                            <div class="form-group">
                                <label for="rdate">Data Rejestracji</label>
                                <input type="text" class="form-control" id="rdate" aria-describedby="emailHelp" name="registerdate" value="<%=strDate%>" readonly required>
                            </div>
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
</body>
</html>