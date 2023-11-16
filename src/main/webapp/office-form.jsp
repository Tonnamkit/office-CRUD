<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
      integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <title>Office Form</title>
</head>

<body>

<div class="container">
    <c:if test="${add != null}">
    <div class="row">
        <h2>Add Office</h2>
    </div>
    <div class="row justify-content-center">
        <div class="col-md-6">
            <form action="office-form" method="post">
                <input type="hidden" name="action" value="add">
                <div class="form-group">
                    <label for="officeCode">Code:</label>
                    <input type="text" id="officeCode" name="officeCode" class="form-control">
                </div>
                </c:if>

                <c:if test="${add == null}">
                <div class="row">
                    <h2>Edit Office</h2>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-6">

                        <form action="office-form" method="post">
                            <input type="hidden" name="action" value="update">
                            </c:if>


                            <div class="form-row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="city">City:</label>
                                        <input type="text" id="city" name="city" class="form-control" value="${updateOffice != null?updateOffice.city:null}">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="phone">Phone Number:</label>
                                        <input type="text" id="phone" name="phone" class="form-control" value="${updateOffice != null?updateOffice.phone:null}">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="addressLine1">Address Line 1:</label>
                                <input type="text" id="addressLine1" name="addressLine1" class="form-control" value="${updateOffice != null?updateOffice.addressLine1:null}">
                            </div>
                            <div class="form-group">
                                <label for="addressLine2">Address Line 2:</label>
                                <input type="text" id="addressLine2" name="addressLine2" class="form-control" value="${updateOffice != null?updateOffice.addressLine2:null}">
                            </div>
                            <div class="form-row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="state">State:</label>
                                        <input type="text" id="state" name="state" class="form-control" value="${updateOffice != null?updateOffice.state:null}">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="country">Country:</label>
                                        <input type="text" id="country" name="country" class="form-control" value="${updateOffice != null?updateOffice.country:null}">
                                    </div>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="postalCode">Postal Code:</label>
                                        <input type="text" id="postalCode" name="postalCode" class="form-control" value="${updateOffice != null?updateOffice.postalCode:null}">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="territory">Territory:</label>
                                        <input type="text" id="territory" name="territory" class="form-control" value="${updateOffice != null?updateOffice.territory:null}">
                                    </div>
                                </div>
                            </div>
                            <div class="row ">
                                <button type="submit" class="btn btn-primary">SUBMIT</button>
                            </div>
                        </form>
                        <h5 class="mt-3 text-danger">${addStatus}</h5>
                    </div>
                </div>
        </div>
        <div class="row mt-3 text-center">
            <div class="col-12">
                <a href="office-management" class="btn btn-secondary">Back</a>
            </div>
        </div>
    </div>
</body>

</html>