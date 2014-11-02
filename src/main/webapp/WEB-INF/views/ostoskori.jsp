<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet"
          href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
    <link href="<spring:url value="/css/hhpizza_basic.css" />"
          rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style type="text/css">
        .hh-shoppingcart {
            margin: 20px;
        }
    </style>
    <title>Pizzeria Il Grasso</title>
</head>
<body>
<div class="wrapper">
    <div class="header">
        <div class="jumbotron">
            <h1>Tervetuloa Il Grassoon</h1>

            <p>Pääsette nauttimaan paikkakunnan parhaista pizzoista aina
                edulliseen hintaan!</p>
        </div>
    </div>
    <div class="content">
        <div class="hh-shoppingcart">
            <c:choose>
                <c:when test="${ostoskori.count>0}">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Tuote</th>
                            <th>Kuvaus</th>
                            <th>Hinta</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${ostoskori.tuotteet}" var="tuote" varStatus="loop">
                            <tr>
                                <td>${loop.index+1}</td>
                                <td><a href="<spring:url value="/tuotteet/tuote?id=${tuote.id}" /> ">${tuote.name}</a>
                                </td>
                                <td>${tuote.description}</td>
                                <td><fmt:formatNumber value="${tuote.price}" type="currency"/></td>
                                <td>
                                    <a href="<spring:url value="/ostoskori/rem?id=${tuote.id}" /> "
                                       class="btn btn-warning">Poista</a>
                                </td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td colspan="2"></td>
                            <td colspan="2" align="right">Tuotteita yhteensä: ${ostoskori.count} <br/> Summa:
                                <fmt:formatNumber
                                        value="${ostoskori.sum}" type="currency"/></td>
                            <td><a href="<spring:url value="/tilaa" /> "
                                   class="btn btn-inverse">Tilaa</a></td>
                        </tr>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    Ostoskorissa ei ole tuotteita!
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    <!-- Tämä div työntää footerin pohjalle. Jättäkää tyhjäksi -->
    <div class="push"></div>
</div>
<div class="footer">
    <p>Tänne laitetaan footer osio</p>
</div>
</body>
</html>