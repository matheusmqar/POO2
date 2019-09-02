<%-- 
    Document   : amortizacao-americana
    Created on : Sep 1, 2019, 4:32:36 PM
    Author     : gabrielprieto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amortização Americana</title>
    </head>
    <body style="background-color:black; color:white; center">
        <%@include file="WEB-INF/jspf/header.jspf"%>
        <h1 style="color:white; text-align:center;">Sistema de Amortização Americana</h1>
        <%@include file="WEB-INF/jspf/footer.jspf"%>
        <form>
                Capital (R$) <input type="text" name="capital"/> <br>
                Meses <input type="text" name="meses"/> <br>
                Taxa de Juros (%) <input type="text" name="juros"/> <br>
                <input type ="submit" value="Calcular" name="calculo"/> <br>
        </form>
        <%try{ %>
            <%if(request.getParameter("calculo")!= null){%>
            <%  double capital = Double.parseDouble(request.getParameter("capital"));
                int meses = Integer.parseInt(request.getParameter("meses"));
                double taxaJuros = Double.parseDouble(request.getParameter("juros")); 
                double jurosTotal;
                double amortizacaoTotal;
                taxaJuros = taxaJuros/100;%>
                
                <table align="center" border="5">
                    <tr>
                        <th> Saldo </th>
                        <th> Mês   </th>
                        <th> Juros </th>
                        <th> Prestação </th>
                    </tr>
                    <%jurosTotal = taxaJuros * capital;%>
                   <% for (int i=1;i<=meses;i++){ %>
                    <tr>
                        <td> <%=capital%> </td>
                        <td> <%=i%> </td>
                        <td> <%=jurosTotal%> </td>
                        <td> <%=jurosTotal%> </td>
                    </tr>
                 <%  }%>
                 <%jurosTotal = jurosTotal*meses;%>
                 <% amortizacaoTotal = capital+jurosTotal;%>
                 <h1> Total = <%=amortizacaoTotal%> </h1>
                </table>
               
            <%}%>
        <% } catch(Exception ex) { %>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <h3 style="color:red; text-align:center;"> Algo deu errado. Tente novamente!</h3>
            <%}%>
    </body>
</html>