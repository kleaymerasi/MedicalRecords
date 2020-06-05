<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Edit Patient</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
    <link href="${contextPath}/resources/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
</head>
<body style="background-color:#FAFAFA ;" >
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
    <h1>Edit Patient :</h1>
    <div class="card" style="background-color:#FAFAFA ;">
        <div class="card-body ">
            <%--@elvariable id="patient" type=""--%>
            <form:form action="savePatient" method="post" modelAttribute="patient">
                <form:hidden path="id"/>

            <div class="form-group row">
                <%--@declare id="name"--%><label for="name" class="col-sm-2 col-form-label">First
                    Name</label>
                <div class="col-sm-7">
                    <label>
                        <input type="text" class="form-control" name="name" value="${patient.name}"
                               placeholder="Enter first name">
                    </label>
                </div>
            </div>

            <div class="form-group row">
                <%--@declare id="lastname"--%><label for="lastName" class="col-sm-2 col-form-label">Last
                    Name</label>
                <div class="col-sm-7">
                    <label>
                        <input type="text" class="form-control" name="lastName" value="${patient.lastName}"
                               placeholder="Enter last name">
                    </label>
                </div>
            </div>

            <div class=" form-group row">
                    <%--@declare id="city"--%><label for="city" class="col-sm-2 col-form-label">City</label>
                <div class="col-sm-7">
                    <label>
                        <input type="text" class="form-control" name="city" value="${patient.city}"
                               placeholder="Enter City">
                    </label>
                </div>
            </div>



                <div class="form-group row">
                <label for="lastName" class="col-sm-2 col-form-label">Address</label>
                <div class="col-sm-7">
                    <label>
                        <input type="text" class="form-control" name="address" value="${patient.address}"
                               placeholder="Enter Address">
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