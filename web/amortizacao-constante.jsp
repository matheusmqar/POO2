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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amortização Constante</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf"%>
        <h1>Amortização Constante</h1>
        
        <form>
        
        <label for="valor"><b>Valor Financiado</b></label>
        <input id="valor" type="text" name="valor"/>
        
        <label for="meses"><b>Meses</b></label>
        <input id="meses" type="text" name="meses"/>
        
         <label for="juros"><b>Juros</b></label>
         <input id="juros" type="text" name="juros"/>
         
        <input type="submit" name="enviar" value="Gerar Amortização" class="btn"/>
        
        </form>
        
        <%  
            if (request.getParameter("valor") != null & 
                        request.getParameter("meses") != null & 
                            request.getParameter("juros") != null) {
            double valor = Double.parseDouble(request.getParameter("valor"));
            int meses = Integer.parseInt(request.getParameter("meses"));
            double juros = Double.parseDouble(request.getParameter("juros")) / 100;
            DecimalFormat formatar = new DecimalFormat("0.##");
            double amortizacao = 0, prestacao = 0, valorjuros = 0;
    %>
    
    <br/>
    <table border="1" style="margin-left: 35%" class="table">
            <tr>
                <th>Prestação</th><th>Juros</th><th>Saldo devedor</th>
            </tr>

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
        
        </table>
        
          <%
        }
           %> 
        <%@include file="WEB-INF/jspf/footer.jspf"%>
    </body>
</html>
