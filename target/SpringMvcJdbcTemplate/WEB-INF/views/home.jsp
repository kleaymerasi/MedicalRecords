<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Patient Home</title>
</head>
<body>
<div align="center">
    <h1>Patient List </h1>
    <h3><a href="NewPatient">New Patient</a></h3>
    <table border="1">
        <th>No</th>
        <th>Last Name</th>
        <th>Name</th>
        <th>Address</th>
        <th>City</th>
        <th>Action</th>

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
    </table>
</div>
</body>
</html>
