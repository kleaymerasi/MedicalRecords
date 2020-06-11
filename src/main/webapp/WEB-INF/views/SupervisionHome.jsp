<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Supervision</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/07ac43e54b.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
</head>
<body style="background-color:#FAFAFA ;">

<nav class="navbar navbar-light" style="background-color:  #cce6ff;">
    <a class="navbar-brand">KLEA Hospital</a>
    <a href="${pageContext.request.contextPath}/" class="nav-item nav-link"> Home</a>
    <a href="Patient" class="nav-item nav-link">  Patient</a>
    <a href="Doctor" class="nav-item nav-link"> Doctor </a>
    <a href="Supervision" class="nav-item nav-link"><strong>Supervision</strong></a>
    <div class="navbar-nav ml-auto">
        <a href="https://goo.gl/maps/VcfEPiai4eR5Up3k6" class="nav-item nav-link"><strong>Contact</strong></a>
    </div>

</nav>

<div class="container">
    <br>
    <h2 style="color: slategrey">Supervision List</h2><br>

    <table id="table2" class="table table-bordered" style="width:100%">
        <thead>
        <tr>
            <th style="color: slategrey">No</th>
            <th style="color: slategrey">Note</th>
            <th style="color: slategrey">Start Date</th>
            <th style="color: slategrey">End Date</th>
            <th style="color: slategrey">Patient Id</th>
            <th style="color: slategrey">Doctor Id</th>
            <th style="color: slategrey">Action</th>
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

                    <button type="button" class="btn btn-default btn-sm">
                        <a href="editSupervision?id=${supervision.id}">
                            <i class="fas fa-edit"></i>
                        </a>
                    </button>

                    &nbsp;<button type="button" class="btn btn-default btn-sm">
                    <a href="deleteSupervision?id=${supervision.id}">
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
            $('#table2').DataTable();
        });
    </script>
</div>

</body>
</html>
