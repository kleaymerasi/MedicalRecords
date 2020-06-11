<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Patient</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/07ac43e54b.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
</head>
<body style="background-color:#FAFAFA ;">

<nav class="navbar navbar-light" style="background-color:  #cce6ff;">
    <a class="navbar-brand">KLEA Hospital</a>
    <a href="${pageContext.request.contextPath}/" class="nav-item nav-link"> Home</a>
    <a href="Patient" class="nav-item nav-link"><strong>Patient</strong></a>
    <a href="Doctor" class="nav-item nav-link">Doctor</a>
    <a href="Supervision" class="nav-item nav-link"> Supervision</a>
    <div class="navbar-nav ml-auto">
        <a href="https://goo.gl/maps/VcfEPiai4eR5Up3k6" class="nav-item nav-link"><strong>Contact</strong></a>
    </div>

</nav>


<div class="container">
  <br>  <h2 style="color: slategrey">Patient List</h2> <br>

    <table id="table3" class="table table-bordered" style="width:100%">
        <thead>
        <tr>
            <th style="color: slategrey">No</th>
            <th style="color: slategrey">Last Name</th>
            <th style="color: slategrey">First Name</th>
            <th style="color: slategrey">Address</th>
            <th style="color: slategrey">City</th>
            <th style="color: slategrey">Action</th>

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

                        <button type="button" class="btn btn-default btn-sm">
                            <a href="editPatient?id=${patient.id}">
                       <i class="fas fa-edit"></i>
                            </a>
                    </button>

                    &nbsp;<button type="button" class="btn btn-default btn-sm">
                    <a href="deletePatient?id=${patient.id}">
                    <i class="fas fa-trash-alt"></i>
                    </a>
                </button>
                    &nbsp;<button type="button" class="btn btn-default btn-sm">
                    <a href="assignDoctor?id=${patient.id}">
                        <i class="fas fa-user-md"></i>
                    </a>
                </button>
                </td>


            </tr>

        </c:forEach>

        </tbody>
    </table>
    <script>

        $(document).ready(function () {
            $('#table3').DataTable();
        });
    </script>
</div>

</body>
</html>