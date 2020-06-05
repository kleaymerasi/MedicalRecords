<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Patient</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
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
    <h2>Patient List</h2>

    <table class="table table-bordered">
        <thead>
        <tr>
            <th>No</th>
            <th>Last Name</th>
            <th>First Name</th>
            <th>Address</th>
            <th>City</th>
            <th>Action</th>
            <th>Doctor</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="patient" items="${listPatient}" varStatus="status">

            <tr>
                <td>${status.index + 1}</td>
                <td>${patient.lastName}</td>
                <td>${patient.name}</td>
                <td>${patient.address}</td>
                <td>${patient.city}</td>
                <td>
                    <a href="editPatient?id=${patient.id}">Edit</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="deletePatient?id=${patient.id}">Delete</a>
                </td>
                <td>
                    <a href="assignDoctor?id=${patient.id}"> Assign Doctor </a>
                </td>


            </tr>

        </c:forEach>

        </tbody>
    </table>
</div>

</body>
</html>