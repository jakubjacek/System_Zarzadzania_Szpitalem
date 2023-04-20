<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="jj.systemszpitalny.model.*"%>
<%@ page import="jj.systemszpitalny.dao.*"%>
<%@ page import="jj.systemszpitalny.resource.*"%>
<%@ page import="jj.systemszpitalny.service.*"%>
<%@ page import="jj.systemszpitalny.constants.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.time.LocalDate"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Panel Admin</title>
    <%@ include file="./components/common_cs_js.jsp"%>
</head>
<body>
<%@ include file="./components/navbar.jsp"%>

<%
    AppointmentResource appointmentResource = (AppointmentResource) request.getAttribute("appointmentResource");
    MedicineResource medicineResource = (MedicineResource) request.getAttribute("medicineResource");
    MedicineCompanyResource companyResource = (MedicineCompanyResource) request.getAttribute("companyResource");
    MedicineDistributorResource distributorResource = (MedicineDistributorResource) request
            .getAttribute("distributorResource");
    ReceptionistResource receptionistResource = (ReceptionistResource) request.getAttribute("receptionistResource");
    PatientResource patientResource = (PatientResource) request.getAttribute("patientResource");
    DoctorResource doctorResource = (DoctorResource) request.getAttribute("doctorResource");
    PharmacistResource pharmacistResource = (PharmacistResource) request.getAttribute("pharmacistResource");

    String view = (String) request.getAttribute("view");

    Date date = new Date();
    SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
    String todayDate = formatter.format(date);
%>

