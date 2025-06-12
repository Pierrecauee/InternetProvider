<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Nossos Planos</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="header.jsp" />
    <div class="container">
        <%-- Título simplificado, já que a página é a mesma para todos --%>
        <h1 class="mb-3">Nossos Planos</h1>
        
        <p>Confira abaixo os planos de internet que oferecemos. Para contratar, entre em contato com nosso suporte.</p>
        
        <table class="table table-striped table-hover">
            <thead class="table-dark">
                <tr>
                    <th>Nome</th>
                    <th>Download (Mbps)</th>
                    <th>Upload (Mbps)</th>
                    <th>Preço Mensal</th>
                    <th>Tipo</th>
                    <%-- A coluna "Ações" foi removida --%>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="plano" items="${planos}">
                    <tr>
                        <td>${plano.nomePlano}</td>
                        <td>${plano.velocidadeDownloadMbps}</td>
                        <td>${plano.velocidadeUploadMbps}</td>
                        <td><fmt:formatNumber value="${plano.precoMensal}" type="currency" currencySymbol="R$ "/></td>
                        <td>${plano.tipoConexao}</td>
                        <%-- Os botões de ação foram removidos --%>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
