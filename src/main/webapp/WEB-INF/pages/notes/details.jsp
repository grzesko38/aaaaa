<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="template" tagdir="/WEB-INF/tags/_templates/notes" %>
<%@ taglib prefix="banner" tagdir="/WEB-INF/tags/_templates"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="utils" tagdir="/WEB-INF/tags/utils"%>

<template:notesPage>
	<jsp:attribute name="additionalCSS">
		<link href="<c:url value="/themes/common/css/googlemap.css"/>" rel="stylesheet" type="text/css" />
	</jsp:attribute>

	<jsp:attribute name="additionalJS">
		<script	src="https://maps.googleapis.com/maps/api/js?libraries=places&sensor=false&v=3"></script>
		<script src="${pageContext.request.contextPath}/js/googlemaps.js"></script>
		<script src="${pageContext.request.contextPath}/js/notes/notedetails.js"></script>
	</jsp:attribute>
	
	<jsp:attribute name="banner">
		<banner:banner bannerClass="details" bannerImgPath="/themes/common/images/banners/oldpaper.png">
			<spring:message code="banner.header.note.view" />
		</banner:banner>
    </jsp:attribute>
	
	<jsp:body>
		<security:authorize ifAnyGranted="ROLE_ANONYMOUS">
			<div class="infoRow">
				<span class="weight600">
					<spring:message code="notes.details.label.author" />:
				</span>
				<div class="indent50">
					<c:out value="${note.author.nick}" />
				</div>
			</div>
		</security:authorize>
	
		<div class="infoRow">
			<span class="weight600">
				<spring:message code="notes.details.label.title" />:
			</span>
			<div class="indent50">
				<c:out value="${note.title}" />
			</div>
		</div>
		
		<div class="infoRow">
			<span class="weight600">
				<spring:message code="notes.details.label.content" />:
			</span>
			<div class="indent50">
				<c:out value="${note.content}" />
			</div>
		</div>
		
		<div class="infoRow">
			<span class="weight600">
				<spring:message code="notes.details.label.deadline" />:
			</span>
			<div class="indent50">
				<fmt:formatDate value="${note.deadline}" pattern="dd/MM/yyyy"/>
			</div>
		</div>
		
		<div class="infoRow">
			<span class="weight600">
				<spring:message code="notes.details.label.dateCreated" />:
			</span>
			<div class="indent50">
				<fmt:formatDate value="${note.dateCreated}" pattern="dd/MM/yyyy"/>
			</div>
		</div>
		
		<c:if test="${not empty note.lastModified}">
			<div class="infoRow">
				<span class="weight600">
					<spring:message code="notes.details.label.lastModified" />:
				</span>
				<div class="indent50">
					<fmt:formatDate value="${note.lastModified}" pattern="dd/MM/yyyy"/>
				</div>
			</div>
		</c:if>
		
		<c:if test="${note.availableOnMap}">
			<div class="infoRow">
				<span class="weight600">
					<spring:message code="notes.details.label.map" />:
				</span>
				<div id="latlng" class="frame" data-lat="${note.latitude}" data-lng="${note.longitude}">
					<utils:googlemap showPacInput="false"/>
				</div>
			</div>
		</c:if>
		
	</jsp:body>
</template:notesPage>