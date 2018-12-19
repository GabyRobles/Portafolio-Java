
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
        <link rel="stylesheet" href="//cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
        <script src="//cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Productos</title>
        <link rel="shortcut icon" href="https://s3.amazonaws.com/proyectoaura-storage/img/Logo+Empresa.png">
        <script type="text/javascript">
            $(document).ready(function () {
                $('#productos').DataTable();
            });
        </script>
        <style>
            <%@include file="../../css/trabajadorStyle.css" %>
        </style>
    </head>
    <body style="overflow : hidden; overflow-y : scroll">

        <div class="row">
            <div class="col-sm-2">
                <%@include file="../../Plantillas/MenuTrabajador.jspf" %>
            </div>
            <div class="col-sm-10 col-sm-offset-1">
                <%@include file="../../Plantillas/NavbarTrabajador.jspf" %>
                <div class="contenedorTituloBusqueda">
                    <a class="tituloProducto">Productos</a>

                    <div class="contenedorBuscar form-inline">
                        <input class="form-control" type="text" placeholder="Buscar" id="buscador"/>
                        <input class="btn btn-primary" type="button" value="Buscar" id="btnBuscador"/>
                    </div>
                </div>
                <table id="productos" class="table table-bordered table-hover">
                    <thead class="thead-light">
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Categoría</th>
                            <th scope="col">Llegada del Lote</th>
                            <th scope="col">Fecha de Vencimiento</th>
                        </tr>
                    </thead>
                    <tbody >
                        <c:forEach items="${productos}" var="producto" >
                            <tr>
                                <td scope="row">${producto.getIdProducto()}</td>
                                <td scope="row">${producto.getNombre()}</td>
                                <td scope="row">${producto.getIdCategoria().getNombre()}</td>
                                <td scope="row">${producto.getFechaElab()}</td>
                                <td scope="row">${producto.getFechaVen()}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div>
                    <ul id="productos_page" class="pagination justify-content-center"></ul>
                </div>
            </div>
        </div>
    </body>
</html>
