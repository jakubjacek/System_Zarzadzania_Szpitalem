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
    <title>Wyświetl Wizytę</title>
    <%@ include file="./components/common_cs_js.jsp"%>
</head>
<body>
<%@ include file="./components/navbar.jsp"%>
<%@ include file="./components/message.jsp"%>
<%
    DoctorResource dResource = (DoctorResource)request.getAttribute("doctorResource");
    PatientResource pResource = (PatientResource)request.getAttribute("patientResource");
    Appointment appointment = (Appointment)request.getAttribute("appointment");
    Patient patient = pResource.getPatientById(appointment.getPatientid());
%>
<div class="container-fluid">
    <div class="row mt-2">
        <div class="col-md-4 mx-auto" >
            <div class="card card-border mx-auto" style="width: 35rem;">

                <div class="card-body px-5 mx-auto">
                    <h3 class="text-center my-3">Dane Wizyty</h3>
                    <div class="container">
                        <form action="updateappointment">
                            <input type="hidden" name="appointmentId" value="<%=appointment.getId()%>">

                            <div class="row">
                                <div class="form-group">
                                    <label for="email">Imię</label>
                                    <input type="email" class="form-control" aria-describedby="emailHelp" value="<%= patient.getFirstname() %>" readonly required>
                                </div>

                                <div class="form-group ml-2">
                                    <label for="email">Nazwisko</label>
                                    <input type="email" class="form-control" aria-describedby="emailHelp" value="<%= patient.getLastname() %>" readonly required>
                                </div>

                            </div>
                            <div class="row">
                                <div class="form-group">
                                    <label for="email">Grupa Krwi</label>
                                    <input type="text" class="form-control" aria-describedby="emailHelp"  value="<%=patient.getBloodgroup()%>"  readonly required>
                                </div>

                                <div class="form-group ml-2">
                                    <label for="email">Wiek</label>
                                    <input type="text" class="form-control" aria-describedby="emailHelp" value="<%= patient.getAge()%>" readonly required>
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group">
                                    <label for="email">Data Wizyty</label>
                                    <input type="text" class="form-control" aria-describedby="emailHelp" value="<%=appointment.getAppointmentdate() %>" required readonly>
                                </div>
                                <div class="form-group ml-2">
                                    <label for="email">Godzina Wizyty</label>
                                    <input type="text" class="form-control" aria-describedby="emailHelp" value="<%=appointment.getAppointmenttime() %>" required readonly>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="exampleFormControlTextarea1">Opis Problemu</label>
                                <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" required readonly><%=appointment.getProblemdescription() %></textarea>
                            </div>

                            <div class="form-group">
                                <label for="email">Status Leczenia</label>
                                <select name="treatmentStatus" class="form-control">
                                    <option value="0">wybierz</option>
                                    <%
                                        for(DatabaseConstants.TreatmentStatus tStatus : DatabaseConstants.TreatmentStatus.values())
                                        {
                                    %>
                                    <option value="<%=tStatus.value()%>"><%=tStatus.value() %></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="email">Cena Leczenia</label>
                                <input type="number" class="form-control" aria-describedby="emailHelp" name="treatmentprice" required>
                            </div>


                            <div class="container text-center">
                                <button class="btn custom-bg text-color"><b>Zatwierdź</b></button>
                            </div>

                        </form>
                    </div>

                    <h3 class="text-center my-3">Przepisane lekarstwa dla Pacjenta</h3>
                    <div class="container mx-auto">
                        <form class="form-inline" action="assignMedicinesToPatient" method="post">
                            <input type="hidden" name="appointmentId" value="<%=appointment.getId()%>">
                            <div class="form-group">

                                <select name="medicineId" class="form-control" style="width: 22rem;">
                                    <option value="0">Wybierz Lekarstwo</option>
                                    <%
                                        MedicineResource medicineResource = (MedicineResource) request.getAttribute("medicineResource");
                                        List<Medicine> medicines = medicineResource.getAllAvailableMedicines();
                                        for(Medicine medicine : medicines)
                                        {
                                    %>
                                    <option value="<%=medicine.getId()%>"><%=medicine.getName()+" " %><%=medicine.getType() %></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>

                            <button type="submit" class="btn text-color custom-bg ml-2">Dodaj</button>
                            <%
                                List<Medicine> mds = (List<Medicine>)request.getAttribute("medicines");
                            %>

                            <div class="form-group mt-2">
                   <textarea class="form-control" id="exampleFormControlTextarea1" rows="6" cols="49" required readonly>
                      <% if(mds != null)
                      {
                          for(Medicine m : mds)
                          {
                      %>
                               <%=m.getName()+", " %>
                      <%
                              }
                          }
                      %>
                   </textarea>
                            </div>

                        </form>

                    </div>

                    <div class="container-fluid text-center mt-2">
                        <a href="assignMedicinesToPatientDB?appointmentId=<%=appointment.getId()%>"><button class="btn custom-bg text-color">Zatwierdź lekarstwa</button></a>
                    </div>

                </div>
            </div>

        </div>
    </div>
</div>
</body>
</html>