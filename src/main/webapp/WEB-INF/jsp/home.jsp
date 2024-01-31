
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home | ABC Bank</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Ubuntu:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/style.css">
    <style>
        .menu-item {
            display: flex;
            flex-direction: column;
            gap: 10px;
            cursor: pointer;
            color: black !important;
            width: 200px;
            background-color: lightgray;
            border: 1px solid lightgray !important;
            text-decoration: none !important;
            outline: none !important;
            padding: 10px;
            border-radius: 5px;
        }

        .menu-item:hover{
            box-shadow: 0 0 5px 2px rgba(0, 0, 0, 0.15) !important;
        }

        .menu-item:hover i {
            color: #0092e8 !important;
        }
    </style>
</head>
<body>
<%@ include file="common/header.jsp"%>
<main class="p-3 gap-3 d-flex justify-content-center flex-wrap">
    <a href="customers" class="menu-item text-center shadow-sm">
        <i class="bi bi-person-arms-up fs-1"></i>
        <span class="fs-4 fw-medium">Add User</span>
    </a>
    <a href="customers" class="menu-item text-center shadow-sm">
        <i class="bi bi-person-arms-up fs-1"></i>
        <span class="fs-4 fw-medium">List Customers</span>
    </a>
    <a href="add" class="menu-item text-center shadow-sm">
        <i class="bi bi-person-plus-fill fs-1"></i>
        <span class="fs-4 fw-medium">New Customer</span>
    </a>
    <a href="update" class="menu-item text-center shadow-sm">
        <i class="bi bi-pencil-square fs-1"></i>
        <span class="fs-4 fw-medium">Edit Customer</span>
    </a>
    <a href="delete" class="menu-item text-center shadow-sm">
        <i class="bi bi-trash fs-1"></i>
        <span class="fs-4 fw-medium">Delete Customer</span>
    </a>
</main>
<%@include file="common/footer.jsp"%>
</body>
</html>
