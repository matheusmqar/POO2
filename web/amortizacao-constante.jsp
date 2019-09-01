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
        

    
        
        
        
        
        <%@include file="WEB-INF/jspf/footer.jspf"%>
    </body>
</html>
