<%@page import="jj.systemszpitalny.constants.DatabaseConstants.TreatmentStatus"%>
<%@page import="jj.systemszpitalny.constants.DatabaseConstants.BillMade"%>
<%@page import="jj.systemszpitalny.constants.DatabaseConstants.WantMedicinesFromHospital"%>
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
<%@ page import ="java.time.LocalDate"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Wyszukaj Wizytę</title>
    <%@ include file="./components/common_cs_js.jsp"%>
</head>
<body>
<%@ include file="./components/navbar.jsp"%>
<div class="container-fluid">
    <div class="row mt-4">
        <form class="form-inline ml-5" action="searchappointmentbyid">
            <div class="form-group">
                <label for="inputPassword2" class="text-color"><h4>Po id: </h4></label>
                <input type="number" class="form-control ml-3" id="inputPassword2" name="appointmentid" placeholder="Wprowadź id wizyty...">
            </div>
            <button type="submit" class="btn text-color custom-bg ml-2">Wyszukaj</button>
        </form>
        <form class="form-inline mt-1" action="searchappointmentbypatientname">
            <div class="form-group">
                <label for="inputPassword2" class="text-color ml-5"><h4>Po imieniu pacjenta: </h4></label>
                <input type="text" class="form-control ml-3" id="inputPassword2" name="patientname" placeholder="Wprowadź imię pacjenta...">
            </div>
            <button type="submit" class="btn text-color custom-bg ml-2">Wyszukaj</button>
        </form>
        <form class="form-inline mt-1" action="searchappointmentbydate">
            <div class="form-group">
                <label for="inputPassword2" class="text-color ml-5"><h4>Po dacie: </h4></label>
                <input type="text" class="form-control ml-3" id="inputPassword2" name="appointmentdate" placeholder="Wprowadź datę...">
            </div>
            <button type="submit" class="btn text-color custom-bg ml-2">Wyszukaj</button>
        </form>
        <%
            Date date = new Date();
            SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
            String strDate= formatter.format(date);
        %>
        <a href="searchappointmentbydate?appointmentdate=<%=strDate%>" class="ml-2"><button class="btn text-color custom-bg ml-2">Dzisiejsze wizyty</button></a>
    </div>
    <div class="table-responsive">
        <table class="table">
            <thead class="custom-bg text-color">
            <tr>
                <th scope="col">Numer Wizyty</th>
                <th scope="col">Imię </th>
                <th scope="col">Wiek </th>
                <th scope="col">Grupa krwi </th>
                <th scope="col">Numer Telefonu </th>
                <th scope="col">Lekarz Prowadzący</th>
                <th scope="col">Data Rezerwacji Wizyty </th>
                <th scope="col">Data Leczenia</th>
                <th scope="col">Czas Leczenia</th>
                <th scope="col">Status Leczenia</th>
                <th scope="col">Cena Leczenia</th>
                <th scope="col">Więcej informacji</th>
            </tr>
            </thead>

            <%
                List<Appointment> listOfAppointments = (List<Appointment>)request.getAttribute("appointments");
                PatientResource patientResource = (PatientResource)request.getAttribute("patientResource");
                DoctorResource doctorResource = (DoctorResource)request.getAttribute("doctorResource");

                if(listOfAppointments != null ) {
                    for(Appointment a : listOfAppointments) {
                        Patient patient = patientResource.getPatientById(a.getPatientid());
                        Doctor doctor = doctorResource.getDoctorById(a.getDoctorid());
            %>
            <tbody>
            <tr class="text-center">
                <td class="mid-align"><%=a.getId()%></td>
                <td class="mid-align"><%=patient.getFirstname() %></td>
                <td class="mid-align"><%=patient.getAge() %></td>
                <td class="mid-align"><%=patient.getBloodgroup() %></td>
                <td class="mid-align"><%=patient.getMobileno() %></td>
                <td class="mid-align"><%=doctor.getFirstname()+" " %>(<%= doctor.getSpecialist() %>)</td>
                <td class="mid-align"><%=a.getAppointmenttakendate()+" " %><%=a.getAppointmenttakentime() %></td>
                <td class="mid-align"><%=a.getAppointmentdate() %></td>
                <td class="mid-align"><%=a.getAppointmenttime() %></td>
                <td class="mid-align <%if(TreatmentStatus.DONE.value().equals(a.getTreatmentstatus())) { %>text-success <% } else if(TreatmentStatus.PENDING.value().equals(a.getTreatmentstatus())) { %> text-danger <% }%>"><%=a.getTreatmentstatus()%></td>
                <td class="mid-align"><%=a.getTreatmentprice()%></td>
                <td class="mid-align">

                    <%
                        if(TreatmentStatus.DONE.value().equals(a.getTreatmentstatus()) && a.getBillMade().equals(BillMade.NO.value())) {
                    %>
                    <a href="makebill?appointmentId=<%=a.getId()%>"><button type="button"
                                                                            class="btn custom-bg text-color">Wystaw Rachunek</button></a>
                    <%
                    }
                    else if(TreatmentStatus.DONE.value().equals(a.getTreatmentstatus()) && a.getBillMade().equals(BillMade.YES.value())) {
                    %>
                    <a href="downloadBill?appointmentId=<%=a.getId()%>"><button type="button"
                                                                                class="btn custom-bg text-color">Pobierz Rachunek</button></a>
                    <%
                    }

                    else if(TreatmentStatus.PENDING.value().equals(a.getTreatmentstatus())) {
                    %>
                    <span class="text-danger">Oczekiwanie na leczenie</span>
                    <%
                        }
                    %>
                </td>
            </tr>
            </tbody>
            <%
                    }
                }
            %>
        </table>
    </div>
</div>

</body>
</html>