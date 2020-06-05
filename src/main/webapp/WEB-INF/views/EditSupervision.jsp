<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Edit Supervision</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
    <script src="https://kit.fontawesome.com/07ac43e54b.js" crossorigin="anonymous"></script>
    <script>
        $(document).ready(function () {
            initializeStartDatepicker();
            initializeDatepicker();
        })

        function initializeStartDatepicker() {
            let date_input = $('input[name="startDate"]');
            let container = $('.bootstrap-iso').length > 0 ? $('.bootstrap-iso').parent() : "body";
            let options = {
                format: 'mm/dd/yyyy',
                container: container,
                todayHighlight: true,
                autoclose: true
            };
            date_input.datepicker(options);
        }

        function initializeDatepicker() {
            let enddate_input = $('input[name="endDate"]');
            let container = $('.bootstrap-iso').length > 0 ? $('.bootstrap-iso').parent() : "body";
            let options = {
                format: 'mm/dd/yyyy',
                container: container,
                todayHighlight: true,
                autoclose: true
            };
            enddate_input.datepicker(options);
        }
    </script>
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
<div class="container -color:#FAFAFA ;">
    <h2>Edit Supervision</h2>
    <div class="card" style="background-color:#FAFAFA ; ">
        <div class="card-body">
            <form:form action="saveSupervision" method="post" modelAttribute="supervision">
            <form:hidden path="id"/>
            <form:hidden path="patientId"/>
            <div class="form-group row bootstrap-iso">
                <label class="col-sm-2 col-form-label" for="startDate">Start Date</label>
                <div class="col-sm-7">
                    <label>
                        <input class="form-control" id="startDate" name="startDate"
                               placeholder="MM/DD/YYY" type="text"
                               autocomplete="off"
                        />
                    </label>
                </div>
            </div>
            <div class="form-group row bootstrap-iso">
                <label class="col-sm-2 col-form-label" for="endDate">End Date</label>
                <div class="col-sm-7">
                    <label>
                        <input class="form-control" id="endDate" name="endDate"
                               placeholder="MM/DD/YYY" type="text"
                               autocomplete="off"
                        />
                    </label>
                </div>
            </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Choose Doctor
                    </label>
                    <div class="col-sm-3">
                    <select class="custom-select" name="doctorId">
                        <c:forEach items="${listDoctor}" var="doctor">
                            <option value="${doctor.id}">${doctor.firstName} </option>
                        </c:forEach>
                    </select>
                    </div>
                </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label" for="note">Note
                </label>
                <div class="col-sm-3">
                    <textarea class="form-control" rows="3" id="note">

                    </textarea>
                </div>
            </div>

            <button type="submit" class="btn btn-primary">Submit
            </button>
        </div>
    </div>
</div>
</form:form>
</body>
</html>
