<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/sidebar.css">
</head>
<body>
    
    <aside class="sidebar">
        <ul class="sidebar-menu">
            <li id="dashboard">
                <a href="nurseDashboard.jsp">Dashboard</a>
            </li>
            <li id="view-patient details">
                <a href="wardManagement.jsp"> <img src="img/wardma.png" alt="View Patients Icon" class="sidebar-icon">Ward Management</a>
            </li>
            <li id="add-sessions">
                <a href="#"><img src="img/medreport.png" alt="Add Sessions Icon" class="sidebar-icon">Report Management</a>
            </li>
            <li id="my-appointments">
                <a href="#"><img src="img/shift.png" alt="Manage Sessions Icon" class="sidebar-icon">Scheduling & Shift Management</a>
            </li>
            <li id="health-records">
                <a href="#"> <img src="img/careplan.png" alt="Medicine Inventory Icon" class="sidebar-icon">Care Plan Management</a>
            </li>
        </ul>
    </aside>

</body>
</html>