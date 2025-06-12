<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Minhas Faturas</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="header.jsp" />
    <div class="container">
        <h1 class="mb-4">Minhas Faturas</h1>
        
        <div class="list-group">
            <c:forEach var="fatura" items="${faturas}">
                <div class="list-group-item list-group-item-action d-flex justify-content-between align-items-center">
                    <div class="d-flex align-items-center">
                        <%-- Ícone muda de acordo com o status --%>
                        <c:choose>
                            <c:when test="${fatura.status == 'PAGA'}">
                                <i class="bi-check-circle-fill fs-2 text-success me-3"></i>
                            </c:when>
                            <c:when test="${fatura.status == 'ATRASADA'}">
                                <i class="bi-exclamation-triangle-fill fs-2 text-danger me-3"></i>
                            </c:when>
                            <c:otherwise>
                                <i class="bi-clock-history fs-2 text-primary me-3"></i>
                            </c:otherwise>
                        </c:choose>

                        <div>
                            <h5 class="mb-1">Fatura com vencimento em <fmt:formatDate value="${fatura.dataVencimento}" pattern="dd/MM/yyyy"/></h5>
                            <p class="mb-1">
                                Plano: ${fatura.assinatura.plano.nomePlano} - 
                                Valor: <fmt:formatNumber value="${fatura.valor}" type="currency" currencySymbol="R$ "/>
                            </p>
                        </div>
                    </div>
                    
                    <%-- Badge de Status com cores --%>
                    <h4>
                        <c:choose>
                            <c:when test="${fatura.status == 'PAGA'}">
                                <span class="badge bg-success">PAGA</span>
                            </c:when>
                            <c:when test="${fatura.status == 'ATRASADA'}">
                                <span class="badge bg-danger">ATRASADA</span>
                            </c:when>
                            <c:otherwise>
                                <span class="badge bg-primary">PENDENTE</span>
                            </c:otherwise>
                        </c:choose>
                    </h4>
                </div>
            </c:forEach>
        </div>
        
        <c:if test="${empty faturas}">
            <div class="alert alert-info mt-4">
                Você ainda não possui nenhuma fatura.
            </div>
        </c:if>
    </div>
</body>
</html>
