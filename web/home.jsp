<%--
    Document   : home
    Created on : Sep 1, 2019, 3:19:07 PM
    Author     : gabrielprieto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Cáculo Amortização</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.5/css/bulma.min.css">
        <script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf"%>
        <div class="container">
            <section class="section">
                <div class="columns">
                    <div class="column">
                        <div class="card">
                            <header class="card-header">
                                <p class="title card-header-title is-3">
                                    Integrantes
                                </p>
                            </header>
                            <div class="card-content">
                                <div class="media">
                                    <div class="media-left">
                                        <figure class="image is-48x48">
                                            <img src="https://avatars2.githubusercontent.com/u/32654017?s=460&v=4" alt="Placeholder image">
                                        </figure>
                                    </div>
                                    <div class="media-content">
                                        <p class="title is-4">Gabriel dos Santos Prieto</p>
                                        <p class="subtitle is-6"><a  href="https://github.com/gabrielninja" target="_blank" >@gabrielninja</a></p>
                                    </div>
                                </div>
                            </div>
                            <div class="card-content">
                                <div class="media">
                                    <div class="media-left">
                                        <figure class="image is-48x48">
                                            <img src="https://avatars0.githubusercontent.com/u/26369017?s=460&v=4" alt="Placeholder image">
                                        </figure>
                                    </div>
                                    <div class="media-content">
                                        <p class="title is-4">Thiago Felipe</p>
                                        <p class="subtitle is-6"><a href="https://github.com/thiagofelipe113" target="_blank" >@thiagofelipe113</a></p>
                                    </div>
                                </div>
                            </div>
                            <div class="card-content">
                                <div class="media">
                                    <div class="media-left">
                                        <figure class="image is-48x48">
                                            <img src="https://avatars1.githubusercontent.com/u/42654879?s=460&v=4" alt="Placeholder image">
                                        </figure>
                                    </div>
                                    <div class="media-content">
                                        <p class="title is-4">Matheus Marques</p>
                                        <p class="subtitle is-6"><a  href="https://github.com/matheusmqar" target="_blank" >@matheusmqar</a></p>
                                    </div>
                                </div>
                            </div>
                            <div class="card-content">
                                <div class="media">
                                    <div class="media-left">
                                        <figure class="image is-48x48">
                                            <img src="https://avatars2.githubusercontent.com/u/32654017?s=460&v=4" alt="Placeholder image">
                                        </figure>
                                    </div>
                                    <div class="media-content">
                                        <p class="title is-4">Yficklis Santos</p>
                                        <p class="subtitle is-6"><a  href="https://github.com/yficklis" target="_blank">@yficklis</a></p>
                                    </div>
                                </div>
                            </div>
                            <footer class="card-footer">
                                <h2 class="card-footer-item subtitle">
                                    A aplicação irá calcular dois tipos de amortização, Constante, Americana e Tabela Price.
                                </h2>
                            </footer>
                        </div>
                    </div>
                </div>
            </section>
        </div>

        <%@include file="WEB-INF/jspf/footer.jspf"%>
    </body>
</html>
