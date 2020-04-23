<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
    <h2>Patient List</h2>

    <table class="table table-bordered">
        <thead>
        <tr>
            <th>No</th>
            <th>Lastname</th>
            <th>FirstName</th>
            <th>Address</th>
            <th>City</th>
            <th>Action</th>
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
            </tr>

        </c:forEach>

        </tbody>
    </table>
</div>

</body>
</html>