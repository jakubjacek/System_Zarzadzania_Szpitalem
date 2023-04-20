<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Strona Logowania</title>
    <%@ include file="./components/common_cs_js.jsp"%>
</head>
<body>
<%@ include file="./components/navbar.jsp"%>
<div id="carouselExampleControls" class="carousel slide"
     data-ride="carousel">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img class="d-block w-100" src="resources/images/panel1.png"
                 alt="First slide">
        </div>
        <div class="carousel-item">
            <img class="d-block w-100" src="resources/images/panel2.png"
                 alt="Second slide">
        </div>
        <div class="carousel-item">
            <img class="d-block w-100" src="resources/images/panel3.png"
                 alt="Third slide">
        </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleControls"
       role="button" data-slide="prev"> <span
            class="carousel-control-prev-icon" aria-hidden="true"></span> <span
            class="sr-only">Previous</span>
    </a> <a class="carousel-control-next" href="#carouselExampleControls"
            role="button" data-slide="next"> <span
        class="carousel-control-next-icon" aria-hidden="true"></span> <span
        class="sr-only">Next</span>
</a>
</div>

<div class="text-center">
    <h2 class="text-color">ODDAJ SWOJE ZDROWIE W RĘCE PRAWDZIWYCH SPECJALISTÓW</h2>
</div>

<div class="row">
    <div class="col-sm-3">
        <div class="card custom-bg ml-5 mr-3 mb-5">
            <img class="card-img-top img-responsive rounded mx-auto d-block" style="height: 17rem; max-width:90%; max-height:90%" src="resources/images/zdjadmin.png" alt="img" >
            <div class="card-body">
                <a href="/adminlogin" class="card-title non-underline-link text-color non-underline-link"><h2 class="card-title text-center text-color">Administrator</h2></a>
                <p class="card-title text-center text-color" class="card-text">Administrator monitoruje wszystkich użytkowników</p>
            </div>
        </div>
    </div>
    <div class="col-sm-3">
        <div class="card custom-bg ml-5 mr-3 mb-5">
            <img class="card-img-top img-responsive rounded mx-auto d-block" style="height: 18.5rem; max-width:90%; max-height:100%" src="resources/images/doktor.png" alt="img" >
            <div class="card-body">
                <a href="/doctorlogin" class="card-title non-underline-link text-color non-underline-link"><h2 class="card-title text-center text-color">Lekarz</h2></a>
                <p class="card-title text-center text-color" class="card-text">Lekarz leczy Pacjentów</p>
            </div>
        </div>
    </div>
    <div class="col-sm-3">
        <div class="card custom-bg ml-5 mr-3 mb-5">
            <img class="card-img-top img-responsive rounded mx-auto d-block" style="height: 18.5rem; max-width:90%; max-height:100%" src="resources/images/farmaceuta.png" alt="img" >
            <div class="card-body">
                <a href="/pharmacistlogin" class="card-title non-underline-link text-color non-underline-link"><h2 class="card-title text-center text-color">Farmaceuta</h2></a>
                <p class="card-title text-center text-color" class="card-text">Farmaceuta zarządza lekarstwami</p>
            </div>
        </div>
    </div>
    <div class="col-sm-3">
        <div class="card custom-bg ml-5 mr-3 mb-5">
            <img class="card-img-top rounded mx-auto d-block" style="height: 17rem; max-width:90%; max-height:100%" src="resources/images/recepcjonista.png" alt="img" >
            <div class="card-body">
                <a href="/receptionistlogin" class="card-title non-underline-link text-color non-underline-link"><h2 class="card-title text-center text-color">Recepcjonista</h2></a>
                <p class="card-title text-center text-color" class="card-text">Receptionista rejestruje i wystawia rachunki pacjentom</p>
            </div>
        </div>
    </div>
</div>
</body>
</html>