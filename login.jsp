<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Portal do Cliente</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background-color: #f0f2f5;
        }
        .login-container {
            max-width: 400px;
            margin: 8% auto;
            padding: 2rem;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
        .login-header {
            text-align: center;
            margin-bottom: 1.5rem;
        }
        .login-header h2 {
            font-weight: 700;
            color: #0d6efd;
        }
        .login-header i {
            font-size: 3rem;
            color: #0d6efd;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="login-header">
            <i class="bi-shield-lock-fill"></i>
            <h2>Portal do Cliente</h2>
            <p class="text-muted">Acesse sua conta para gerenciar seus planos.</p>
        </div>

        <c:if test="${param.erro == 'true'}">
            <div class="alert alert-danger" role="alert">
                Usuário ou senha inválidos.
            </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/login" method="post">
            <div class="mb-3">
                <label for="user_login" class="form-label">Email</label>
                <input type="email" class="form-control" id="user_login" name="user_login" required>
            </div>
            <div class="mb-4">
                <label for="user_pw" class="form-label">Senha</label>
                <input type="password" class="form-control" id="user_pw" name="user_pw" required>
            </div>
            <div class="d-grid">
                <button type="submit" class="btn btn-primary">Entrar</button>
            </div>
        </form>
        <div class="text-center mt-4">
            <p class="text-muted">Ainda não tem uma conta? <a href="${pageContext.request.contextPath}/register.jsp">Cadastre-se</a></p>
        </div>
    </div>
</body>
</html>
