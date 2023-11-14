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
        <h2>Office Management</h2>
        <h4 class="ms-5">${statusMsg}</h4>
    </div>
    <hr>
    <div class="row">
        <h3>Find By City or Country</h3>
    </div>
    <div class="row">
        <form action="office-management" method="get">
            <label><b>Select By:</b></label>
            <select name="officeList" id="officeList">
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
            <input type="submit" value="FIND" class="btn btn-primary">
        </form>
    </div>

    <div class="row">
        <div class="card-deck">
            <c:forEach items="${offices}" var="office">
                <div class="card mb-4">
                    <div class="card-body">
                        <form action="office-management" method="post">
                            <input type="hidden" name="removeOffice" value="${office.officeCode}">
                            <input type="submit" value="REMOVE">
                        </form>
                        <form action="office-form" method="get">
                            <input type="hidden" name="editOffice" value="${office.officeCode}">
                            <input type="submit" value="EDIT">
                        </form>
                        <h5 class="card-title">${office.officeCode}</h5>
                        <p class="card-text">Country: ${office.country}</p>
                        <p class="card-text">City: ${office.city}</p>
                        <p class="card-text">Territory: ${office.territory}</p>
                    </div>
                </div>
            </c:forEach>
        </div>
        <hr>
    </div>

    <div class="row">
        <h2>Remove Office By Office Code</h2>
    </div>
    <div class="row">
        <form action="office-management" method="post">
            <input type="text" name="officeRemoveCode">
            <input type="submit" value="REMOVE" class="btn btn-primary">
        </form>
    </div>
    <hr>
    <div class="row">
        <h2>Add New Office</h2>
    </div>
    <div class="row">
        <form action="office-form" method="get">
            <input type="hidden" name="insert" value="add">
            <input type="submit" value="add" class="btn btn-primary">
        </form>
    </div>
</div>
</body>
</html>
