<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Formulário de Usuário</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="header.jsp" />
    <div class="container">
        <h1>
            <c:if test="${not empty usuario}">Editar Usuário</c:if>
            <c:if test="${empty usuario}">Cadastrar Novo Usuário</c:if>
        </h1>
        
        <form action="${pageContext.request.contextPath}/user/save" method="post" class="card p-3 mt-3">
            <input type="hidden" name="user_id" value="${usuario.id}">

            <div class="mb-3">
                <label for="user_name" class="form-label">Nome Completo</label>
                <input type="text" class="form-control" id="user_name" name="user_name" value="${usuario.name}" required>
            </div>

            <div class="mb-3">
                <label for="user_email" class="form-label">Email</label>
                <input type="email" class="form-control" id="user_email" name="user_email" value="${usuario.email}" required>
            </div>

            <div class="mb-3">
                <label for="user_gender" class="form-label">Sexo</label>
                <select class="form-select" id="user_gender" name="user_gender" required>
                    <option value="M" ${usuario.gender == 'M' ? 'selected' : ''}>Masculino</option>
                    <option value="F" ${usuario.gender == 'F' ? 'selected' : ''}>Feminino</option>
                </select>
            </div>

            <div class="mb-3">
                <label for="user_pw" class="form-label">Senha</label>
                <input type="password" class="form-control" id="user_pw" name="user_pw" placeholder="${not empty usuario ? 'Deixe em branco para não alterar' : ''}">
            </div>
            
            <button type="submit" class="btn btn-primary">Salvar</button>
        </form>
    </div>
</body>
</html>
