
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <link rel="stylesheet" href="//cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"/> 
        <script src="//cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#ofertas').DataTable();
            });
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Ofertas</title>
        <link rel="shortcut icon" href="https://s3.amazonaws.com/proyectoaura-storage/img/Logo+Empresa.png">

        <style>
            <%@include file="../../css/trabajadorStyle.css" %>
        </style>
    </head>
    <body>
        <div class="row">
            <div class="col-sm-2">
                <%@include file="../../Plantillas/MenuTrabajador.jspf" %>
            </div>
            <div class="col-sm-10 col-sm-offset-1">
                <%@include file="../../Plantillas/NavbarTrabajador.jspf" %>
                <div class="contenedorTituloNuevo">
                    <a class="tituloOferta">Ofertas</a>

                    <!--Boton Nuevo-->
                    <a id="btnNuevaOferta" class="btn btn-primary btn-lg" href="#modalOferta">Nueva</a>
                    <!--Modal-->
                    <div id="modalOferta" class="modalDialog">
                        <div>
                            <a href="" title="close" class="close">X</a>
                            <jsp:include page="../../Trabajador/Encargado/DetalleOferta.jsp">
                                <jsp:param name="sucursales" value="${sucursales}"/>
                            </jsp:include>
                        </div>
                    </div>

                </div>

                <table id="ofertas" class="table table-bordered table-hover" >
                    <thead class="thead-light">
                    <th scope="col">ID</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Producto</th>
                    <th scope="col">Categoria</th>
                    <th scope="col">Tipo</th>
                    <th scope="col">Fecha de Termino</th>
                    <th scope="col">Opciones</th>
                    </thead >
                    <tbody>
                        <c:forEach items="${ofertas}" var="oferta">
                            <tr>
                                <td scope="row">${oferta.idOferta}</td>
                                <td scope="row">${oferta.nombre}</td>
                                <td scope="row">${oferta.idProducto.nombre}</td>
                                <td scope="row">${oferta.idCategoria.nombre}</td>
                                <td scope="row">${oferta.tipoOferta}</td>
                                <td scope="row" class="ofertaTermino">${oferta.getFechaTerm()}</td>
                                <td scope="row"><a class="BotonEditar" href="#modalEdit${oferta.idOferta}">Editar</a>
                                    <a class="botonEliminar" href="${pageContext.request.contextPath}/OfertaServlet?action=Eliminar&idOferta=${oferta.idOferta}">Eliminar</a>
                                </td>
                            </tr>
                        <div id="modalEdit${oferta.idOferta}" class="modalDialog">
                            <div>
                                <a href="" title="close" class="close">X</a>
                                <jsp:include page="../../Trabajador/Encargado/DetalleOferta.jsp">
                                    <jsp:param name="oferta" value="${oferta}"/>
                                    <jsp:param name="oNombre" value="${oferta.nombre}"/>
                                    <jsp:param name="ofertaID" value="${oferta.idOferta}"/>
                                    <jsp:param name="oIdProducto" value="${oferta.idProducto.idProducto}"/>
                                    <jsp:param name="oCategoria" value="${oferta.idCategoria.idCategoria}"/>
                                    <jsp:param name="oTipo" value="${oferta.tipoOferta}"/>
                                    <jsp:param name="oImagen" value="${oferta.imagen}"/>
                                    <jsp:param name="oPrecio" value="${oferta.precioOferta}"/>
                                    <jsp:param name="oIdTrab" value="${oferta.idTrabajador.idTrabajador}"/>
                                    <jsp:param name="oSucursal" value="${oferta.idSucursal.nombre}"/>
                                    <jsp:param name="oFechaI" value="${oferta.fechaIni}"/>
                                    <jsp:param name="oFechaT" value="${oferta.fechaTerm}"/>
                                </jsp:include>
                            </div>
                        </div>
                    </c:forEach>

                    </tbody>
                </table>
            </div>
        </div>

    </body>
</html>