<div class="row mt-4 ml-1">

    <div class="col-sm-2">
        <div class="card card-border">
            <div class="list-group">
                <a href="admindashboard?view=<%=DatabaseConstants.AdminView.DASHBOARD.value()%>"><button type="button"
                                                                                                         class="list-group-item list-group-item-action <%if (view.equals(DatabaseConstants.AdminView.DASHBOARD.value())) {%> custom-bg <%}%>">
                    Panel nawigacyjny</button></a>
                <a href="admindashboard?view=<%=DatabaseConstants.AdminView.APPOINTMENT.value()%>"><button type="button"
                                                                                                           class="list-group-item list-group-item-action <%if (view.equals(DatabaseConstants.AdminView.APPOINTMENT.value())) {%> custom-bg <%}%>">
                    Wizyty</button></a>
                <a href="admindashboard?view=<%=DatabaseConstants.AdminView.MEDICINE.value()%>"><button type="button"
                                                                                                        class="list-group-item list-group-item-action <%if (view.equals(DatabaseConstants.AdminView.MEDICINE.value())) {%> custom-bg <%}%>">
                    Lekarstwa</button></a>
                <a href="admindashboard?view=<%=DatabaseConstants.AdminView.DOCTOR.value()%>"><button type="button"
                                                                                                      class="list-group-item list-group-item-action <%if (view.equals(DatabaseConstants.AdminView.DOCTOR.value())) {%> custom-bg <%}%>">
                    Lekarze</button></a>
                <a href="admindashboard?view=<%=DatabaseConstants.AdminView.RECEPTIONIST.value()%>"><button type="button"
                                                                                                            class="list-group-item list-group-item-action <%if (view.equals(DatabaseConstants.AdminView.RECEPTIONIST.value())) {%> custom-bg <%}%>">
                    Recepcjoniści</button></a>
                <a href="admindashboard?view=<%=DatabaseConstants.AdminView.PHARMACIST.value()%>"><button type="button"
                                                                                                          class="list-group-item list-group-item-action <%if (view.equals(DatabaseConstants.AdminView.PHARMACIST.value())) {%> custom-bg <%}%>">
                    Farmaceuci</button></a>
                <a href="admindashboard?view=<%=DatabaseConstants.AdminView.PATIENT.value()%>"><button type="button"
                                                                                                       class="list-group-item list-group-item-action <%if (view.equals(DatabaseConstants.AdminView.PATIENT.value())) {%> custom-bg <%}%>">
                    Pacjenci</button></a>
                <a href="admindashboard?view=<%=DatabaseConstants.AdminView.EARNING.value()%>"><button type="button"
                                                                                                       class="list-group-item list-group-item-action <%if (view.equals(DatabaseConstants.AdminView.EARNING.value())) {%> custom-bg <%}%>">
                    Zarobki</button></a>
            </div>
        </div>
    </div>

    <div class="col-sm-10">
        <div class="col-sm-12">
            <%
                if (view.equals(DatabaseConstants.AdminView.DASHBOARD.value())) {
            %>

            <div class="row">
                <div class="col-sm-2">
                    <div class="card card-border">
                        <div class="card-header text-color text-center">
                            <img src="resources/images/logo.png"
                                 class="rounded mx-auto pt-2 d-inline-block" alt="img"
                                 height="40px" width="40px"> <b class="ml-1">Dzisiejsze
                             Wizyty</b>
                        </div>
                        <div class="card-body text-color text-center">
                            <h3><%=appointmentResource.getAppointmentCountByDate(todayDate)%></h3>
                        </div>
                    </div>
                </div>

                <div class="col-sm-2">
                    <div class="card card-border">
                        <div class="card-header text-color text-center">
                            <img src="resources/images/logo.png"
                                 class="rounded mx-auto pt-2 d-inline-block" alt="img"
                                 height="40px" width="40px"> <b class="ml-1">Lekarstwa Dodane Dzisiaj</b>
                        </div>
                        <div class="card-body text-color text-center">
                            <h3><%=medicineResource.getMedicineCountByDateAdded(todayDate)%></h3>
                        </div>
                    </div>
                </div>

                <div class="col-sm-2">
                    <div class="card card-border">
                        <div class="card-header text-color text-center">
                            <img src="resources/images/logo.png"
                                 class="rounded mx-auto pt-2 d-inline-block" alt="img"
                                 height="40px" width="40px"> <b>Firmy Dodane Dzisiaj</b>
                        </div>
                        <div class="card-body text-color text-center">
                            <h3><%=companyResource.getCompanyCountUsingRegisteredDate(todayDate)%></h3>
                        </div>
                    </div>
                </div>

                <div class="col-sm-2">
                    <div class="card card-border">
                        <div class="card-header text-color text-center">
                            <img src="resources/images/logo.png"
                                 class="rounded mx-auto pt-2 d-inline-block" alt="img"
                                 height="40px" width="40px"> <b>Dystrybutorzy Dodani Dzisiaj</b>
                        </div>
                        <div class="card-body text-color text-center">
                            <h3><%=distributorResource.getDistributorCountUsingRegisteredDate(todayDate)%></h3>
                        </div>
                    </div>
                </div>

                <div class="col-sm-2">
                    <div class="card card-border">
                        <div class="card-header text-color text-center">
                            <img src="resources/images/logo.png"
                                 class="rounded mx-auto pt-2 d-inline-block" alt="img"
                                 height="40px" width="40px"> <b>Dzisiejsze Zarobki</b>
                        </div>
                        <div class="card-body text-color text-center">
                            <h3>
                                zł <%=appointmentResource.getTotalEarningToday()%></h3>
                        </div>
                    </div>
                </div>

                <div class="col-sm-2">
                    <div class="card card-border">
                        <div class="card-header text-color text-center">
                            <img src="resources/images/logo.png"
                                 class="rounded mx-auto pt-2 d-inline-block" alt="img"
                                 height="40px" width="40px"> <b class="ml-1">Wszystkie Wizyty</b>
                        </div>
                        <div class="card-body text-color text-center">
                            <h3><%=appointmentResource.getTotalAppointmentsCount()%></h3>
                        </div>
                    </div>
                </div>

                <div class="col-sm-2">
                    <div class="card card-border">
                        <div class="card-header text-color text-center">
                            <img src="resources/images/logo.png"
                                 class="rounded mx-auto pt-2 d-inline-block" alt="img"
                                 height="40px" width="40px"> <b class="ml-1">Wszystkie Lekarstwa</b>
                        </div>
                        <div class="card-body text-color text-center">
                            <h3><%=medicineResource.getMedicinesTotalCount()%></h3>
                        </div>
                    </div>
                </div>

                <div class="col-sm-2">
                    <div class="card card-border">
                        <div class="card-header text-color text-center">
                            <img src="resources/images/logo.png"
                                 class="rounded mx-auto pt-2 d-inline-block" alt="img"
                                 height="40px" width="40px"> <b class="ml-4">Wszyscy Lekarze</b>
                        </div>
                        <div class="card-body text-color text-center">
                            <h3><%=doctorResource.getDoctorsTotalCount()%></h3>
                        </div>
                    </div>
                </div>

                <div class="col-sm-2">
                    <div class="card card-border">
                        <div class="card-header text-color text-center">
                            <img src="resources/images/logo.png"
                                 class="rounded mx-auto pt-2 d-inline-block" alt="img"
                                 height="40px" width="40px"><b class="ml-4">Wszyscy Pacjenci</b>
                        </div>
                        <div class="card-body text-color text-center">
                            <h3><%=patientResource.getPatientsTotalCount()%></h3>
                        </div>
                    </div>

                </div>

                <div class="col-sm-2">
                    <div class="card card-border">
                        <div class="card-header text-color text-center">
                            <img src="resources/images/logo.png"
                                 class="rounded mx-auto pt-2 d-inline-block" alt="img"
                                 height="40px" width="40px"> <b>Wszyscy Farmaceuci</b>
                        </div>
                        <div class="card-body text-color text-center">
                            <h3><%=pharmacistResource.getPharmacistTotalCount()%></h3>
                        </div>
                    </div>
                </div>

                <div class="col-sm-2">
                    <div class="card card-border">
                        <div class="card-header text-color text-center">
                            <img src="resources/images/logo.png"
                                 class="rounded mx-auto pt-2 d-inline-block" alt="img"
                                 height="40px" width="40px"> <b>Wszyscy Recepcjoniści</b>
                        </div>
                        <div class="card-body text-color text-center">
                            <h3><%=receptionistResource.getReceptionistTotalCount()%></h3>
                        </div>
                    </div>

                </div>

                <div class="col-sm-2">
                    <div class="card card-border">
                        <div class="card-header text-color text-center">
                            <img src="resources/images/logo.png"
                                 class="rounded mx-auto pt-2 d-inline-block" alt="img"
                                 height="40px" width="40px"> <b>Zarobki z dzisiejszych Wizyt
                        </b>
                        </div>
                        <div class="card-body text-color text-center">
                            <h3>
                               zł <%=appointmentResource.getSumOfPriceFromAppointmentByBillingDate(todayDate)%></h3>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6">

                    <div class="card card-border" style="height: 30rem;">
                        <div class="card-header text-color text-center">Dzisiejsze Wizyty</div>
                        <div class="card-body text-color text-center">
                            <table class="table table-responsive table-hover">
                                <thead class="custom-bg">
                                <tr>
                                    <th scope="col">Id Wizyty</th>
                                    <th scope="col">Imię Pacjenta</th>
                                    <th scope="col">Imię Lekarza</th>
                                    <th scope="col">Data Wizyty</th>
                                    <th scope="col">Cena Leczenia</th>
                                    <th scope="col">Szpitalne Lekarstwa</th>
                                    <th scope="col">Status Leczenia</th>
                                </tr>
                                </thead>
                                <%
                                    List<Appointment> aps = appointmentResource.getTop5AppointmentsByDate(todayDate);
                                    for(Appointment a : aps){
                                %>

                                <tbody>
                                <tr>
                                    <th scope="row"><%=a.getId() %></th>
                                    <td><%=patientResource.getPatientById(a.getPatientid()).getFirstname()%></td>
                                    <td><%=doctorResource.getDoctorById(a.getDoctorid()).getFirstname()%></td>
                                    <td><%=a.getAppointmentdate() %></td>
                                    <td><%=a.getTreatmentprice() %></td>
                                    <td><% if(a.getWantMedicine() == null ){%>Nie<% } else{%><%=a.getWantMedicine() %> <%} %></td>
                                    <td><%=a.getTreatmentstatus() %></td>
                                </tr>

                                </tbody>
                                <%
                                    }
                                %>
                            </table>
                        </div>
                    </div>

                </div>

                <div class="col-sm-6">

                    <div class="card card-border" style="height: 30rem;">
                        <div class="card-header text-color text-center">Pacjenci Zarejestowani Dzisiaj</div>
                        <div class="card-body text-color text-center">
                            <table class="table table-responsive table-hover">
                                <thead class="custom-bg">
                                <tr>
                                    <th scope="col">Id Pacjenta</th>
                                    <th scope="col">Imię</th>
                                    <th scope="col">Nazwisko</th>
                                    <th scope="col">Wiek</th>
                                    <th scope="col">Grupa Krwi</th>
                                    <th scope="col">Miasto</th>
                                    <th scope="col">Email</th>
                                </tr>
                                </thead>
                                <%
                                    List<Patient> pats = patientResource.getTop5PatientBydate(todayDate);
                                    for(Patient p : pats){
                                %>
                                <tbody>
                                <tr>
                                    <th scope="row"><%=p.getId() %></th>
                                    <td><%=p.getFirstname() %></td>
                                    <td><%=p.getLastname() %></td>
                                    <td><%=p.getAge() %></td>
                                    <td><%=p.getBloodgroup() %></td>
                                    <td><%=p.getCity() %></td>
                                    <td><%=p.getEmailid() %></td>
                                </tr>
                                </tbody>
                                <%
                                    }
                                %>
                            </table>
                        </div>
                    </div>

                </div>

                <div class="col-sm-4">

                    <div class="card card-border" style="height: 20rem;">
                        <div class="card-header text-color text-center">
                            <b class="ml-1">Lekarstwa Dodane Dzisiaj</b>
                        </div>
                        <div class="card-body text-color text-center">
                            <table class="table table-responsive table-hover">
                                <thead class="custom-bg">
                                <tr>
                                    <th scope="col">Nazwa Lekarstwa</th>
                                    <th scope="col">Rodzaj</th>
                                    <th scope="col">Firma</th>
                                    <th scope="col">Dystrybutor</th>
                                    <th scope="col">Cena</th>
                                </tr>
                                </thead>
                                <%
                                    List<Medicine> meds = medicineResource.getTop5MedicinesByDate(todayDate);
                                    for(Medicine m : meds){
                                %>
                                <tbody>
                                <tr>
                                    <td><%=m.getName() %></td>
                                    <td><%=m.getType() %></td>
                                    <td><%=companyResource.getCompanyById(m.getCompanyid()).getName() %></td>
                                    <td><%=distributorResource.getDistributorById(m.getDistributorid()).getName() %></td>
                                    <td><%=m.getPrice() %></td>
                                </tr>
                                </tbody>
                                <%
                                    }
                                %>
                            </table>
                        </div>
                    </div>

                </div>

                <div class="col-sm-4">

                    <div class="card card-border" style="height: 20rem;">
                        <div class="card-header text-color text-center">
                            <b class="ml-1">Firmy Dodane Dzisiaj</b>
                        </div>
                        <div class="card-body text-color text-center">
                            <table class="table table-responsive table-hover">
                                <thead class="custom-bg">
                                <tr>
                                    <th scope="col">Nazwa Firmy</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Numer Telefonu</th>
                                    <th scope="col">Miasto</th>
                                </tr>
                                </thead>

                                <%
                                    List<MedicineCompany> comps = companyResource.getTop5CompanysByDateAdded(todayDate);
                                    for(MedicineCompany m : comps){
                                %>

                                <tbody>
                                <tr>
                                    <th scope="row"><%=m.getName() %></th>
                                    <td><%=m.getEmailid() %></td>
                                    <td><%=m.getMobileno() %></td>
                                    <td><%=m.getCity() %></td>
                                </tr>
                                </tbody>
                                <%
                                    }
                                %>
                            </table>
                        </div>
                    </div>

                </div>

                <div class="col-sm-4">

                    <div class="card card-border" style="height: 20rem;">
                        <div class="card-header text-color text-center">
                            <b class="ml-1">Dystrybutorzy dodani dzisiaj</b>
                        </div>
                        <div class="card-body text-color text-center">
                            <table class="table table-responsive table-hover">
                                <thead class="custom-bg">
                                <tr>
                                    <th scope="col">Nazwa Dystrybutora</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Numer Telefonu</th>
                                    <th scope="col">Miasto</th>
                                </tr>
                                </thead>
                                <%
                                    List<MedicineDistributor> dis = distributorResource.getTop5DistributorAddedByDate(todayDate);
                                    for(MedicineDistributor m : dis){
                                %>

                                <tbody>
                                <tr>
                                    <th scope="row"><%=m.getName() %></th>
                                    <td><%=m.getEmailid() %></td>
                                    <td><%=m.getMobileno() %></td>
                                    <td><%=m.getCity() %></td>
                                </tr>
                                </tbody>
                                <%
                                    }
                                %>
                            </table>
                        </div>
                    </div>

                </div>
            </div>
            <%
            }

            else if (view.equals(DatabaseConstants.AdminView.APPOINTMENT.value())) {//
            %>
            <div class="row">
                <div class="col-sm-3">
                    <div class="card card-border">
                        <div class="card-header text-color text-center">
                            <img src="resources/images/logo.png"
                                 class="rounded mx-auto pt-2 d-inline-block" alt="img"
                                 height="40px" width="40px"> <b class="ml-1">Wszystkie Dzisiejsze Wizyty</b>
                        </div>
                        <div class="card-body text-color text-center">
                            <h3><%=appointmentResource.getAppointmentCountByDate(todayDate)%></h3>
                        </div>
                    </div>
                </div>

                <div class="col-sm-3">
                    <div class="card card-border">
                        <div class="card-header text-color text-center">
                            <img src="resources/images/logo.png"
                                 class="rounded mx-auto pt-2 d-inline-block" alt="img"
                                 height="40px" width="40px"> <b>Wszystkie Wizyty</b>
                        </div>
                        <div class="card-body text-color text-center">
                            <h3><%=appointmentResource.getTotalAppointmentsCount()%></h3>
                        </div>
                    </div>
                </div>

                <div class="col-sm-3">
                    <div class="card card-border">
                        <div class="card-header text-color text-center">
                            <img src="resources/images/logo.png"
                                 class="rounded mx-auto pt-2 d-inline-block" alt="img"
                                 height="40px" width="40px"> <b>Wizyty Zarejestrowane Dzisiaj</b>
                        </div>
                        <div class="card-body text-color text-center">
                            <h3>
                                <%=appointmentResource.getAppointmentCountByAppointmentTakenDate(todayDate)%></h3>
                        </div>
                    </div>
                </div>

                <div class="col-sm-3">
                    <div class="card card-border">
                        <div class="card-header text-color text-center">
                            <img src="resources/images/logo.png"
                                 class="rounded mx-auto pt-2 d-inline-block" alt="img"
                                 height="40px" width="40px"> <b class="ml-1">Wizyty Zrealizowane Dzisiaj</b>
                        </div>
                        <div class="card-body text-color text-center">
                            <h3><%=appointmentResource.getAppointmentCountByTreatmentStatusAndBillingDate(DatabaseConstants.TreatmentStatus.DONE.value(), todayDate)%></h3>
                        </div>
                    </div>
                </div>

                <div class="text-center">
                    <h3 class="text-color">Wyszukaj Wizytę</h3>
                </div>

                <div class="mt-1">
                    <div class="row">
                        <form class="form-inline" action="searchappointmentbyId">
                            <div class="form-group">
                                <input type="number"
                                       class="form-control ml-3" id="inputPassword2"
                                       name="appointmentid" placeholder="Wprowadź numer wizyty...">
                            </div>
                            <button type="submit" class="btn text-color custom-bg ml-2">Wyszukaj</button>
                        </form>
                        <form class="form-inline mt-1"
                              action="searchappointmentbypatientName">
                            <div class="form-group">
                                <input type="text"
                                       class="form-control ml-3" id="inputPassword2"
                                       name="patientname" placeholder="Wprowadź imię pacjenta...">
                            </div>
                            <button type="submit" class="btn text-color custom-bg ml-2">Wyszukaj</button>
                        </form>
                        <form class="form-inline mt-1" action="searchappointmentbyDate">
                            <div class="form-group">
                                <input type="text"
                                       class="form-control ml-3" id="inputPassword2"
                                       name="appointmentdate" placeholder="Wprowadź datę..">
                            </div>
                            <button type="submit" class="btn text-color custom-bg ml-2">Wyszukaj</button>
                        </form>
                        <%
                            Date dat = new Date();
                            SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
                            String strDat = format.format(dat);
                        %>
                        <a href="searchappointmentbyDate?appointmentdate=<%=strDat%>"
                           class="ml-1"><button class="btn text-color custom-bg ml-2">Dzisiejsze Wizyty</button></a>
                    </div>
                </div>

                <div class="table-responsive">
                    <table class="table">
                        <thead class="custom-bg text-color">
                        <tr>
                            <th scope="col">Numer Wizyty</th>
                            <th scope="col">Imię </th>
                            <th scope="col">Wiek </th>
                            <th scope="col">Grupa Krwi </th>
                            <th scope="col">Numer Telefonu </th>
                            <th scope="col">Lekarz Prowadzący</th>
                            <th scope="col">Data Rejestracji</th>
                            <th scope="col">Data Wizyty</th>
                            <th scope="col">Godzina Wizyty</th>
                            <th scope="col">Status Leczenia</th>
                            <th scope="col">Cena Leczenia</th>

                        </tr>
                        </thead>

                        <%
                            List<Appointment> listOfAppointments = (List<Appointment>) request.getAttribute("appointments");

                            if (listOfAppointments != null) {
                                for (Appointment a : listOfAppointments) {
                                    Patient patient = patientResource.getPatientById(a.getPatientid());
                                    Doctor doctor = doctorResource.getDoctorById(a.getDoctorid());
                        %>
                        <tbody>
                        <tr class="text-center">
                            <td class="mid-align"><%=a.getId()%></td>
                            <td class="mid-align"><%=patient.getFirstname()%></td>
                            <td class="mid-align"><%=patient.getAge()%></td>
                            <td class="mid-align"><%=patient.getBloodgroup()%></td>
                            <td class="mid-align"><%=patient.getMobileno()%></td>
                            <td class="mid-align"><%=doctor.getFirstname() + " "%>(<%=doctor.getSpecialist()%>)</td>
                            <td class="mid-align"><%=a.getAppointmenttakendate() + " "%><%=a.getAppointmenttakentime()%></td>
                            <td class="mid-align"><%=a.getAppointmentdate()%></td>
                            <td class="mid-align"><%=a.getAppointmenttime()%></td>
                            <td
                                    class="mid-align <%if (DatabaseConstants.TreatmentStatus.DONE.value().equals(a.getTreatmentstatus())) {%>text-success <%} else if (DatabaseConstants.TreatmentStatus.PENDING.value().equals(a.getTreatmentstatus())) {%> text-danger <%}%>"><%=a.getTreatmentstatus()%></td>
                            <td class="mid-align"><%=a.getTreatmentprice()%></td>

                        </tr>
                        </tbody>
                        <%
                                }
                            }
                        %>
                    </table>
                </div>

            </div>
            <%
            }

            else if (view.equals(DatabaseConstants.AdminView.MEDICINE.value())) {
            %>
            <div class="row">
                <div class="col-sm-3">
                    <div class="card card-border">
                        <div class="card-header text-color text-center">
                            <img src="resources/images/logo.png"
                                 class="rounded mx-auto pt-2 d-inline-block" alt="img"
                                 height="40px" width="40px"> <b class="ml-1">Lekarstwa Dodane Dzisiaj</b>
                        </div>
                        <div class="card-body text-color text-center">
                            <h3><%=medicineResource.getMedicineCountByDateAdded(todayDate)%></h3>
                        </div>
                    </div>
                </div>

                <div class="col-sm-3">
                    <div class="card card-border">
                        <div class="card-header text-color text-center">
                            <img src="resources/images/logo.png"
                                 class="rounded mx-auto pt-2 d-inline-block" alt="img"
                                 height="40px" width="40px"> <b>Wszystkie Lekarstwa</b>
                        </div>
                        <div class="card-body text-color text-center">
                            <h3><%=medicineResource.getMedicinesTotalCount()%></h3>
                        </div>
                    </div>
                </div>

                <div class="col-sm-3">
                    <div class="card card-border">
                        <div class="card-header text-color text-center">
                            <img src="resources/images/logo.png"
                                 class="rounded mx-auto pt-2 d-inline-block" alt="img"
                                 height="40px" width="40px"> <b>Firmy Dodane Dzisiaj</b>
                        </div>
                        <div class="card-body text-color text-center">
                            <h3>
                                <%=companyResource.getCompanyCountUsingRegisteredDate(todayDate)%></h3>
                        </div>
                    </div>
                </div>

                <div class="col-sm-3">
                    <div class="card card-border">
                        <div class="card-header text-color text-center">
                            <img src="resources/images/logo.png"
                                 class="rounded mx-auto pt-2 d-inline-block" alt="img"
                                 height="40px" width="40px"> <b class="ml-1">Dystrybutorzy Dodani Dzisiaj</b>
                        </div>
                        <div class="card-body text-color text-center">
                            <h3><%=distributorResource.getDistributorCountUsingRegisteredDate(todayDate)%></h3>
                        </div>
                    </div>
                </div>

                <div class="text-center">
                    <h3 class="text-color">Wyszukaj Lekarstwa</h3>
                </div>

                <div class="mt-1">
                    <div class="row">
                        <form class="form-inline" action="searchmedicinebyId">
                            <div class="form-group">
                                <input type="number"
                                       class="form-control ml-3" id="inputPassword2"
                                       name="medicineId" placeholder="Wprowadź id lekarstwa...">
                            </div>
                            <button type="submit" class="btn text-color custom-bg ml-2">Wyszukaj</button>
                        </form>
                        <form class="form-inline mt-1" action="searchmedicinebyName">
                            <div class="form-group">
                                <input type="text"
                                       class="form-control ml-3" id="inputPassword2"
                                       name="medicineName" placeholder="Wprowadź nazwę lekarstwa...">
                            </div>
                            <button type="submit" class="btn text-color custom-bg ml-2">Wyszukaj</button>
                        </form>
                    </div>
                </div>

                <div class="table-responsive">
                    <table class="table">
                        <thead class="custom-bg text-color">
                        <tr>
                            <th scope="col">id Lekarstwa</th>
                            <th scope="col">Nazwa</th>
                            <th scope="col">Typ</th>
                            <th scope="col">Cena</th>
                            <th scope="col">Ilość</th>
                            <th scope="col">Firma</th>
                            <th scope="col">Dystrybutor</th>
                            <th scope="col">Data Produkcji</th>
                            <th scope="col">Data Ważności</th>
                        </tr>
                        </thead>

                        <%
                            List<Medicine> listOfMedicines = (List<Medicine>)request.getAttribute("medicines");
                            MedicineResource mResource = (MedicineResource)request.getAttribute("medicineResource");
                            MedicineCompanyResource medicineCompanyResource = (MedicineCompanyResource)request.getAttribute("companyResource");
                            MedicineDistributorResource medicineDistributorResource = (MedicineDistributorResource)request.getAttribute("distributorResource");

                            if(listOfMedicines != null) {
                                for(Medicine m : listOfMedicines) {
                                    MedicineCompany c = medicineCompanyResource.getCompanyById(m.getCompanyid());
                                    MedicineDistributor d = medicineDistributorResource.getDistributorById(m.getDistributorid());

                        %>
                        <tbody>
                        <tr class="text-center">
                            <td class="mid-align"><%=m.getId()%></td>
                            <td class="mid-align"><%=m.getName() %></td>
                            <td class="mid-align"><%=m.getType() %></td>
                            <td class="mid-align"><%=m.getPrice() %></td>
                            <td class="mid-align <% if(m.getQuantity() == 0){ %> text-danger <% } %>"><% if(m.getQuantity() == 0){ %>Out Of Stock <% } else {%><%=m.getQuantity()%><% } %></td>
                            <td class="mid-align"><%=c.getName()%></td>
                            <td class="mid-align"><%=d.getName() %></td>
                            <td class="mid-align"><%=m.getManufacturedate() %></td>
                            <td class="mid-align"><%=m.getExpirydate() %></td>
                        </tr>
                        </tbody>
                        <%
                                }
                            }
                        %>
                    </table>
                </div>

            </div>
            <%
            }
            else if (view.equals(DatabaseConstants.AdminView.DOCTOR.value())) {
            %>
            <div class="row">
                <div class="col-sm-6">
                    <div class="card card-border">
                        <div class="card-header text-color text-center">
                            <img src="resources/images/logo.png"
                                 class="rounded mx-auto pt-2 d-inline-block" alt="img"
                                 height="40px" width="40px"> <b class="ml-1">Lekarze Zarejestrowani Dzisiaj</b>
                        </div>
                        <div class="card-body text-color text-center">
                            <h3><%=doctorResource.getDoctorCountByRegisteredDate(todayDate)%></h3>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6">
                    <div class="card card-border">
                        <div class="card-header text-color text-center">
                            <img src="resources/images/logo.png"
                                 class="rounded mx-auto pt-2 d-inline-block" alt="img"
                                 height="40px" width="40px"> <b>Wszyscy Lekarze</b>
                        </div>
                        <div class="card-body text-color text-center">
                            <h3><%=doctorResource.getDoctorsTotalCount()%></h3>
                        </div>
                    </div>
                </div>

                <div class="text-center">
                    <h3 class="text-color">Wyszukaj Lekarzy </h3>
                </div>

                <div class="mt-1">
                    <div class="row">
                        <form class="form-inline" action="searchdoctorbyId">
                            <div class="form-group">
                                <input type="number"
                                       class="form-control ml-3" id="inputPassword2"
                                       name="doctorId" placeholder="Wprowadź id ...">
                            </div>
                            <button type="submit" class="btn text-color custom-bg ml-2">Wyszukaj</button>
                        </form>
                        <form class="form-inline mt-1" action="searchdoctorbyName">
                            <div class="form-group">
                                <input type="text"
                                       class="form-control ml-3" id="inputPassword2"
                                       name="doctorName" placeholder="Wprowadź imie...">
                            </div>
                            <button type="submit" class="btn text-color custom-bg ml-2">Wyszukaj</button>
                        </form>
                    </div>
                </div>

                <div class="table-responsive">
                    <table class="table">
                        <thead class="custom-bg text-color">
                        <tr>
                            <th scope="col">id Lekarza</th>
                            <th scope="col">Imię </th>
                            <th scope="col">Specjalizacja</th>
                            <th scope="col">Wiek</th>
                            <th scope="col">Numer Telefonu</th>
                            <th scope="col">Email</th>
                            <th scope="col">Nazwa Użytkownika</th>
                            <th scope="col">Miasto</th>
                        </tr>
                        </thead>

                        <%
                            List<Doctor> listOfDoctors = (List<Doctor>)request.getAttribute("doctors");

                            if(listOfDoctors != null) {
                                for(Doctor d : listOfDoctors) {

                        %>
                        <tbody>
                        <tr class="text-center">
                            <td class="mid-align"><%=d.getId()%></td>
                            <td class="mid-align"><%=d.getFirstname() %></td>
                            <td class="mid-align"><%=d.getSpecialist()%></td>
                            <td class="mid-align"><%=d.getAge() %></td>
                            <td class="mid-align"><%=d.getMobileno()%></td>
                            <td class="mid-align"><%=d.getEmailid() %></td>
                            <td class="mid-align"><%=d.getUsername() %></td>
                            <td class="mid-align"><%=d.getCity() %></td>
                        </tr>
                        </tbody>
                        <%
                                }
                            }
                        %>
                    </table>
                </div>

            </div>
            <%
            }
            else if (view.equals(DatabaseConstants.AdminView.RECEPTIONIST.value())) {
            %>
            <div class="row">
                <div class="col-sm-6">
                    <div class="card card-border">
                        <div class="card-header text-color text-center">
                            <img src="resources/images/logo.png"
                                 class="rounded mx-auto pt-2 d-inline-block" alt="img"
                                 height="40px" width="40px"> <b class="ml-1">Recepcjoniści Zarejestrowani Dzisiaj</b>
                        </div>
                        <div class="card-body text-color text-center">
                            <h3><%=receptionistResource.getReceptionistCountByRegisterDate(todayDate)%></h3>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6">
                    <div class="card card-border">
                        <div class="card-header text-color text-center">
                            <img src="resources/images/logo.png"
                                 class="rounded mx-auto pt-2 d-inline-block" alt="img"
                                 height="40px" width="40px"> <b>Wszyscy Recepcjoniści</b>
                        </div>
                        <div class="card-body text-color text-center">
                            <h3><%=receptionistResource.getReceptionistTotalCount()%></h3>
                        </div>
                    </div>
                </div>

                <div class="text-center">
                    <h3 class="text-color">Wyszukaj Recepcjonistę</h3>
                </div>

                <div class="mt-1">
                    <div class="row">
                        <form class="form-inline" action="searchreceptionistbyId">
                            <div class="form-group">
                                <input type="number"
                                       class="form-control ml-3" id="inputPassword2"
                                       name="receptionistId" placeholder="Wprowadź id...">
                            </div>
                            <button type="submit" class="btn text-color custom-bg ml-2">Wyszukaj</button>
                        </form>
                        <form class="form-inline mt-1" action="searchreceptionistbyName">
                            <div class="form-group">
                                <input type="text"
                                       class="form-control ml-3" id="inputPassword2"
                                       name="receptionistName" placeholder="Wprowadź imię...">
                            </div>
                            <button type="submit" class="btn text-color custom-bg ml-2">Wyszukaj</button>
                        </form>
                    </div>
                </div>

                <div class="table-responsive">
                    <table class="table">
                        <thead class="custom-bg text-color">
                        <tr>
                            <th scope="col">id Recepcjonisty</th>
                            <th scope="col">Imię </th>
                            <th scope="col">Email</th>
                            <th scope="col">Numer Telefonu</th>
                            <th scope="col">Wiek</th>
                            <th scope="col">Nazwa Użytkownika</th>
                            <th scope="col">Miasto</th>
                        </tr>
                        </thead>

                        <%
                            List<Receptionist> listOfReceptionists = (List<Receptionist>)request.getAttribute("receptionists");

                            if(listOfReceptionists != null) {
                                for(Receptionist r : listOfReceptionists) {

                        %>
                        <tbody>
                        <tr class="text-center">
                            <td class="mid-align"><%=r.getId()%></td>
                            <td class="mid-align"><%=r.getFirstname() %></td>
                            <td class="mid-align"><%=r.getEmailid()%></td>
                            <td class="mid-align"><%=r.getMobileno()%></td>
                            <td class="mid-align"><%=r.getAge()%></td>
                            <td class="mid-align"><%=r.getUsername() %></td>
                            <td class="mid-align"><%=r.getCity() %></td>
                        </tr>
                        </tbody>
                        <%
                                }
                            }
                        %>
                    </table>
                </div>

            </div>
            <%
            }
            else if (view.equals(DatabaseConstants.AdminView.PHARMACIST.value())) {
            %>
            <div class="row">
                <div class="col-sm-6">
                    <div class="card card-border">
                        <div class="card-header text-color text-center">
                            <img src="resources/images/logo.png"
                                 class="rounded mx-auto pt-2 d-inline-block" alt="img"
                                 height="40px" width="40px"> <b class="ml-1">Farmaceuci Zarejestrowani Dzisiaj</b>
                        </div>
                        <div class="card-body text-color text-center">
                            <h3><%=pharmacistResource.getPharmacistCountByRegisteredDate(todayDate)%></h3>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6">
                    <div class="card card-border">
                        <div class="card-header text-color text-center">
                            <img src="resources/images/logo.png"
                                 class="rounded mx-auto pt-2 d-inline-block" alt="img"
                                 height="40px" width="40px"> <b>Wszyscy Farmaceuci</b>
                        </div>
                        <div class="card-body text-color text-center">
                            <h3><%=pharmacistResource.getPharmacistTotalCount()%></h3>
                        </div>
                    </div>
                </div>

                <div class="text-center">
                    <h3 class="text-color">Wyszukaj Farmaceute </h3>
                </div>

                <div class="mt-1">
                    <div class="row">
                        <form class="form-inline" action="searchpharmacistbyId">
                            <div class="form-group">
                                <input type="number"
                                       class="form-control ml-3" id="inputPassword2"
                                       name="pharmacistId" placeholder="Wprowadź id...">
                            </div>
                            <button type="submit" class="btn text-color custom-bg ml-2">Wyszukaj</button>
                        </form>
                        <form class="form-inline mt-1" action="searchpharmacistbyName">
                            <div class="form-group">
                                <input type="text"
                                       class="form-control ml-3" id="inputPassword2"
                                       name="pharmacistName" placeholder="Wprowadź imię...">
                            </div>
                            <button type="submit" class="btn text-color custom-bg ml-2">Wyszukaj</button>
                        </form>
                    </div>
                </div>

                <div class="table-responsive">
                    <table class="table">
                        <thead class="custom-bg text-color">
                        <tr>
                            <th scope="col">id Farmaceuty</th>
                            <th scope="col">Imię </th>
                            <th scope="col">Email</th>
                            <th scope="col">Numer Telefonu</th>
                            <th scope="col">Wiek</th>
                            <th scope="col">Nazwa Użytkownika</th>
                            <th scope="col">Miasto</th>
                        </tr>
                        </thead>

                        <%
                            List<Pharmacist> listOfPharmacists = (List<Pharmacist>)request.getAttribute("pharmacists");

                            if(listOfPharmacists != null) {
                                for(Pharmacist r : listOfPharmacists) {

                        %>
                        <tbody>
                        <tr class="text-center">
                            <td class="mid-align"><%=r.getId()%></td>
                            <td class="mid-align"><%=r.getFirstname() %></td>
                            <td class="mid-align"><%=r.getEmailid()%></td>
                            <td class="mid-align"><%=r.getMobileno()%></td>
                            <td class="mid-align"><%=r.getAge()%></td>
                            <td class="mid-align"><%=r.getUsername() %></td>
                            <td class="mid-align"><%=r.getCity() %></td>
                        </tr>
                        </tbody>
                        <%
                                }
                            }
                        %>
                    </table>
                </div>

            </div>
            <%
            }
            else if (view.equals(DatabaseConstants.AdminView.PATIENT.value())) {
            %>
            <div class="row">
                <div class="col-sm-6">
                    <div class="card card-border">
                        <div class="card-header text-color text-center">
                            <img src="resources/images/logo.png"
                                 class="rounded mx-auto pt-2 d-inline-block" alt="img"
                                 height="40px" width="40px"> <b class="ml-1">Pacjenci Zarejestrowani Dzisiaj</b>
                        </div>
                        <div class="card-body text-color text-center">
                            <h3><%=patientResource.getPatientsByRegisteredDate(todayDate)%></h3>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6">
                    <div class="card card-border">
                        <div class="card-header text-color text-center">
                            <img src="resources/images/logo.png"
                                 class="rounded mx-auto pt-2 d-inline-block" alt="img"
                                 height="40px" width="40px"> <b>Wszyscy Pacjenci</b>
                        </div>
                        <div class="card-body text-color text-center">
                            <h3><%=patientResource.getPatientsTotalCount()%></h3>
                        </div>
                    </div>
                </div>



                <div class="text-center">
                    <h3 class="text-color">Wyszukaj Pacjenta</h3>
                </div>

                <div class="mt-1">
                    <div class="row">
                        <form class="form-inline" action="searchpatientbyId">
                            <div class="form-group">
                                <input type="number"
                                       class="form-control ml-3" id="inputPassword2"
                                       name="patientId" placeholder="Wprowadź id...">
                            </div>
                            <button type="submit" class="btn text-color custom-bg ml-2">Wyszukaj</button>
                        </form>
                        <form class="form-inline mt-1" action="searchpatientbyName">
                            <div class="form-group">
                                <input type="text"
                                       class="form-control ml-3" id="inputPassword2"
                                       name="patientName" placeholder="Wprowadź imię...">
                            </div>
                            <button type="submit" class="btn text-color custom-bg ml-2">Wyszukaj</button>
                        </form>
                    </div>
                </div>

                <div class="table-responsive">
                    <table class="table">
                        <thead class="custom-bg text-color">
                        <tr>
                            <th scope="col">id Pacjenta</th>
                            <th scope="col">Imię </th>
                            <th scope="col">Email</th>
                            <th scope="col">Numer Telefonu</th>
                            <th scope="col">Wiek</th>
                            <th scope="col">Grupa Krwi</th>
                            <th scope="col">Miasto</th>
                        </tr>
                        </thead>

                        <%
                            List<Patient> listOfPatients = (List<Patient>)request.getAttribute("patients");

                            if(listOfPatients != null) {
                                for(Patient r : listOfPatients) {

                        %>
                        <tbody>
                        <tr class="text-center">
                            <td class="mid-align"><%=r.getId()%></td>
                            <td class="mid-align"><%=r.getFirstname() %></td>
                            <td class="mid-align"><%=r.getEmailid()%></td>
                            <td class="mid-align"><%=r.getMobileno()%></td>
                            <td class="mid-align"><%=r.getAge()%></td>
                            <td class="mid-align"><%=r.getBloodgroup() %></td>
                            <td class="mid-align"><%=r.getCity() %></td>
                        </tr>
                        </tbody>
                        <%
                                }
                            }
                        %>
                    </table>
                </div>

            </div>
            <%
            }
            else if (view.equals(DatabaseConstants.AdminView.EARNING.value())) {
            %>
            <div class="row">
                <div class="col-sm-3">
                    <div class="card card-border">
                        <div class="card-header text-color text-center">
                            <img src="resources/images/logo.png"
                                 class="rounded mx-auto pt-2 d-inline-block" alt="img"
                                 height="40px" width="40px"> <b class="ml-1">Dzisiejsze   Zarobki</b>
                        </div>
                        <div class="card-body text-color text-center">
                            <h3>zł <%=appointmentResource.getTotalEarningToday()%></h3>
                        </div>
                    </div>
                </div>

                <div class="col-sm-3">
                    <div class="card card-border">
                        <div class="card-header text-color text-center">
                            <img src="resources/images/logo.png"
                                 class="rounded mx-auto pt-2 d-inline-block" alt="img"
                                 height="40px" width="40px"> <b>Dzisiejsze Zarobki z Lekarstw</b>
                        </div>
                        <div class="card-body text-color text-center">
                            <h3>zł <%=medicineResource.getMedicinesTodayEarning()%></h3>
                        </div>
                    </div>
                </div>

                <div class="col-sm-3">
                    <div class="card card-border">
                        <div class="card-header text-color text-center">
                            <img src="resources/images/logo.png"
                                 class="rounded mx-auto pt-2 d-inline-block" alt="img"
                                 height="40px" width="40px"> <b>Dzisiejsze Zarobki z Leczenia</b>
                        </div>
                        <div class="card-body text-color text-center">
                            <h3>
                                zł <%=appointmentResource.getTotalTodaysAppointmentTreatmentPrice()%></h3>
                        </div>
                    </div>
                </div>

                <div class="col-sm-3">
                    <div class="card card-border">
                        <div class="card-header text-color text-center">
                            <img src="resources/images/logo.png"
                                 class="rounded mx-auto pt-2 d-inline-block" alt="img"
                                 height="40px" width="40px"> <b class="ml-1">Wszystkie Zarobki z Leczenia</b>
                        </div>
                        <div class="card-body text-color text-center">
                            <h3>zł <%=appointmentResource.getTotalAppointmentTreatmentPrice()%></h3>
                        </div>
                    </div>
                </div>
            </div>
            <%
                }
            %>


        </div>
    </div>
</div>

</body>
</html>