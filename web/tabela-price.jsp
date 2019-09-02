<%--
    Document   : amortizacao-constatante
    Created on : Sep 1, 2019, 4:32:36 PM
    Author     : gabrielprieto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Tabela - Price</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.5/css/bulma.min.css">
        <script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf"%>
        <div class="container">
            <section class="section">
                <div class="tile is-ancestor">
                    <div class="tile is-parent  has-background-primary">
                        <h1 class="title is-02 has-text-white">Tabela - Price</h1>
                    </div>
                </div>
                <div class="columns">
                    <div class="column">
                        <form>
                            <div class="field">
                                <label class="label">Valor Financiado (R$)</label>
                                <div class="control">
                                    <input class="input" type="number" name="valorFinanciado">
                                </div>
                            </div>
                            <div class="field">
                                <label class="label">Meses</label>
                                <div class="control">
                                    <input class="input" type="number" name="mes">
                                </div>
                            </div>
                            <div class="field">
                                <label class="label">Juros</label>
                                <div class="control">
                                    <input class="input" type="number" name="juros">
                                </div>
                            </div>
                            <div class="control">
                                <input class="button is-primary" type="submit" name="enviar" value="Calcular">
                            </div>
                        </form>
                    </div>
                    <div class="column">
                        <% if (request.getParameter("enviar") != null) {
                                try {
                                    int i = 1;
                                    double valorFinanciado = Double.valueOf(request.getParameter("valorFinanciado"));
                                    double mes = Double.valueOf(request.getParameter("mes"));
                                    double juros = Double.valueOf(request.getParameter("juros"));
                                    double amortizacao = 0;
                                    double parcelas = 0;
                                    double acumuloJuros = 0;
                                    double divida = 0; %>

                        <table class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth">
                            <thead>
                                <tr>
                                    <th>Mês</th>
                                    <th>Parcelas</th>
                                    <th>Amortizações</th>
                                    <th>Juros</th>
                                    <th>Saldo Devedor</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% parcelas = valorFinanciado * ((Math.pow(1 + (juros / 100), mes)) * (juros / 100)) / ((Math.pow(1 + (juros / 100), mes)) - 1);
                                    acumuloJuros = valorFinanciado * (juros / 100);
                                    amortizacao = parcelas - acumuloJuros;
                                    divida = valorFinanciado - amortizacao;%>
                                <tr>
                                    <td><%= i%></td>
                                    <td><%= parcelas%></td>
                                    <td><%= amortizacao%></td>
                                    <td><%= acumuloJuros%></td>
                                    <td><%= divida%></td>
                                </tr>
                                <% for (i = 2; i <= mes; i++) {
                                        acumuloJuros = divida * (juros / 100);
                                        amortizacao = parcelas - acumuloJuros;
                                        divida = divida - amortizacao;
                                        divida = (i == mes)? 0 : divida ;%>
                                <tr>
                                    <td><%= i%></td>
                                    <td><%= parcelas%></td>
                                    <td><%= amortizacao%></td>
                                    <td><%= acumuloJuros%></td>
                                    <td><%= divida%></td>
                                </tr>
                                <% }%>
                            </tbody>
                        </table>
                        <% } catch (Exception e) {%>
                        <h2 style="color:red">Número Inválido</h2>
                        <% }
                            }%>
                    </div>
                </div>
            </section>
        </div>
        <%@include file="WEB-INF/jspf/footer.jspf"%>
    </body>
</html>
