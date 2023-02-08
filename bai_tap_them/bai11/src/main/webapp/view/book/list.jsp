<%--
  Created by IntelliJ IDEA.
  User: thanh
  Date: 15-Jun-22
  Time: 6:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
          crossorigin="anonymous">
</head>
<body>

<div class="container-fluid">
    <div class="row">
        <center>
            <h1 class="font-text-footer">Book List</h1>
            <c:if test="${mess !=null}">
                <h2 class="text-danger">${mess}</h2>
            </c:if>
        </center>
        <br>
        <table id="tableBook" class="table table-hover">
            <thead>
            <tr>
                <th class="col">id</th>
                <th class="col">name</th>
                <th class="col">Page Size</th>
                <th class="col">Author</th>
                <th class="col">Category</th>


                <th><a href="/books?action=create">
                    <button class="btn btn-secondary w-40">Create</button>
                </a></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="book" items="${bookList}">
                <tr>
                    <td><c:out value="${book.id}"/></td>
                    <td><c:out value="${book.title}"/></td>
                    <td><c:out value="${book.pageSize}"/></td>
                    <td><c:out value="${book.author}"/></td>
                    <td><c:out value="${book.category}"/></td>

                    <td class="d-flex">
                        <div><a href="=${book.id}">
                            <button class="btn btn-primary">Edit</button>
                        </a>
                            <button type="button" onclick="showInfo('${book.id}','${book.title}')"
                                    class="btn btn-danger"
                                    data-bs-toggle="modal"
                                    data-bs-target="#deleteModal">
                                Delete
                            </button>
                        </div>
                    </td>
                        <%--                    <td>--%>
                        <%--                        <!-- Button trigger modal -->--%>
                        <%--                        <button type="button" onclick="showInfo('${book.id}','${book.title}')"--%>
                        <%--                                class="btn btn-danger"--%>
                        <%--                                data-bs-toggle="modal"--%>
                        <%--                                data-bs-target="#deleteModal">--%>
                        <%--                            Delete--%>
                        <%--                        </button>--%>
                        <%--                    </td>--%>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function () {
        $('#tableCustomer').dataTable({
            dom: 'lrtip',
            lengthChange: false,
            pageLength: 10,
            bInfo: false,
            // "pagingType": 'full_numbers',
        });
    });
</script>
<script>
    function showInfo(id, name) {
        document.getElementById("idCustomer").value = id;
        document.getElementById("nameCustomer").innerText = name;
    }
</script>
</html>
