<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Alterar Status da Fatura</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="header.jsp" />
    <div class="container">
        <h1>Alterar Status da Fatura</h1>
        <form action="${pageContext.request.contextPath}/fatura/save" method="post" class="card p-3 mt-3">
            <input type="hidden" name="id" value="${fatura.id}">
            
            <div class="mb-3">
                <label class="form-label">Cliente</label>
                <input type="text" class="form-control" value="${fatura.assinatura.usuario.name}" disabled readonly>
            </div>
            
             <div class="mb-3">
                <label class="form-label">Plano Contratado</label>
                <input type="text" class="form-control" value="${fatura.assinatura.plano.nomePlano}" disabled readonly>
            </div>
            
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label class="form-label">Valor</label>
                    <input type="text" class="form-control" value="<fmt:formatNumber value='${fatura.valor}' type='currency' currencySymbol='R$ '/>" disabled readonly>
                </div>
                <div class="col-md-6 mb-3">
                    <label class="form-label">Vencimento</label>
                    <input type="text" class="form-control" value="<fmt:formatDate value='${fatura.dataVencimento}' pattern='dd/MM/yyyy'/>" disabled readonly>
                </div>
            </div>

            <div class="mb-3">
                <label for="status" class="form-label">Status da Fatura</label>
                <select class="form-select" id="status" name="status" required>
                    <option value="PENDENTE" ${fatura.status == 'PENDENTE' ? 'selected' : ''}>Pendente</option>
                    <option value="PAGA" ${fatura.status == 'PAGA' ? 'selected' : ''}>Paga</option>
                    <option value="ATRASADA" ${fatura.status == 'ATRASADA' ? 'selected' : ''}>Atrasada</option>
                </select>
            </div>

            <div class="mb-3">
                <label for="data_pagamento" class="form-label">Data do Pagamento (deixe em branco se não estiver paga)</label>
                <fmt:formatDate value="${fatura.dataPagamento}" pattern="yyyy-MM-dd" var="dataPagamentoFmt"/>
                <input type="date" class="form-control" id="data_pagamento" name="data_pagamento" value="${dataPagamentoFmt}">
            </div>

            <button type="submit" class="btn btn-primary">Salvar Alterações</button>
            <a href="${pageContext.request.contextPath}/faturas" class="btn btn-secondary ms-2">Cancelar</a>
        </form>
    </div>
</body>
</html>
