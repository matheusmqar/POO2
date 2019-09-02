<%--
    Document   : amortizacao-americana
    Created on : Sep 1, 2019, 4:32:36 PM
    Author     : gabrielprieto
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Amortização Americana</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.5/css/bulma.min.css">
        <script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf"%>
        <div class="container">
            <section class="section">
                <div class="tile is-ancestor">
                    <div class="tile is-parent  has-background-primary">
                        <h1 class="title is-02 has-text-white">Amortização Americana</h1>
                    </div>
                </div>

                <div class="columns">
                    <div class="column">
                        <form>
                            <div class="field">
                                <label class="label">Valor Financiado</label>
                                <div class="control">
                                    <input class="input" type="text" name="capital">
                                </div>
                            </div>
                            <div class="field">
                                <label class="label">Meses</label>
                                <div class="control">
                                    <input class="input" type="text" name="meses"/>
                                </div>
                            </div>
                            <div class="field">
                                <label class="label">Juros (%) </label>
                                <div class="control">
                                    <input class="input" type="text" name="juros"/>
                                </div>
                            </div>
                            <div class="control">
                                <input class="button is-primary" type ="submit" value="Calcular" name="calculo">
                            </div>
                        </form>
                    </div>
                    <div class="column">
                        <%try { %>
                        <%  if (request.getParameter("capital") != null & request.getParameter("meses") != null & request.getParameter("juros") != null) {
                                double capital = Double.parseDouble(request.getParameter("capital"));
                                int meses = Integer.parseInt(request.getParameter("meses"));
                                double juros = Double.parseDouble(request.getParameter("juros")) / 100;
                                DecimalFormat formatar = new DecimalFormat("0.##");
                                double amortizacao = 0;
                        %>

                        <table class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth">
                            <thead>
                                <tr>
                                    <th> Mês   </th>
                                    <th> Parcelas </th>
                                    <th> Amortização </th>
                                    <th> Juros  </th>
                                    <th> Saldo</th>
                                </tr>
                            </thead>
                            <tr>
                                <% for (int i = 0; i < meses; i++) {
                                        double parcela = capital * juros;
                                        double saldoDevedor = capital;
                                        if (i == (meses - 1)) {
                                            parcela = parcela + capital;
                                            amortizacao = capital;
                                            saldoDevedor = saldoDevedor - capital;
                                        }
                                %>
                            </tr>
                            <tr>
                                <td><%= (i + 1)%></td>
                                <td><%= formatar.format(parcela)%></td>
                                <td><%= formatar.format(amortizacao)%></td>
                                <td><%= formatar.format(capital * juros)%></td>
                                <td><%= formatar.format(saldoDevedor)%></td>
                            </tr>
                            <%}%>
                            <%}%>
                        </table>
                        <%} catch (Exception ex) { %>
                        <h3 style="color:red; text-align:center;"> Algo deu errado. Tente novamente!</h3>
                        <%}%>
                    </div>
                </div>
            </section>
        </div>
        <%@include file="WEB-INF/jspf/footer.jspf"%>
    </body>
</html>
