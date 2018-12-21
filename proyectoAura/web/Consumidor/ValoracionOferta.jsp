<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <link href="/Content/glyphicons.css" rel="stylesheet" />
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="https://s3.amazonaws.com/proyectoaura-storage/img/Logo+Empresa.png">
        <title>Valoración de Ofertas</title>
        <style>
            <%@include file="../css/style.css" %>
        </style>
    </head>
    <body>
        <%@include file="../Plantillas/NavbarConsumidor.jspf" %>
        <div class="container-fluid" >
            <div class="row">
                <div class="menuizquierdo">
                    <%@include file="../Plantillas/MenuRedirecciones.jspf" %>
                </div>
                <!--Estrellitas-->  
                <div class="divGrandeValoracion">
                    <div id="estrellitas">
                        <div class="estrellas">
                            <img class="estrella1" src="https://s3.amazonaws.com/proyectoaura-storage/img/favourites.png"/>
                            <img class="estrella2" src="https://s3.amazonaws.com/proyectoaura-storage/img/favourites.png"/>
                            <img class="estrella3" src="https://s3.amazonaws.com/proyectoaura-storage/img/favourites.png"/>
                            <img class="estrella4" src="https://s3.amazonaws.com/proyectoaura-storage/img/favourites.png"/>
                            <img class="estrella5" src="https://s3.amazonaws.com/proyectoaura-storage/img/favourites.png"/>
                        </div>
                        <h1 class="tituloBienvenido">¡Bienvenido!</h1>
                        <p class="textoBienvenido">Ésta es la página de valoraciones. Para acceder a nuestros 
                            descuentos, valora las ofertas que hayas comprado en cualquiera de nuestras tiendas
                            asociadas. Para ésto, deberas fotografiar la boleta de tu compra, y valorar individualmente
                            las ofertas que hayas comprado en esa boleta. Por cada valoración de oferta que hagas, recibirás
                            10 puntos, los cuales se acumularán para poder ser canjeados por descuentos en nuestras categorías
                            de productos.</p>
                    </div>


                    <!--Parte seba-->
                    <div id="div-form-val">
                        <form action="${pageContext.request.contextPath}/ValoracionServlet/Registrar" class="needs-validation" id="formValoracion">
                            <div class="agregarImagen">
                                <p class="titulo-control">Agregar Imagen</p>
                                <div class="contenedor-imagen" for="imgInput">
                                    <img class="agregarImg" src="https://s3.amazonaws.com/proyectoaura-storage/img/cloud-upload.png">
                                    <input type="file" size="30" id="imgInput">
                                </div>
                                <!-- <label for="imgInput">Agregar Imagen</label>
                                 <input type="file" class="form-control-file" id="imgInput">-->
                            </div>
                            
                            <div class="grupoValoracion">
                                <div id="SelecSucu">
                                    <label for="cbSucursales">Seleccione Sucursal:</label>
                                    <select class="ddl" name="cbSucurcales" required>
                                        <c:forEach items="${sucursales}" var="sucursal">
                                            <option value="${sucursal.getIdSucursal()}">${sucursal.getNombre()}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div id="SelecCateg">    
                                    <label for="cbCategoria">Seleccione Categoría:</label>
                                    <select class="ddl" name="cbCategoria" required>
                                        <c:forEach items="${categorias}" var="categoria" >
                                            <option value="${categoria.getIdCategoria()}">${categoria.getNombre()}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                
                                <div id="selecOferta">
                                    <label for="cbOferta">Seleccione Oferta:</label>
                                    <select class="ddl" name="cbOferta" required>
                                        <c:forEach items="${ofertas}" var="oferta">
                                            <option class="{oferta.getIdSucursal} {oferta.getIdCategoria}" value="${oferta.getIdOferta()}">${oferta.getNombre()}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                
                                <div id= "radio_valoracion">
                                    <label for="cbOferta">Evalúe la Oferta:</label><br>
                                    <label class="radio-inline">
                                        <input id="op1" type="radio" name="valoracion" value="1">Mala
                                    </label>
                                    <label class="radio-inline">
                                        <input id="op2" type="radio" name="valoracion" value="2">Buena
                                    </label>
                                    <label class="radio-inline">
                                        <input id="op3" type="radio" name="valoracion" value="3" checked>Excelente
                                    </label>
                                </div>
                                
                                <div class="ingresotexto">
                                    <textarea placeholder='Escribe tu comentario aquí...' type="text" name="nombredelacaja" class="textbox-Valoracion"></textarea>
                                    <button class="botonIngresarValoracion"><a href="#openModal" class="modalvaloracion">Ingresar</a></button>
                                    <!--modal-->
                                    <div id="openModal" class="modalDialog">
                                        <div>
                                            <center>
                                                <a href="#close" title="Close" class="close">X</a>
                                                <div class="texto-modal">
                                                    <div class="contenedorTexto">
                                                        <h2 class="puntos">Puntos</h2>
                                                        <p class="tenias">Tenías</p>
                                                        <p class="tienes">Tienes</p>

                                                        <p class="teniasValor">${usuario.puntaje}</p>
                                                        <p class="loguito"> > </p>
                                                        <p class="tienesValor">${usuario.puntaje+10}</p>
                                                    </div>
                                                    <p class="graciasValoracion">Gracias por Valorar!</p>
                                                    
                                                    <img class="pdf" src="https://s3.amazonaws.com/proyectoaura-storage/img/pdf.png"/>

                                                    <a href="${pageContext.request.contextPath}/GeneracionCuponPdfServlet"> Descargue su cupon aquí</a>
                                                </div>
                                            </center>
                                        </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                        </form>
                    </div>
                </div>
            </div>  
        </div>
    </body>    
</html>
