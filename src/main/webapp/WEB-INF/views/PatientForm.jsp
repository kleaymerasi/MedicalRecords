<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <link href="${contextPath}/resource/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h1>Edit Patient :</h1>
    <div class="card">
        <div class="card-body">
            <%--@elvariable id="patient" type=""--%>
            <form:form action="savePatient" method="post" modelAttribute="patient"> 

            <div class="form-group row">
                <%--@declare id="name"--%><label for="name" class="col-sm-2 col-form-label">First
                    Name</label>
                <div class="col-sm-7">
                    <label>
                        <input type="text" class="form-control" name="name"
                               placeholder="Enter first name">
                    </label>
                </div>
            </div>

            <div class="form-group row">
                <%--@declare id="lastname"--%><label for="lastName" class="col-sm-2 col-form-label">Last
                    Name</label>
                <div class="col-sm-7">
                    <label>
                        <input type="text" class="form-control" name="lastName"
                               placeholder="Enter last name">
                    </label>
                </div>
            </div>

            <div class=" form-group row">
                    <%--@declare id="city"--%><label for="city" class="col-sm-2 col-form-label">City</label>
                <div class="col-sm-7">
                    <label>
                        <input type="text" class="form-control" name="city"
                               placeholder="Enter City">
                    </label>
                </div>
            </div>


            <div class="form-group row">
                <label for="lastName" class="col-sm-2 col-form-label">Address</label>
                <div class="col-sm-7">
                    <label>
                        <input type="text" class="form-control" name="address"
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