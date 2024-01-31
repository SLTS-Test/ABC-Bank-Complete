<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customers | ABC Bank</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Ubuntu:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/home.css">

</head>
<body>
<jsp:include page="common/header.jsp" />
<main class="p-3">
    <h1 class="text-center mb-3">
        <i class="bi bi-trash text-primary"></i>
        Delete Customers
    </h1>
    <table class="table table-bordered table-hover">
        <thead>
        <tr>
            <th>NIC</th>
            <th>NAME</th>
            <th>ADDRESS</th>
            <th>MOBILE</th>
            <th>ACTION</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="customer" items="${customerList}">
            <tr>
                <td>${customer.nic}</td>
                <td>${customer.name}</td>
                <td>${customer.address}</td>
                <td>${customer.mobileNo}</td>
                <td><a type="button" class="btn btn-warning"
                       href="/delete/${customer.nic}">Delete</a></td>
            </tr>
        </c:forEach>
        </tbody>
        <c:if test="${empty customerList}">
            <tfoot>
            <tr>
                <td colspan="5" class="text-center">
                    There are no customer records to display
                </td>
            </tr>
            </tfoot>
        </c:if>
    </table>
</main>
<%@include file="common/footer.jsp"%>
<script>
    function reloadPage() {
        location.reload();
    }
    let deleteElm = document.getElementsByClassName("btn");
    deleteElm.onclick = function () {
        alert("Successfully Deleted");
        reloadPage();
    }
</script>
</body>
</html>
