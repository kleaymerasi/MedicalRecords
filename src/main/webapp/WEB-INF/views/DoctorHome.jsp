<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
    <script src="https://kit.fontawesome.com/07ac43e54b.js" crossorigin="anonymous"></script>
<title>Doctor</title>
</head>
<body style="background-color:#FAFAFA ;">


<nav class="navbar navbar-light" style="background-color:  #cce6ff;">
    <a class="navbar-brand">KLEA Hospital</a>
    <a href="${pageContext.request.contextPath}/" class="nav-item nav-link"> Home</a>
    <a href="Patient" class="nav-item nav-link"> Patient</a>
    <a href="Doctor" class="nav-item nav-link"> <strong> Doctor</strong> </a>
    <a href="Supervision" class="nav-item nav-link">Supervision</a>
    <div class="navbar-nav ml-auto">
        <a href="https://goo.gl/maps/VcfEPiai4eR5Up3k6" class="nav-item nav-link"><strong>Contact</strong></a>
    </div>

</nav>

<div class="container">
   <br> <h2 style="color: slategrey">Doctor List</h2> <br>

    <table id="table1"  class="table table-bordered" style="width:100%">

        <thead>
        <tr>
            <th style="color: slategrey">No</th>
            <th style="color: slategrey">First Name</th>
            <th style="color: slategrey">Last Name </th>
            <th style="color: slategrey">Address</th>
            <th style="color: slategrey">City</th>
            <th style="color: slategrey">Speciality</th>
            <th style="color: slategrey">Age</th>
            <th style="color: slategrey">Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="doctor" items="${listDoctor}" varStatus="status">
            <tr>
                <td>${status.index + 1}</td>
                <td>${doctor.firstName}</td>
                <td>${doctor.lastName}</td>
                <td>${doctor.address}</td>
                <td>${doctor.city}</td>
                <td>${doctor.speciality}</td>
                <td>${doctor.age}</td>
                <td>

                    <button type="button" class="btn btn-default btn-sm">
                        <a href="editDoctor?id=${doctor.id}">
                            <i class="fas fa-edit"></i>
                        </a>
                    </button>

                    &nbsp;<button type="button" class="btn btn-default btn-sm">
                    <a href="deleteDoctor?id=${doctor.id}">
                        <i class="fas fa-trash-alt"></i>
                    </a>
                </button>
                    &nbsp;&nbsp;&nbsp;&nbsp;

                </td>
            </tr>

        </c:forEach>

        </tbody>
    </table>


<script>

    $(document).ready(function () {
        $('#table1').DataTable();
    });
</script>

</div>
</body>


</html>


