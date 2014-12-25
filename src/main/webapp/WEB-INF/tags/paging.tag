<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="form"   	uri="http://www.springframework.org/tags/form" %>
<%@ attribute name="paginationData" required="true" type="pl.arczynskiadam.web.controller.note.NotesPagesData" %>
<%@ attribute name="linkCore" required="true" type="java.lang.String" %>

<div class="paginationRow">
	<div class="margin"></div>
	<div class="center">
		<div class="paginationHolder">
			<c:if test="${!paginationData.page.firstPage}">
				<c:url value="${linkCore}" var="pagedLink">
					<c:param name="p" value="${paginationData.page.number - 1}"/>
				</c:url>
				<a href="${pagedLink}">
					<span class="pagingItem">&lt;</span>
				</a>
			</c:if>
			<c:if test="${paginationData.firstLinkedPage > 0}">
				<c:url value="${linkCore}" var="pagedLink">
					<c:param name="p" value="0"/>
				</c:url>
				<a href="${pagedLink}">
					<span class="pagingItem">1</span>
				</a>
			</c:if>
			<c:if test="${paginationData.firstLinkedPage > 1}">
				<span class="pagingDots">...</span>
			</c:if>
			<c:forEach begin="${paginationData.firstLinkedPage}" end="${paginationData.lastLinkedPage}" var="i">
				<c:choose>
					<c:when test="${paginationData.page.number == i}">
						<span class="pagingItem active">${i + 1}</span>
					</c:when>
					<c:otherwise>
						<c:url value="${linkCore}" var="pagedLink">
							<c:param name="p" value="${i}"/>
						</c:url>
						<a href="${pagedLink}">
							<span class="pagingItem">${i + 1}</span>
						</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${paginationData.lastLinkedPage < paginationData.page.totalPages - 2}">
				<span class="pagingDots">...</span>
			</c:if>
			<c:if test="${paginationData.lastLinkedPage < paginationData.page.totalPages - 1}">
				<c:url value="${linkCore}" var="pagedLink">
					<c:param name="p" value="${paginationData.page.totalPages - 1}"/>
				</c:url>
				<a href="${pagedLink}">
					<span class="pagingItem">${paginationData.page.totalPages}</span>
				</a>
			</c:if>
			<c:if test="${!paginationData.page.lastPage}">
				<c:url value="${linkCore}" var="pagedLink">
					<c:param name="p" value="${paginationData.page.number + 1}"/>
				</c:url>
				<a href="${pagedLink}">
					<span class="pagingItem">&gt;</span>
				</a>
			</c:if>
		</div>
	</div>
	<div class="margin">
		<form:form id="" class="entriesPerPageForm" commandName="entriesPerPageForm" method="GET">
			<form:select class="entriesPerPage" path="size" items="${entriesPerPageForm.pageSizes}" itemLabel="name" itemValue="value" multiple="false"/>
		</form:form>
	</div>
</div>