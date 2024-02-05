<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
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
<header class="p-2 text-center border-bottom">
    <h1 class="text-center mb-3"><i class="bi bi-person-plus-fill fs-1"></i>Add User</h1>
</header>
<main class="container-fluid">
    <div class="row">
        <div class="col-xl-4">
            <h4 class="mt-2">Add New User</h4>
            <form:form  autocomplete="off" method="post" action="/admin/new-user" enctype="application/x-www-form-urlencoded">
                <div class="mb-3">
                    <label for="txt-username" class="form-label">Username <b class="text-danger">*</b></label>
                    <input autocomplete="off" required minlength="3" name="username" type="text" value="" class="form-control" id="txt-username">
                </div>
                <div class="mb-3">
                    <label for="txt-password" class="form-label">Password<b class="text-danger">*</b></label>
                    <input autocomplete="new-password" required minlength="8" name="password" value="" type="password" class="form-control" id="txt-password"
                           >
                </div>
                <div class="mb-3">
                    <label for="txt-role" class="form-label">Role <b class="text-danger">*</b></label>
<%--                    <select name="accountStatus" id="accountStatus">--%>
<%--                        <c:forEach var="status" items="${userAccountDetails.accountStatusSet}">--%>
<%--                            <option value="${status}" ${status eq userAccountDTO.selectedAccountStatus ? 'selected' : ''}>${status}</option>--%>
<%--                        </c:forEach>--%>
<%--                    </select>--%>
                    <select class="form-select" name="role" id="txt-role">
                        <c:forEach var="role" items="${roleList}">
                            <option value="${role.id}">${role.id}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="txt-status" class="form-label">Account Status <b class="text-danger">*</b></label>
                    <select class="form-select" name="enabled" id="txt-status">
                            <option value="true">Enable</option>
                            <option value="false">Disable</option>
                    </select>
                </div>

                <div class="mb-3">
                    <button class="btn btn-primary" type="submit">SAVE</button>
                    <button type="reset" class="btn btn-warning">CLEAR</button>
                </div>
            </form:form>
        </div>
        <div class="col-xl-8">
            <table class="mt-2 table table-bordered table-hover">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>USERNAME</th>
                    <th>ROLE</th>
                    <th>ACCOUNT STATE</th>
                    <th>ACTION</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="user" items="${userList}">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.username}</td>
                        <td>${user.role.name}</td>
                        <td>
                            <c:if test="${user.enabled}">
                                Enabled
                            </c:if>
                            <c:if test="${user.enabled == false}">
                                Disabled
                            </c:if>
                        </td>
                        <td><a type="button" class="btn btn-success"
                               href="/delete/${user.id}">Update</a>
                            <a type="button" class="btn btn-warning"
                               href="/delete/${user.id}">Delete</a></td>
                    </tr>
                </c:forEach>
                </tbody>
                <c:if test="${empty userList}">
                    <tfoot>
                    <tr>
                        <td colspan="4" class="text-center">
                            There are no users to display
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