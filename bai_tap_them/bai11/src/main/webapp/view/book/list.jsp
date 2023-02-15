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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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
                        <div><a href="/books?action=edit&id=${book.id}">
                            <button class="btn btn-primary">Edit</button>
                        </a>
                            <button type="button" onclick="infoDelete('${book.getId()}','${book.getTitle()}')"
                                    class="btn btn-danger" data-bs-toggle="modal"
                                    data-bs-target="#exampleModal">
                                delete
                            </button>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <form action="/books?action=delete" method="post">
                <div class="modal-body">
                    <label for="deleteId"></label><input type="text" hidden id="deleteId" name="deleteId" value="${book.getId()}">
                    Bạn có muốn xóa sách <span id="deleteName"
                                               style="color: brown; font-weight: bold">${book.getTitle()}</span>
                    không ?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Không</button>
                    <button type="submit" class="btn btn-primary">Có,Hãy Xoá</button>
                </div>
            </form>


        </div>
    </div>
</div>
</div>


</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<script>
    $(document).ready(function () {
        $('#tableBook').dataTable({
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
<script>
    function infoDelete(id, name) {
        document.getElementById("deleteId").value = id;
        document.getElementById("deleteName").innerText = name;
    }
</script>

</html>
