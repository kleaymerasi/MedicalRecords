<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Edit Doctor</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/07ac43e54b.js" crossorigin="anonymous"></script>
    <link href="${contextPath}/resources/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resource/bootstrap.min.css" rel="stylesheet">
</head>
<body style="background-color:#FAFAFA ;">
<nav class="navbar navbar-light" style="background-color:  #cce6ff;">
    <a class="navbar-brand">KLEA Hospital</a>
    <a href="${pageContext.request.contextPath}/" class="nav-item nav-link"> Home</a>
    <a href="Patient" class="nav-item nav-link">Patient</a>
    <a href="Doctor" class="nav-item nav-link"> <strong> Doctor</strong> </a>
    <a href="Supervision" class="nav-item nav-link"> Supervision</a>
    <div class="navbar-nav ml-auto">
        <a href="https://goo.gl/maps/VcfEPiai4eR5Up3k6" class="nav-item nav-link"><strong>Contact</strong></a>
    </div>

</nav>
<div class="container">
    <br> <h2 style="color: slategrey">Edit Doctor </h2> <br>
    <div class="card" style="background-color:#FAFAFA ; ">
        <div class="card-body">
            <%--@elvariable id="patient" type=""--%>
            <form:form action="saveDoctor" method="post" modelAttribute="doctor">
                <form:hidden path="id"/>

            <div class="form-group row">
                    <%--@declare id="firstName"--%><label for="firstName" class="col-sm-2 col-form-label">First
                Name</label>
                <div class="col-sm-7">
                    <label>
                        <input type="text" class="form-control" name="firstName" value="${doctor.firstName}"
                               placeholder="Enter first name">
                    </label>
                </div>
            </div>

            <div class="form-group row">
                    <%--@declare id="lastname"--%><label for="lastName" class="col-sm-2 col-form-label">Last
                Name</label>
                <div class="col-sm-7">
                    <label>
                        <input type="text" class="form-control" name="lastName" value="${doctor.lastName}"
                               placeholder="Enter last name">
                    </label>
                </div>
            </div>

            <div class=" form-group row">
                    <%--@declare id="Address"--%><label for="Address" class="col-sm-2 col-form-label">Address</label>
                <div class="col-sm-7">
                    <label>
                        <input type="text" class="form-control" name="Address" value="${doctor.address}"
                               placeholder="Enter Address">
                    </label>
                </div>
            </div>


            <div class="form-group row">
                <%--@declare id="city"--%><label for="City" class="col-sm-2 col-form-label">City</label>
                <div class="col-sm-7">
                    <label>
                        <input type="text" class="form-control" name="City" value="${doctor.city}"
                               placeholder="Enter City">
                    </label>
                </div>
            </div>

                <div class="form-group row">
                        <%--@declare id="speciality"--%><label for="Speciality" class="col-sm-2 col-form-label">Seciality</label>
                    <div class="col-sm-7">
                        <label>
                            <input type="text" class="form-control" name="Speciality" value="${doctor.speciality}"
                                   placeholder="Enter Speciality">
                        </label>
                    </div>
                </div>

                <div class="form-group row">
                        <%--@declare id="age"--%><label for="Age" class="col-sm-2 col-form-label">Age</label>
                    <div class="col-sm-7">
                        <label>
                            <input type="text" class="form-control" name="Age" value="${doctor.age}"
                                   placeholder="Enter Age">
                        </label>
                    </div>
                </div>




                <button type="submit" class="btn btn-primary">Submit</button>

        </div>
    </div>
</div>
</body>
</form:form>
</html>
