<nav class="navbar navbar-expand-lg navbar-light custom-bg">
    <a class="navbar-brand" href="/home">
        <img src="resources/images/logo.png" width="45" height="45" class="d-inline-block align-top" alt="">
        <i><b><span class="text-color">System Zarzadzania Szpitalem</span></b></i>
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <% String userlogin =(String) session.getAttribute("user-login"); %>

    <%
        if(userlogin == null) {
    %>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item active   ml-5" data-toggle="modal" data-target=".aboutusmodal">
                <a class="nav-link"><b><span class="text-color">O nas</span></b><span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item active  ml-5" data-toggle="modal" data-target=".contactusmodal">
                <a class="nav-link text-color"><b><span class="text-color">Kontakt z Deweloperem</span></b></a>
            </li>
            <li class="nav-item active  ml-5">
                <a class="nav-link text-color" href="login"><b><span class="text-color">Zaloguj</span></b></a>
            </li>
        </ul>
    </div>

    <%
    }

    else if(userlogin != null) {
    %>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">

            <%
                if(userlogin.equals("admin")) {
            %>
            <li class="nav-item active  ml-5">
                <a class="nav-link" href="admindashboard?view=dashboard"><b><span class="text-color">Panel nawigacyjny </span></b><span class="sr-only">(current)</span></a>
            </li>
            <%
                }
            %>

            <%
                if(userlogin.equals("doctor")) {
            %>
            <li class="nav-item active  ml-5">
                <a class="nav-link" href="mypatient"><b><span class="text-color">Moi Pacjenci</span></b><span class="sr-only">(current)</span></a>
            </li>
            <%
                }
            %>

            <%
                if(userlogin.equals("receptionist")) {
            %>
            <li class="nav-item active  ml-5">
                <a class="nav-link" href="searchappointment"><b><span class="text-color">Wyszukaj Wizyte</span></b><span class="sr-only">(current)</span></a>
            </li>

            <li class="nav-item active  ml-5">
                <a class="nav-link" href="appointment"><b><span class="text-color">Dodaj Wizyte</span></b><span class="sr-only">(current)</span></a>
            </li>
            <%
                }
            %>

            <%
                if(userlogin.equals("pharmacist")) {
            %>
            <li class="nav-item active  ml-5">
                <a class="nav-link" href="addmedicine"><b><span class="text-color">Dodaj Lekarstwo</span></b><span class="sr-only">(current)</span></a>
            </li>

            <li class="nav-item active  ml-5">
                <a class="nav-link" href="addmedicinecompany"><b><span class="text-color">Dodaj Firme</span></b><span class="sr-only">(current)</span></a>
            </li>

            <li class="nav-item active  ml-5">
                <a class="nav-link" href="addmedicinedistributor"><b><span class="text-color">Dodaj Dystrybutora</span></b><span class="sr-only">(current)</span></a>
            </li>
            <%
                }
            %>


            <li class="nav-item active  ml-5" data-toggle="modal" data-target=".aboutusmodal">
                <a class="nav-link"><b><span class="text-color">O nas</span></b><span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item active  ml-5" data-toggle="modal" data-target=".contactusmodal">
                <a class="nav-link text-color"><b><span class="text-color">Kontakt z deweloperem</span></b></a>
            </li>
        </ul>
    </div>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto">
            <%
                if(userlogin.equals("admin")) {
            %>
            <li class="nav-item active  ml-5">
                <a class="nav-link" href="register"><b><span class="text-color">Zarejestruj Uzytkownika</span></b><span class="sr-only">(current)</span></a>
            </li>
            <%
                }
            %>
            <%
                if(userlogin.equals("receptionist")) {
            %>
            <li class="nav-item active  ml-5">
                <a class="nav-link" href="patientregister"><b><span class="text-color">Zarejestruj Pacjenta</span></b><span class="sr-only">(current)</span></a>
            </li>
            <%
                }
            %>

            <%
                if(userlogin.equals("pharmacist")) {
            %>
            <li class="nav-item active  ml-5">
                <a class="nav-link" href="searchmedicine"><b><span class="text-color">Wyszukaj Lekarstwo</span></b><span class="sr-only">(current)</span></a>
            </li>
            <%
                }
            %>
            <li class="nav-item active  ml-5">
                <a class="nav-link" href="logout"><b><span class="text-color">Wyloguj</span></b><span class="sr-only">(current)</span></a>
            </li>

        </ul>
    </div>
    <%
        }
    %>


</nav>

<!-- About us -->

<div class="modal fade aboutusmodal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header custom-bg text-white text-center">
                <h5 class="modal-title" id="exampleModalLongTitle" >O nas</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container">
                    <p style="font-size:22px;">
                        <b>
                            System Zarzadzania Szpitalem zostal wprowadzony aby rozwiazac problemy
                            z przechowywaniem wszystkich informacji w formie papierowej
                            oraz usprawnic funkcjonowanie szpitala.
                            Zapewnia on mozliwosc zarzadzania wszystkimi formalnosciami w jednym miejscu.

                        </b>
                    </p>
                </div>
            </div>
            <div class="modal-footer">
                <div class="text-center">
                    <button type="button" class="btn custom-bg text-white" data-dismiss="modal">Zamknij</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- ********** -->

<!-- Developer Contact -->

<div class="modal fade contactusmodal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header custom-bg text-white text-center">
                <h5 class="modal-title" id="example ModalLongTitle" >Kontakt</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container text-center">
                    <p style="font-size:23px;">
                        <b>
                            <img src="resources/images/telefon.png" style="width:32px;" alt="img"> +48 795 875 026<br>
                            <img src="resources/images/email.png" style="width:32px;" alt="img">  27jakubjacek@gmail.com<br>
                        </b>
                    </p>
                </div>
            </div>
            <div class="modal-footer">
                <div class="text-center">
                    <button type="button" class="btn custom-bg text-white" data-dismiss="modal">Zamknij</button>
                </div>
            </div>
        </div>
    </div>
</div>
