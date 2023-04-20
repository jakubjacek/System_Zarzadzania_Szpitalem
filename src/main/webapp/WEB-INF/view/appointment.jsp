<%@page import="jj.systemszpitalny.service.DoctorServiceImp"%>
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
<%@ page import ="java.time.LocalDate"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dodaj wizytę</title>
    <%@ include file="./components/common_cs_js.jsp"%>
</head>
<body>
<%@ include file="./components/navbar.jsp"%>
<div class="container-fluid">
    <div class="mt-2">
        <div class="" >
            <div class="card card-border mx-auto" style="width: 40rem;">
                <%@ include file="./components/message.jsp"%>
                <div class="card-body mx-auto">
                    <h3 class="text-center my-3">Dodaj wizytę</h3>

                    <form class="form-inline" action="getpatient">
                        <div class="form-group mb-2">
                            <input type="number" class="form-control-plaintext" id="staticEmail2" name="patientid" placeholder="id Pacjenta..." required>
                        </div>

                        <button type="submit" class="btn custom-bg text-color ml-4">Dodaj Pacjenta</button>
                    </form>


                    <%
                        Patient patient = (Patient) request.getAttribute("patient");
                    %>
                    <div class="mt-3">
                        <form action="addappointment" method="post">
                            <input type="hidden" name="patientid" value="<% if(patient != null) { %> <%=patient.getId() %> <% } %>">
                            <div class="row">
                                <div class="form-group">
                                    <label for="email">Imię </label>
                                    <input type="email" class="form-control" aria-describedby="emailHelp" value="<% if(patient != null) { %> <%=patient.getFirstname() %> <% } %>" readonly required>
                                </div>
                                <div class="form-group ml-4">
                                    <label for="email">Wiek </label>
                                    <input type="text" class="form-control" aria-describedby="emailHelp" value="<% if(patient != null) { %> <%=patient.getAge() %> <% } %>" readonly required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group">
                                    <label for="email">Grupa krwi </label>
                                    <input type="text" class="form-control" aria-describedby="emailHelp"  value="<% if(patient != null) { %> <%=patient.getBloodgroup() %> <% } %>"  readonly required>
                                </div>
                                <%
                                    Date date = new Date();
                                    SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
                                    String strDate= formatter.format(date);
                                %>
                                <div class="form-group ml-4">
                                    <label for="email">Data rejestracji</label>
                                    <input type="text" class="form-control" aria-describedby="emailHelp" name="appointmenttakendate" value="<%=strDate %>" readonly required>
                                </div>

                            </div>
                            <%
                                DateFormat dateFormat = new SimpleDateFormat("hh:mm aa");
                                String dateString = dateFormat.format(new Date()).toString();
                            %>
                            <div class="row">
                                <div class="form-group">
                                    <label for="name">Godzina rejestracji</label>
                                    <input type="text" class="form-control" aria-describedby="emailHelp" name="appointmenttakentime" value="<%=dateString %>" readonly required>
                                </div>
                                <div class="form-group ml-4">
                                    <label for="email">Lekarz</label>
                                    <select name="doctorid" class="form-control">
                                        <option value="0">Wybierz Lekarza</option>
                                        <%
                                            DoctorResource doctorResource = (DoctorResource)request.getAttribute("doctorResource");
                                            List<Doctor> doctors = doctorResource.getAllDoctor();
                                            for(Doctor doctor : doctors)
                                            {
                                        %>
                                        <option value="<%=doctor.getId()%>"><%=doctor.getFirstname()%>(<%=doctor.getSpecialist() %>)</option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group">
                                    <label for="email">Data wizyty</label>
                                    <input type="text" class="form-control" aria-describedby="emailHelp" name="appointmentdate" required>
                                </div>
                                <div class="form-group ml-4">
                                    <label for="email">Czas wizyty</label>
                                    <select name="appointmenttime" class="form-control">
                                        <option value="0">Wybierz godzinę</option>
                                        <%

                                            for(DatabaseConstants.AppointmentTiming time : DatabaseConstants.AppointmentTiming.values())
                                            {
                                        %>
                                        <option value="<%=time.value()%>"><%=time.value() %></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>
                            <div class="">
                                <div class="form-group">
                                    <label for="password"></label>
                                    <textarea class="form-control" id="exampleFormControlTextarea1" name="problemdescription" rows="3" placeholder="Wprowadź opis..." required></textarea>
                                </div>
                            </div>
                            <div class="container text-center">
                                <button class="btn custom-bg text-color"><b>Dodaj wizytę</b></button>
                            </div>

                        </form>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
</body>
</html>