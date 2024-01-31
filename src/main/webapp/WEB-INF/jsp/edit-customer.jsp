<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Customers</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap"
      rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<jsp:include page="common/header.jsp" />
<main class="container-fluid">
    <div class="row">
        <div class="col-xl-4">
            <h4 class="mt-2">Update Customer Details</h4>
            <form:form method="post">
                <div class="mb-3">
                    <label for="txt-nic" class="form-label">Customer NIC <b class="text-danger">*</b></label>
                    <input value="${customerDetails.nic}" required disabled pattern="^\d{9}V$|^\d{11}V$" name="nic" type="text" class="form-control" id="txt-nic"
                           placeholder="123456789V">
                </div>
                <div class="mb-3">
                    <label for="txt-name" class="form-label">Customer Name <b class="text-danger">*</b></label>
                    <input value="${customerDetails.name}" required pattern="^[A-Za-z ]+$" name="name" type="text" class="form-control" id="txt-name"
                           placeholder="Eg. Nilan Dinushka">
                </div>
                <div class="mb-3">
                    <label for="txt-address" class="form-label">Customer Address <b class="text-danger">*</b></label>
                    <input value="${customerDetails.address}" required minlength="2" name="address" type="text" class="form-control" id="txt-address"
                           placeholder="Eg. Grace Peries Road, Panadura">
                </div>
                <div class="mb-3">
                    <label for="txt-mobile" class="form-label">Customer Mobile No. <b class="text-danger">*</b></label>
                    <input value="${customerDetails.mobileNo}" required minlength="2" name="mobileNo" type="text" class="form-control" id="txt-mobile"
                           placeholder="0711234567">
                </div>

                <div class="mb-3">
                    <button class="btn btn-primary">UPDATE</button>
                    <button type="reset" class="btn btn-warning">CLEAR</button>
                </div>
            </form:form>
        </div>
    </div>
</main>
<%@include file="common/footer.jsp"%>
</body>
</html>
