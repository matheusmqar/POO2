<%--
    Document   : amortizacao-constatante
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
        <title>Amortização Constante</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.5/css/bulma.min.css">
        <script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf"%>
        <div class="container">
            <section class="section">
                <div class="tile is-ancestor">
                    <div class="tile is-parent  has-background-primary">
                        <h1 class="title is-02 has-text-white">Amortização Constante</h1>
                    </div>
                </div>
                <div class="columns">
                  <div class="column">
                    <form>
                      <div class="field">
                          <label class="label">Valor Financiado (R$)</label>
                          <div class="control">
                              <input class="input" type="text" name="valor">
                          </div>
                      </div>
                      <div class="field">
                          <label class="label">Meses</label>
                          <div class="control">
                              <input class="input" type="text" name="meses">
                          </div>
                      </div>
                      <div class="field">
                          <label class="label">Juros (%)</label>
                          <div class="control">
                              <input class="input" type="text" name="juros">
                          </div>
                      </div>
                      <div class="control">
                          <input class="button is-primary" type="submit" value="Calcular" name="enviar">
                      </div>
                    </form>
                  </div>
                  <div class="column">
                      <%try { %>
                    <%
                        if (request.getParameter("valor") != null
                                & request.getParameter("meses") != null
                                & request.getParameter("juros") != null) {
                            double valor = Double.parseDouble(request.getParameter("valor"));
                            int meses = Integer.parseInt(request.getParameter("meses"));
                            double juros = Double.parseDouble(request.getParameter("juros")) / 100;
                            DecimalFormat formatar = new DecimalFormat("0.##");
                            double amortizacao = 0, prestacao = 0, valorjuros = 0;
                    %>

                    <br/>
                    <table  class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth">
                        <thead>
                          <tr>
                              <th>Mês</th>
                              <th>Prestação</th>
                              <th>Juros</th>
                              <th>Saldo devedor</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr><td>0</td><td> - </td><td> - </td><td>R$<%=formatar.format(valor)%></td></tr>
                          <%
                              amortizacao = valor / meses;
                              for (int i = 1; i <= meses; i++) {
                                  valorjuros = valor * juros;
                                  prestacao = amortizacao + valorjuros;
                                  valor = valor - amortizacao;
                          %>
                          <tr>
                              <td><%=i%></td>
                              <td>R$<%=formatar.format(prestacao)%></td>
                              <td>R$<%=formatar.format(valorjuros)%></td>
                              <td>R$<%=formatar.format(valor)%></td>
                          </tr>
                          <%
                              }
                          %>
                        </tbody>
                    </table>
                    <% } %>

                     <% } catch (Exception e) { %>
                       <h2 style="color:red; text-align:center;"> ERROR </h2> 
                    <%
                        }
                    %>
                  </div>
                </div>
            </section>
        </div>

        <%@include file="WEB-INF/jspf/footer.jspf"%>
    </body>
</html>
