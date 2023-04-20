<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Farmaceuta Logowanie</title>
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
                    <h3 class="text-center my-3">Farmaceuta Logowanie</h3>
                    <form action="pharmacistlogin" method="post">
                        <div class="form-group">
                            <label for="email">Nazwa Użytkownika</label>
                            <input type="text" class="form-control" id="username" aria-describedby="emailHelp" name="username" placeholder="Wprowadź login..." required>
                        </div>

                        <div class="form-group">
                            <label for="password">Hasło</label>
                            <input type="password" class="form-control" id="password" aria-describedby="emailHelp" name="password" placeholder="Wprowadź hasło.." required>
                        </div>

                        <div class="container text-center">
                            <button class="btn custom-bg text-color"><b>Zaloguj</b></button>
                        </div>

                    </form>
                </div>
            </div>


        </div>
    </div>
</div>
</body>
</html>