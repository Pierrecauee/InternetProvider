<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Minhas Assinaturas</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="header.jsp" />
    <div class="container">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h1>Minhas Assinaturas</h1>
            <a href="${pageContext.request.contextPath}/assinatura/form" class="btn btn-primary">
                <i class="bi-plus-circle-fill me-2"></i>Contratar Novo Plano
            </a>
        </div>
        
        <div class="row g-4">
            <c:forEach var="assinatura" items="${assinaturas}">
                <div class="col-md-6">
                    <div class="card h-100">
                        <div class="card-header d-flex justify-content-between">
                            <strong>Plano: ${assinatura.plano.nomePlano}</strong>
                            <c:choose>
                                <c:when test="${assinatura.status == 'ATIVA'}">
                                    <span class="badge bg-success">ATIVA</span>
                                </c:when>
                                <c:when test="${assinatura.status == 'CANCELADA'}">
                                    <span class="badge bg-danger">CANCELADA</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge bg-warning">SUSPENSA</span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">${assinatura.plano.velocidadeDownloadMbps} Mbps de Download</h5>
                            <p class="card-text">
                                <strong>Endereço:</strong> ${assinatura.enderecoInstalacao}<br>
                                <strong>Data do Contrato:</strong> <fmt:formatDate value="${assinatura.dataAssinatura}" pattern="dd/MM/yyyy"/>
                            </p>
                        </div>
                        <div class="card-footer text-end">
                            <c:if test="${assinatura.status == 'ATIVA'}">
                                <a href="${pageContext.request.contextPath}/assinatura/cancel?id=${assinatura.id}" class="btn btn-outline-danger btn-sm" onclick="return confirm('Tem certeza que deseja cancelar esta assinatura?');">
                                    Cancelar Assinatura
                                </a>
                            </c:if>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        
        <c:if test="${empty assinaturas}">
            <div class="alert alert-info mt-4">
                Você ainda não possui nenhuma assinatura ativa.
            </div>
        </c:if>
    </div>
</body>
</html>
