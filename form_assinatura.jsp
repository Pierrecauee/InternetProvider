<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Formulário de Assinatura</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="header.jsp" />
    <div class="container">
        <h1>
            <c:if test="${not empty assinatura}">Editar Assinatura</c:if>
            <c:if test="${empty assinatura}">Nova Assinatura</c:if>
        </h1>

        <form action="${pageContext.request.contextPath}/assinatura/save" method="post" class="card p-3 mt-3">
            <input type="hidden" name="id" value="${assinatura.id}">

            <!-- MUDANÇA: O campo de seleção de cliente foi removido. -->
            <!-- Agora, mostramos o nome do cliente logado e enviamos o ID dele de forma oculta. -->
            <div class="mb-3">
                <label class="form-label">Cliente</label>
                <input type="text" class="form-control" value="${sessionScope.usuario_logado.name}" disabled readonly>
            </div>

            <div class="mb-3">
                <label for="plano_id" class="form-label">Plano</label>
                <select class="form-select" id="plano_id" name="plano_id" required>
                    <option value="">-- Selecione um plano --</option>
                    <c:forEach var="plano" items="${planos}">
                        <option value="${plano.id}" ${assinatura.plano.id == plano.id ? 'selected' : ''}>${plano.nomePlano} (${plano.velocidadeDownloadMbps} Mbps)</option>
                    </c:forEach>
                </select>
            </div>

            <div class="mb-3">
                <label for="data_assinatura" class="form-label">Data da Assinatura</label>
                <fmt:formatDate value="${assinatura.dataAssinatura}" pattern="yyyy-MM-dd" var="dataAssinaturaFmt"/>
                <input type="date" class="form-control" id="data_assinatura" name="data_assinatura" value="${dataAssinaturaFmt}" required>
            </div>

            <div class="mb-3">
                <label for="endereco_instalacao" class="form-label">Endereço de Instalação</label>
                <textarea class="form-control" id="endereco_instalacao" name="endereco_instalacao" required>${assinatura.enderecoInstalacao}</textarea>
            </div>

            <div class="mb-3">
                <label for="status" class="form-label">Status</label>
                <select class="form-select" id="status" name="status" required>
                    <option value="ATIVA" ${assinatura.status == 'ATIVA' ? 'selected' : ''}>Ativa</option>
                    <option value="CANCELADA" ${assinatura.status == 'CANCELADA' ? 'selected' : ''}>Cancelada</option>
                    <option value="SUSPENSA" ${assinatura.status == 'SUSPENSA' ? 'selected' : ''}>Suspensa</option>
                </select>
            </div>

            <button type="submit" class="btn btn-primary">Salvar</button>
        </form>
    </div>
</body>
</html>
