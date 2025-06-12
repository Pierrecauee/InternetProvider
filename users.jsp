<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gerenciamento de Usuários</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="header.jsp" />
    <div class="container">
        <h1 class="mb-3">Gerenciamento de Usuários</h1>
        <p><a href="${pageContext.request.contextPath}/form_user.jsp" class="btn btn-success"><i class="bi-plus-circle"></i> Novo Usuário</a></p>
        
        <table class="table table-striped table-hover">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Email</th>
                    <th>Sexo</th>
                    <th>Ações</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="usuario" items="${usuarios}">
                    <tr>
                        <td>${usuario.id}</td>
                        <td>${usuario.name}</td>
                        <td>${usuario.email}</td>
                        <td>${usuario.gender == 'M' ? 'Masculino' : 'Feminino'}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/user/update?userId=${usuario.id}" class="btn btn-warning btn-sm"><i class="bi-pencil"></i></a>
                            <a href="${pageContext.request.contextPath}/user/delete?userId=${usuario.id}" class="btn btn-danger btn-sm" onclick="return confirm('Deseja realmente excluir este usuário?');"><i class="bi-trash"></i></a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
