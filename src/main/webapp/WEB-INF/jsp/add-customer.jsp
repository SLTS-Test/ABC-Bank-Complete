<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
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
<header class="p-2 text-center border-bottom">
    <h1 class="text-center mb-3"><i class="bi bi-person-plus-fill fs-1"></i>Add Customer</h1>
</header>
<main class="container-fluid">
    <div class="row">
        <div class="col-xl-4">
            <h4 class="mt-2">New Customer Details</h4>
            <form:form method="post">
                <div class="mb-3">
                    <label for="txt-nic" class="form-label">Customer NIC <b class="text-danger">*</b></label>
                    <input required pattern="^\d{9}V$|^\d{11}V$" name="nic" type="text" class="form-control" id="txt-nic"
                           placeholder="123456789V">
                </div>
                <div class="mb-3">
                    <label for="txt-name" class="form-label">Customer Name <b class="text-danger">*</b></label>
                    <input required pattern="^[A-Za-z ]+$" name="name" type="text" class="form-control" id="txt-name"
                           placeholder="Eg. Nilan Dinushka">
                </div>
                <div class="mb-3">
                    <label for="txt-address" class="form-label">Customer Address <b class="text-danger">*</b></label>
                    <input required minlength="2" name="address" type="text" class="form-control" id="txt-address"
                           placeholder="Eg. Grace Peries Road, Panadura">
                </div>
                <div class="mb-3">
                    <label for="txt-mobile" class="form-label">Customer Mobile No. <b class="text-danger">*</b></label>
                    <input required pattern="^0\d{9}$" name="mobileNo" type="text" class="form-control" id="txt-mobile"
                           placeholder="0711234567">
                </div>

                <div class="mb-3">
                    <button class="btn btn-primary">SAVE</button>
                    <button type="reset" class="btn btn-warning">CLEAR</button>
                </div>
                </form:form>
        </div>
        <div class="col-xl-8">
            <table class="mt-2 table table-bordered table-hover">
                <thead>
                <tr>
                    <th>NIC</th>
                    <th>NAME</th>
                    <th>ADDRESS</th>
                    <th>MOBILE</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="customer" items="${customerList}">
                    <tr>
                        <td>${customer.nic}</td>
                        <td>${customer.name}</td>
                        <td>${customer.address}</td>
                        <td>${customer.mobileNo}</td>
                    </tr>
                </c:forEach>
                </tbody>
                <c:if test="${empty customerList}">
                    <tfoot>
                    <tr>
                        <td colspan="4" class="text-center">
                            There are no customer records to display
                        </td>
                    </tr>
                    </tfoot>
                </c:if>
            </table>
        </div>
    </div>
</main>
<%@include file="common/footer.jsp"%>
</body>
</html>