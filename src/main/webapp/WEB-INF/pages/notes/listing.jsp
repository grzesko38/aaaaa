<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="notes" tagdir="/WEB-INF/tags/notes" %>
<%@ taglib prefix="utils" tagdir="/WEB-INF/tags/utils" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/_templates/notes" %>

<template:notesPage>
	<jsp:attribute name="additionalCSS">
		 
	</jsp:attribute>

	<jsp:attribute name="additionalJS">
		<script src="${pageContext.request.contextPath}/js/notes/notesgrid.js"></script>
	</jsp:attribute>

    <jsp:attribute name="banner">
		<template:banner bannerClass="listing">
			<spring:message code="notes.listing.label.header" />
		</template:banner>
    </jsp:attribute>
    
    <jsp:body>
    	<utils:globalMessages />
		<notes:noteslisting />
    </jsp:body>
</template:notesPage>
