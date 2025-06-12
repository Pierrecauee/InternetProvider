<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Portal do Cliente - VelozNet</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/bootstrap-icons.css" rel="stylesheet">
    <style>
        .feature-icon-small {
            font-size: 2rem;
            color: var(--bs-primary);
        }
        .card-link {
            text-decoration: none;
            color: inherit;
        }
        .card-link .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.12);
            transition: all 0.2s ease-in-out;
        }
    </style>
</head>
<body>
    <jsp:include page="header.jsp" />

    <div class="container my-5">
        <div class="p-5 text-center bg-body-tertiary rounded-3">
            <i class="bi-speedometer2" style="font-size: 3rem; color: var(--bs-primary);"></i>
            <h1 class="text-body-emphasis">Seu Painel de Controle</h1>
            <p class="col-lg-8 mx-auto fs-5 text-muted">
              Gerencie suas assinaturas, planos e faturas de forma rápida e centralizada.
            </p>
        </div>

        <div class="row g-4 py-5 row-cols-1 row-cols-lg-3">
          <div class="feature col">
            <a href="${pageContext.request.contextPath}/planos" class="card-link">
              <div class="card h-100 text-center p-3">
                <div class="feature-icon-small d-inline-flex align-items-center justify-content-center bg-primary bg-gradient text-white fs-2 mb-3 rounded-circle mx-auto" style="width: 3rem; height: 3rem;">
                  <i class="bi-journal-text"></i>
                </div>
                <h3 class="fs-2 text-body-emphasis">Nossos Planos</h3>
                <p>Consulte todos os planos de internet que oferecemos.</p>
              </div>
            </a>
          </div>
          <div class="feature col">
            <a href="${pageContext.request.contextPath}/assinaturas" class="card-link">
              <div class="card h-100 text-center p-3">
                <div class="feature-icon-small d-inline-flex align-items-center justify-content-center bg-primary bg-gradient text-white fs-2 mb-3 rounded-circle mx-auto" style="width: 3rem; height: 3rem;">
                  <i class="bi-person-check-fill"></i>
                </div>
                <h3 class="fs-2 text-body-emphasis">Minhas Assinaturas</h3>
                <p>Veja os detalhes dos seus planos contratados e gerencie-os.</p>
              </div>
            </a>
          </div>
          <div class="feature col">
            <a href="${pageContext.request.contextPath}/faturas" class="card-link">
              <div class="card h-100 text-center p-3">
                <div class="feature-icon-small d-inline-flex align-items-center justify-content-center bg-primary bg-gradient text-white fs-2 mb-3 rounded-circle mx-auto" style="width: 3rem; height: 3rem;">
                  <i class="bi-receipt-cutoff"></i>
                </div>
                <h3 class="fs-2 text-body-emphasis">Minhas Faturas</h3>
                <p>Acompanhe e administre suas faturas de cobrança.</p>
              </div>
            </a>
          </div>
        </div>
    </div>
</body>
</html>
