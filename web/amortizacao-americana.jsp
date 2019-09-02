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
                            <label class="label">Capital (R$) </label>
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
                    <%if (request.getParameter("calculo") != null) {%>
                    <%  double capital = Double.parseDouble(request.getParameter("capital"));
                        int meses = Integer.parseInt(request.getParameter("meses"));
                        double taxaJuros = Double.parseDouble(request.getParameter("juros"));
                        double jurosTotal;
                        double amortizacaoTotal;
                        taxaJuros = taxaJuros / 100;
                        DecimalFormat formatar = new DecimalFormat("0.##");
                    %>

                    <table class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth">
                        <thead>
                            <tr>
                                <th> Mês   </th>
                                <th> Juros </th>
                                <th> Prestação </th>
                                <th> Saldo </th>
                            </tr>
                        </thead>
                        <%jurosTotal = taxaJuros * capital;%>
                        <% for (int i = 1; i <= meses; i++) {%>
                        <tbody>
                            <tr>
                                <td> <%=i%> </td>
                                <td> <%=jurosTotal%> </td>
                                <td> <%=jurosTotal%> </td>
                                <td>R$<%=formatar.format(capital)%> </td>
                            </tr>
                        </tbody>
                        <%  }%>
                        <%jurosTotal = jurosTotal * meses;%>
                        <% amortizacaoTotal = capital + jurosTotal;%>
                    </table>
                    <h1 class="title is-4"> Total = R$ <%=amortizacaoTotal%> </h1>

                    <%}%>
                    <% } catch (Exception ex) { %>
                    <h3 style="color:red; text-align:center;"> Algo deu errado. Tente novamente!</h3>
                    <%}%>
                  </div>
                </div>
            </section>
        </div>
        <%@include file="WEB-INF/jspf/footer.jspf"%>
    </body>
</html>
