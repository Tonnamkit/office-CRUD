<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Office Management</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-12">
            <h2>Office Management</h2>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <h4 class="ms-5 text-primary">${statusMsg}</h4>
        </div>
    </div>
    <hr>
    <div class="row">
        <div class="col-6">
            <form action="office-management" method="get">
                <label><b>Select By:</b></label>
                <select name="officeList" id="officeList" class="form-control">
                    <option value="all">ALL</option>
                    <optgroup label="Country">
                        <c:forEach items="${uniqueCountry}" var="country">
                            <c:if test="${country != null}">
                                <option value="${country}">${country}</option>
                            </c:if>
                        </c:forEach>
                    </optgroup>
                    <optgroup label="City">
                        <c:forEach items="${uniqueCity}" var="city">
                            <c:if test="${city != null}">
                                <option value="${city}">${city}</option>
                            </c:if>
                        </c:forEach>
                    </optgroup>
                </select>
                <input type="submit" value="FIND" class="btn btn-primary mt-2">
            </form>
        </div>
    </div>

    <div class="row mt-4">
        <c:forEach items="${offices}" var="office" varStatus="loop">
            <div class="col-2">
                <div class="card mb-4">
                    <div class="card-body">
                        <form action="office-management" method="post">
                            <input type="hidden" name="removeOffice" value="${office.officeCode}">
                            <input type="submit" value="REMOVE" class="btn btn-danger">
                        </form>
                        <form action="office-form" method="get">
                            <input type="hidden" name="editOffice" value="${office.officeCode}">
                            <input type="submit" value="EDIT" class="btn btn-primary mt-2">
                        </form>
                        <h5 class="card-title">${office.officeCode}</h5>
                        <p class="card-text">Country: ${office.country}</p>
                        <p class="card-text">City: ${office.city}</p>
                        <p class="card-text">Territory: ${office.territory}</p>
                        <p class="card-text">Address 1: ${office.addressLine1}</p>
                        <p class="card-text">Contact: ${office.phone}</p>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <div class="row">
        <div class="col-12">
            <h2>Remove Office By Office Code</h2>
        </div>
    </div>
    <div class="row">
        <div class="col-6">
            <form action="office-management" method="post">
                <input type="text" name="officeRemoveCode" class="form-control">
                <input type="submit" value="REMOVE" class="btn btn-primary mt-2">
            </form>
        </div>
    </div>
    <hr>
    <div class="row">
        <div class="col-12">
            <h2>Add New Office</h2>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <form action="office-form" method="get">
                <input type="hidden" name="insert" value="add">
                <input type="submit" value="add" class="btn btn-primary mt-2">
            </form>
        </div>
    </div>
</div>
</body>
</html>
