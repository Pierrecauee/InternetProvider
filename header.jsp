<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-4">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">
            <i class="bi-wifi"></i> Provedor VelozNet
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/">Início</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/planos">Ver Planos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/assinaturas">Minhas Assinaturas</a>
                </li>
                 <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/faturas">Minhas Faturas</a>
                </li>
            </ul>
            <c:if test="${not empty sessionScope.usuario_logado}">
                <span class="navbar-text me-3">
                    Olá, ${sessionScope.usuario_logado.name}
                </span>
                <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-light">Sair</a>
            </c:if>
        </div>
    </div>
</nav>
