<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Formulário de Plano</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="header.jsp" />
    <div class="container">
        <h1>
            <c:if test="${not empty plano}">Editar Plano</c:if>
            <c:if test="${empty plano}">Cadastrar Novo Plano</c:if>
        </h1>

        <form action="${pageContext.request.contextPath}/plano/save" method="post" class="card p-3 mt-3">
            <input type="hidden" name="id" value="${plano.id}">

            <div class="mb-3">
                <label for="nome_plano" class="form-label">Nome do Plano</label>
                <input type="text" class="form-control" id="nome_plano" name="nome_plano" value="${plano.nomePlano}" required>
            </div>
            <div class="mb-3">
                <label for="velocidade_download_mbps" class="form-label">Velocidade de Download (Mbps)</label>
                <input type="number" class="form-control" id="velocidade_download_mbps" name="velocidade_download_mbps" value="${plano.velocidadeDownloadMbps}" required>
            </div>
            <div class="mb-3">
                <label for="velocidade_upload_mbps" class="form-label">Velocidade de Upload (Mbps)</label>
                <input type="number" class="form-control" id="velocidade_upload_mbps" name="velocidade_upload_mbps" value="${plano.velocidadeUploadMbps}" required>
            </div>
            <div class="mb-3">
                <label for="preco_mensal" class="form-label">Preço Mensal (R$)</label>
                <input type="number" step="0.01" class="form-control" id="preco_mensal" name="preco_mensal" value="${plano.precoMensal}" required>
            </div>
            <div class="mb-3">
                <label for="tipo_conexao" class="form-label">Tipo de Conexão</label>
                <select class="form-select" id="tipo_conexao" name="tipo_conexao" required>
                    <option value="Fibra" ${plano.tipoConexao == 'Fibra' ? 'selected' : ''}>Fibra</option>
                    <option value="Radio" ${plano.tipoConexao == 'Radio' ? 'selected' : ''}>Rádio</option>
                    <option value="Cabo" ${plano.tipoConexao == 'Cabo' ? 'selected' : ''}>Cabo</option>
                </select>
            </div>

            <button type="submit" class="btn btn-primary">Salvar</button>
        </form>
    </div>
</body>
</html>
