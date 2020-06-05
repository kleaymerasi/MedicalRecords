<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Supervision</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/07ac43e54b.js" crossorigin="anonymous"></script>
</head>
<body style="background-color:#FAFAFA ;">

<nav class="navbar navbar-expand-md navbar-light bg-light">
    <a  class="navbar-brand">KLEA Hospital</a>
    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarCollapse">
        <div class="navbar-nav">
            <a href="${pageContext.request.contextPath}/" class="nav-item nav-link" > <i class="fas fa-home"></i> Home</a>
            <a href="Patient" class="nav-item nav-link"><i class="fas fa-hospital-user"> </i> Patient</a>
            <a href="Doctor" class="nav-item nav-link"><i class="fas fa-user-md"> </i> Doctor</a>
            <a href="Supervision" class="nav-item nav-link"><i class="fas fa-user-md"> </i> Supervision</a>

        </div>
        <div class="navbar-nav ml-auto">
            <a href="https://goo.gl/maps/VcfEPiai4eR5Up3k6" class="nav-item nav-link"><strong>Contact</strong></a>
        </div>
    </div>
</nav>

<div class="container">
    <h2>Supervision List</h2>

    <table class="table table-bordered">
        <thead>
        <tr>
            <th>No</th>
            <th>Note</th>
            <th>Start Date</th>
            <th>End Date</th>
            <th>Patient Id</th>
            <th>Doctor Id</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="supervision" items="${listSupervision}" varStatus="status">
            <tr>
                <td>${status.index + 1}</td>
                <td>${supervision.note}</td>
                <td>${supervision.startDate}</td>
                <td>${supervision.endDate}</td>
                <td>${supervision.patientId}</td>
                <td>${supervision.doctorId}</td>
                <td>
                    <a href="editSupervision?id=${supervision.id}">Edit</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="deleteSupervision?id=${supervision.id}">Delete</a>
                </td>
            </tr>

        </c:forEach>

        </tbody>
    </table>
</div>

</body>
</html>
