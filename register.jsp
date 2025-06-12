<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro - Portal do Cliente</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background-color: #f0f2f5;
        }
        .register-container {
            max-width: 500px;
            margin: 5% auto;
            padding: 2rem;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
        .register-header {
            text-align: center;
            margin-bottom: 1.5rem;
        }
        .register-header h2 {
            font-weight: 700;
            color: #0d6efd;
        }
    </style>
</head>
<body>
    <div class="register-container">
        <div class="register-header">
            <h2>Crie sua Conta</h2>
            <p class="text-muted">É rápido e fácil.</p>
        </div>

        <form action="${pageContext.request.contextPath}/register" method="post">
            <div class="mb-3">
                <label for="user_name" class="form-label">Nome Completo</label>
                <input type="text" class="form-control" id="user_name" name="user_name" required>
            </div>
            <div class="mb-3">
                <label for="user_email" class="form-label">Email</label>
                <input type="email" class="form-control" id="user_email" name="user_email" required>
            </div>
            <div class="mb-3">
                <label for="user_gender" class="form-label">Sexo</label>
                <select class="form-select" id="user_gender" name="user_gender">
                    <option value="M">Masculino</option>
                    <option value="F">Feminino</option>
                </select>
            </div>
            <div class="mb-3">
                <label for="user_pw" class="form-label">Senha</label>
                <input type="password" class="form-control" id="user_pw" name="user_pw" required>
            </div>
            <div class="d-grid">
                <button type="submit" class="btn btn-success">Cadastrar</button>
            </div>
        </form>
        <div class="text-center mt-3">
            <a href="${pageContext.request.contextPath}/login.jsp">Já tem uma conta? Faça login</a>
        </div>
    </div>
</body>
</html>