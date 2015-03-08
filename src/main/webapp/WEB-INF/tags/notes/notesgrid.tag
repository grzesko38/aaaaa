<%@ taglib prefix="spring" 		uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form"   		uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"      		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 	   		uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="navigation"	uri="http://arczynskiadam.pl/jsp/tlds/navigation" %>
<%@ taglib prefix="utils" 		tagdir="/WEB-INF/tags/utils" %>

<script src="${pageContext.request.contextPath}/js/notes/notesgrid.js"></script>

<c:set var="asc"><spring:theme code="img.sort.asc"/></c:set>
<c:set var="desc"><spring:theme code="img.sort.desc"/></c:set>
<c:url var="ascImgUrl" value="/themes/${asc}"/>
<c:url var="descImgUrl" value="/themes/${desc}"/>

<c:set var="ascActive"><spring:theme code="img.sort.asc.active"/></c:set>
<c:set var="descActive"><spring:theme code="img.sort.desc.active"/></c:set>
<c:url var="ascActiveImgUrl" value="/themes/${ascActive}"/>
<c:url var="descActiveImgUrl" value="/themes/${descActive}"/>

<c:set var="sortCol" value="${notesPaginationData.sortCol}"/>
<c:set var="isSortAsc" value="${notesPaginationData.sortAscending}"/>

<c:if test="${(notesPaginationData.page.size gt 10 and fn:length(notesPaginationData.page.content) gt 10)
			or (notesPaginationData.page.size gt 10 and notesPaginationData.page.lastPage)}">
	<utils:pagination paginationData="${notesPaginationData}" linkCore="${linkCore}" />
</c:if>
<form:form id="notesGridForm" method="post" action="${pageContext.request.contextPath}/notesmanager/show" modelAttribute="selectedCheckboxesForm">
	<table class="data">
		<colgroup>
			<col class="narrowCheckbox" span="1"/>
			<col class="narrow" span="1"/>
		</colgroup>
		<thead>
			<tr>
				<th class="corner">
					<div class="checkbox">
						<input id="selectAll" class="chceckbox" type="checkbox">
						<label for="selectAll"></label>
					</div>
				</th>
				<th class="corner"/>
				<th>
					<navigation:sortHeader divClass="sort" sortColumn="author.nick" imgSize="16"
							ascImgUrl="${sortCol eq 'author.nick' && isSortAsc ? ascActiveImgUrl : ascImgUrl}"
							descImgUrl="${sortCol eq 'author.nick' && !isSortAsc ? descActiveImgUrl : descImgUrl}" >
						<span><spring:message code="notes.listing.label.author"/></span>
					</navigation:sortHeader>
				</th>
				<th>
					<navigation:sortHeader divClass="sort" sortColumn="dateCreated" imgSize="16"
							ascImgUrl="${sortCol eq 'dateCreated' && isSortAsc ? ascActiveImgUrl : ascImgUrl}"
							descImgUrl="${sortCol eq 'dateCreated' && !isSortAsc ? descActiveImgUrl : descImgUrl}" >
						<span><spring:message code="notes.listing.label.createdon"/></span>
					</navigation:sortHeader>
				</th>
				<th><spring:message code="notes.listing.label.actions"/></th>
			</tr>
		</thead>
		<tbody>	
			<c:forEach items="${notesPaginationData.page.content}" var="note" varStatus="loopStatus">
				<tr>
					<td class="left">
						<div class="checkbox">
							<form:checkbox path="selections" value="${note.id}" />
							<label for="selections${loopStatus.index + 1}"><spring:message text=""/></label>
						</div>
					</td>
					<td class="left"><spring:message text="${notesPaginationData.page.number * notesPaginationData.page.size + loopStatus.index + 1}."/></td>
					<td>${note.author.nick}</td>
					<td>${note.formattedDateCreated}</td>
					<td>
						<a href="${pageContext.request.contextPath}/notesmanager/details/${note.id}">[details]</a> |
						<a href="${pageContext.request.contextPath}/notesmanager/edit/${note.id}">[edit]</a> |
						<a href="${pageContext.request.contextPath}/notesmanager/delete/${note.id}">
							<span>[delete]</span>
						</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</form:form>
<utils:pagination paginationData="${notesPaginationData}" linkCore="${linkCore}" />