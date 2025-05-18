<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/Header.css">
</head>
<body>

    <header class="header d-flex justify-content-between align-items-center">
        <div>
            <img src="img/hms.png" alt="logo" class="logo-img">
            <!-- <h6><b>OASIS</b></h6> -->
        </div>
        <h3>HOSPITAL MANAGEMENT SYSTEM</h3>
        <div class="proimage d-flex align-items-center">
            <img src="img/user.png" alt="profilepic">                  
            <span>${username}</span>    
            <button class="btn btn-primary" onclick="confirmLogout()">Logout</button>
        </div>
    </header>
<script src = "Logout.js"></script>   
</body>
</html>