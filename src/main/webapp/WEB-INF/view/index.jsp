<%@ page language="java" contentType="text/html; UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Strona Główna</title>
    <%@ include file="./components/common_cs_js.jsp"%>
</head>
<body>
<%@ include file="./components/navbar.jsp"%>
<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img class="d-block w-100" src="resources/images/panel1.png" alt="First slide">
        </div>
        <div class="carousel-item">
            <img class="d-block w-100" src="resources/images/panel2.png" alt="Second slide">
        </div>
        <div class="carousel-item">
            <img class="d-block w-100" src="resources/images/panel3.png" alt="Third slide">
        </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Poprzednie</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Nastepne</span>
    </a>
</div>
<%@ include file="./components/message.jsp"%>
<div class="text-center">
    <h2 class="text-color">ODDAJ SWOJE ZDROWIE W RĘCE PRAWDZIWYCH SPECJALISTÓW</h2>
</div>
<div class="card-group md-5">
    <div class="card custom-bg ml-5 mr-3 mb-5">
        <img class="card-img-top" src="resources/images/lekarze.png" alt="Card image cap">
        <div class="card-body">
            <h2 class="card-title text-center text-color">Nasi Lekarze</h2>
            <p class="card-title text-center text-color" class="card-text">Nasi Lekarze są prawdziwymi specjalistami z wieloletnim stażem</p>
        </div>
    </div>
    <div class="card custom-bg ml-3 mr-3 mb-5">
        <img class="card-img-top mt-4" src="resources/images/pielegniarki.png" alt="Card image cap">
        <div class="card-body">
            <h2 class="card-title text-center text-color mt-3">Nasze Pielęgniarki</h2>
            <p class="card-title text-center text-color" class="card-text">Nasze Pielęgniarki otoczą Cię najlepszą opieką zdrowotną</p>
        </div>
    </div>
    <div class="card custom-bg ml-3 mr-5 mb-5">
        <img class="card-img-top" src="resources/images/lekarstwa.png" alt="Card image cap">
        <div class="card-body">
            <h2 class="card-title text-center text-color">Nasze Lekarstwa</h2>
            <p class="card-title text-center text-color" class="card-text">Używamy tylko certyfikowanych i przetestowanych lekarstw</p>
        </div>
    </div>
</div>
</body>
</html>