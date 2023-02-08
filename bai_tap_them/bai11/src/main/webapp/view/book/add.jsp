<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 02/08/2023
  Time: 10:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="template/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="template/datatable/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="template/style.css">
</head>
</head>
<body>

<div class="row">
    <div class="col-md-10 container">
        <center>
            <h1 class="font-text-footer">Create Book</h1>
            <c:if test="${mess !=null}">
                <h2 class="text-danger">${mess}</h2>
            </c:if>
            <br>
            <div class="container">
                <form name="formCreate" action="/books?action=create" method="post"
                      onsubmit="return validateForm()">
                    <div class="input-group mb-3">
                        <span class="input-group-text">Title</span>
                        <input name="title" type="text" class="form-control me-2" placeholder="Title"
                               value="${title}">

                    </div>
                    <%-- Thông báo không nhập input--%>
                    <div class="input-group mb-5">
                                <span class="me-2 text-danger " style="left: 5px; position: absolute; font-weight: bold"
                                      id="TitleNotInput"></span>
                        <span class="me-2 text-danger" id="genderNotInput"
                              style="right: 5px; position: absolute; font-weight: bold"></span>
                    </div>

                    <div class="input-group mb-3">
                        <span class="input-group-text">Page Size</span>
                        <input name="pagesize" value="${pagesize}" type="text" class="form-control me-2"
                               placeholder="pagesize">

                        <%-- sau khi tạo thất bại--%>
                        </select>
                    </div>



                    <div class="input-group mb-3">
                        <span class="input-group-text">Author</span>
                        <input name="author" value="${author}" type="text" class="form-control me-2"
                               placeholder="author">
                    </div>



                    <div class="input-group mb-3">
                        <span class="input-group-text">Category</span>
                        <input name="category" value="${category}" type="text" class="form-control me-2"
                               placeholder="category">
                    </div>

                    <br>
                    <div class="input-group mb-5 d-flex align-content-center justify-content-center">
                        <button type="submit" class="btn btn-primary">Create</button>
                        <button type="button" class="btn btn-primary ms-3"><a style="text-decoration: none"
                                                                              class="text-light"
                                                                              href="/customer">Huỷ</a></button>
                    </div>
                </form>
            </div>
        </center>
    </div>
</div>

<%--+++++footer+++++++--%>
</body>
<script src="template/bootstrap/jquery-3.6.0.min.js"></script>
<script src="template/bootstrap/js/bootstrap.js"></script>
<script src="template/datatable/js/jquery.dataTables.min.js"></script>
<script src="template/datatable/js/dataTables.bootstrap4.min.js"></script>
<script src="template/main.js"></script>
<script>
    $(document).ready(function () {
        $('#tableCustomer').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 6
        });
    });

    function showInfo(id, name) {
        document.getElementById("idCustomer").value = id;
        document.getElementById("nameCustomer").innerText = name;
    }
</script>
</html>
