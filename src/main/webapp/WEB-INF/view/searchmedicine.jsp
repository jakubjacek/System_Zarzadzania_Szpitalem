<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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
    <title>Wyszukaj Lekarstwo</title>
    <%@ include file="./components/common_cs_js.jsp"%>
</head>
<body>
<%@ include file="./components/navbar.jsp"%>
<div class="container-fluid">
    <div class="row mt-4">
        <form class="form-inline ml-5" action="searchmedicinebyid">
            <div class="form-group">
                <label for="inputPassword2" class="text-color"><h4>Po id: </h4></label>
                <input type="number" class="form-control ml-3" id="inputPassword2" name="medicineId" placeholder="Wprowadź id lekarstwa...">
            </div>
            <button type="submit" class="btn text-color custom-bg ml-2">Wyszukaj</button>
        </form>
        <form class="form-inline mt-1" action="searchmedicinebyname">
            <div class="form-group">
                <label for="inputPassword2" class="text-color ml-5"><h4>Po nazwie: </h4></label>
                <input type="text" class="form-control ml-3" id="inputPassword2" name="medicineName" placeholder="Wprowadź nazwę lekarstwa">
            </div>
            <button type="submit" class="btn text-color custom-bg ml-2">Wyszukaj</button>
        </form>
        <a href="totalMedicines" class="ml-2"><button class="btn text-color custom-bg ml-2">Wszystkie lekarstwa</button></a>
        <a href="expiredMedicines" class="ml-2"><button class="btn text-color custom-bg ml-2">Przeterminowane</button></a>
    </div>
    <div class="table-responsive">
        <table class="table">
            <thead class="custom-bg text-color">
            <tr>
                <th scope="col">Id Lekarstwa</th>
                <th scope="col">Nazwa</th>
                <th scope="col">Typ</th>
                <th scope="col">Cena</th>
                <th scope="col">Ilość</th>
                <th scope="col">Firma</th>
                <th scope="col">Dystrybutor</th>
                <th scope="col">Data Produkcji</th>
                <th scope="col">Data Ważności</th>
                <th scope="col">Więcej informacji</th>
            </tr>
            </thead>

            <%
                List<Medicine> listOfMedicines = (List<Medicine>)request.getAttribute("medicines");
                MedicineResource medicineResource = (MedicineResource)request.getAttribute("medicineResource");
                MedicineCompanyResource medicineCompanyResource = (MedicineCompanyResource)request.getAttribute("medicineCompanyResource");
                MedicineDistributorResource medicineDistributorResource = (MedicineDistributorResource)request.getAttribute("medicineDistributorResource");

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
                <td class="mid-align"><a href="updateMedicine?medicineId=<%=m.getId()%>"><button type="button"
                                                                                                 class="btn custom-bg text-color">Aktualizuj</button></a>
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