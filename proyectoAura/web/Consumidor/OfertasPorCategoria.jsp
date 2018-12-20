<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
    <head>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="../js/CarouselHome.js" type="text/javascript"></script>
        <title>Mis Ofertas</title>
        <link rel="shortcut icon" href="https://s3.amazonaws.com/proyectoaura-storage/img/Logo+Empresa.png">
        <style>
            <%@include file="../css/style.css" %>
        </style>
    </head>
    <body>
        <%@include file="../Plantillas/NavbarConsumidor.jspf" %>
        <div class="container-fluid" >
            <div class="row">
                <div class="menuizquierdo">
                    <%@include file="../Plantillas/MenuRedirecciones.jspf"%>
                </div>
                <div class="contenidoCategoria">
                    <c:forEach items="${listadoPorCategoria}" var="oferta">            
                        <div class="card">
                           <h4 class="card-text"><c:out value="${oferta.tipoOferta}" /></h4>
                           <div class="imagenTop"> 
                                <a href="${pageContext.request.contextPath}/ConsumidorServlet?action=detalle&idofer=${oferta.idOferta}">
                                    <img class="card-img-top" src="${oferta.imagen}" alt="Card image cap">
                                </a>
                           </div>
                           <div class="card-body">
                               <a class="card-link" href="${pageContext.request.contextPath}/ConsumidorServlet?action=detalle&idofer=${oferta.idOferta}">
                                <p class="card-title"><c:out value="${oferta.nombre}" /></p>
                                <h4 class="card-title">$<c:out value="${oferta.precioOferta}" /></h4>
                               </a>
                               <a href="${pageContext.request.contextPath}/ConsumidorServlet?action=detalle&idofer=${oferta.idOferta}" class="btn btn-primary">ver más</a>
                           </div>
                           
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </body>
</head>
</html>
