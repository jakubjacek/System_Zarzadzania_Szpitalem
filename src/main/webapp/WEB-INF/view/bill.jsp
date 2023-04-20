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
    <title>Rachunek</title>
    <%@ include file="./components/common_cs_js.jsp"%>
</head>
<body>
<%@ include file="./components/navbar.jsp"%>
<%
    DoctorResource dResource = (DoctorResource)request.getAttribute("doctorResource");
    PatientResource pResource = (PatientResource)request.getAttribute("patientResource");
    Appointment appointment = (Appointment)request.getAttribute("appointment");
    MedicineResource mResource = (MedicineResource)request.getAttribute("medicineResource");
    MedicineCompanyResource mcResource = (MedicineCompanyResource)request.getAttribute("medicineCompany");
    Patient patient = pResource.getPatientById(appointment.getPatientid());
    Doctor doctor = dResource.getDoctorById(appointment.getDoctorid());

%>
<div class="offset-xl-2 col-xl-8 col-lg-12 col-md-12 col-sm-12 col-12 mt-4 padding">
    <div class="card card-border">
        <div class="card-header p-4">
            <img src="resources/images/logo.png" class="rounded mx-auto pt-2 d-inline-block" alt="img" height="70px" width="70px">
            <!--   <a class="pt-2 d-inline-block" href="index.html" data-abc="true">BBBootstrap.com</a> -->

            <div class="float-right">
                <h3 class="mb-0 text-color">id Wizyty: <%=appointment.getId()%></h3>
                Data wystawienia rachunku: <%=appointment.getBillingDate() %>
            </div>
        </div>
        <div class="card-body">
            <div class="row mb-4">
                <div class="col-sm-6">
                    <h2 class="mb-3 text-color">Dane Pacjenta:</h2>
                    <h3 class="text-dark mb-1">Imię i Nazwisko: <%=patient.getFirstname()+" "%><%=patient.getLastname() %></h3>
                    <div>Wiek: <%=patient.getAge() %></div>
                    <div>Grupa Krwi: <%=patient.getBloodgroup() %></div>
                    <div>Email: <%=patient.getEmailid() %></div>
                    <div>Numer Telefonu: +48 <%=patient.getMobileno() %></div>
                </div>
                <div class="col-sm-6 ">
                    <h2 class="mb-3 text-color">Dane Lekarza: </h2>
                    <h3 class="text-dark mb-1">Imię i Nazwisko: <%=doctor.getFirstname()+" "%><%=doctor.getLastname()%></h3>
                    <div>Specjalność:  <%=doctor.getSpecialist() %></div>
                </div>
            </div>

            <%
                List<Medicine> medicines = appointment.getMedicines();
            %>
            <div class="text-center text-color"><h2>Przepisane Lekarstwa</h2></div>
            <div class="table-responsive-sm mt-3">
                <table class="table table-striped">
                    <thead class="custom-bg">
                    <tr class="text-color">
                        <th>Nazwa Lekarstwa</th>
                        <th>Rodzaj Lekarstwa</th>
                        <th>Firma</th>
                        <th>Data ważności</th>
                        <th>Ilość</th>
                        <th>Cena</th>
                    </tr>
                    </thead>
                    <%
                        for(Medicine m : medicines) {
                    %>
                    <tbody>
                    <tr>
                        <td><%=m.getName()%></td>
                        <td><%=m.getType() %></td>
                        <td><%=mcResource.getCompanyById(m.getCompanyid()).getName() %></td>
                        <td><%=m.getExpirydate()%></td>
                        <td><%=m.getQuantity() %></td>
                        <td><%=m.getPrice() %></td>
                    </tr>
                    </tbody>
                    <%
                        }
                    %>
                </table>
            </div>
            <div class="row">
                <div class="col-lg-4 col-sm-5">
                </div>
                <div class="col-lg-4 col-sm-5 ml-auto">
                    <table class="table table-clear">
                        <tbody>
                        <tr>
                            <td class="left">
                                <strong class="text-color">Lekarstwa ze Szpitala: </strong>
                            </td>
                            <td class="right"><b><%=appointment.getWantMedicine() %></b></td>
                        </tr>
                        <tr>
                            <td class="left">
                                <strong class="text-color">Cena Lekarstw:</strong>
                            </td>
                            <td class="right"><b>zł <%if(appointment.getWantMedicine().equals(DatabaseConstants.WantMedicinesFromHospital.YES.value())) {%><%=mResource.getMedicinesPrice(medicines) %>
                                <% }
                                else { %>
                                0.0
                                <% } %>
                            </b>
                            </td>
                        </tr>
                        <tr>
                            <td class="left">
                                <strong class="text-color">Cena Leczenia:</strong>
                            </td>
                            <td class="right"><b>zł <%=appointment.getTreatmentprice() %></b></td>
                        </tr>
                        <tr>
                            <td class="left">
                                <strong class="text-color">Cena Całkowita:</strong>
                            </td>
                            <td class="right"><b>zł <%if(appointment.getWantMedicine().equals(DatabaseConstants.WantMedicinesFromHospital.YES.value())) {%><%=mResource.getTotalPrice(mResource.getMedicinesPrice(medicines),String.valueOf(appointment.getTreatmentprice()))%><%
                            }
                            else {
                            %>
                                <%=mResource.getTotalPrice("0.0", String.valueOf(appointment.getTreatmentprice())) %>
                                <%
                                    }
                                %>
                            </b>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="card-footer bg-white text-center">
            <a href="downloadBill?appointmentId=<%=appointment.getId()%>"><button type="button"
                                                                                  class="btn custom-bg text-color">Pobierz rachunek</button></a>
        </div>
    </div>
</div>
</body>
</html>