<%@ tag description="Master Page template" body-content="scriptless" pageEncoding="UTF-8"%>
<%@ attribute name="additionalCSS" fragment="true" %>
<%@ attribute name="additionalJS" fragment="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ taglib prefix="fragment" tagdir="/WEB-INF/tags/_fragments" %>
<%@ taglib prefix="notes" tagdir="/WEB-INF/tags/notes" %>

<!DOCTYPE html>
<html>
<head>
	<title>Notes Manager</title>
	
	<link href="<c:url value="/themes/common/css/default.css"/>" rel="stylesheet" type="text/css"/>
	<link href="<c:url value="/themes/common/css/navigation.css"/>" rel="stylesheet" type="text/css"/>
	<link href="<c:url value="/themes/common/css/widgets.css"/>" rel="stylesheet" type="text/css"/>

	<link href="${pageContext.request.contextPath}/themes/<spring:theme code="css.main"/>" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/themes/<spring:theme code="css.navigation"/>" rel="stylesheet" type="text/css"/>
	<link href="${pageContext.request.contextPath}/themes/<spring:theme code="css.widgets"/>" rel="stylesheet" type="text/css"/>

	<jsp:invoke fragment="additionalCSS" />
	
	<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
	<script src="${pageContext.request.contextPath}/js/clock.js"></script>
	
	<jsp:invoke fragment="additionalJS" />
</head>
<body>
	<div id="placeholder"></div>
	<fragment:header />
	<jsp:doBody />
</body>
</html>

