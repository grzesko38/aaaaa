<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="utils" uri="http://arczynskiadam.pl/jsp/tlds/utils" %>
<%@ taglib prefix="navigation" uri="http://arczynskiadam.pl/jsp/tlds/navigation" %>

<spring:theme code="theme.name" var="themeName"/>
<c:set var="isBlueTheme" value="${themeName eq 'blue'}" />
<c:set var="isRedTheme" value="${themeName eq 'red'}" />
<c:set var="isGreenTheme" value="${themeName eq 'green'}" />	
<c:set var="isYellowTheme" value="${themeName eq 'yellow'}" />

<!-- workaround for Eclipse validation bug -->
<c:set var="locale" value="${pageContext.response.locale}"/>
<!--end of workarround -->

<c:set var="isUKLocale" value="${locale eq 'en_EN'}" />
<c:set var="isDELocale" value="${locale eq 'de_DE'}" />
<c:set var="isPLLocale" value="${locale eq 'pl_PL'}" />
		
<div id="placeholder"></div>
<header class="top">
	<div class="topbar">
		<div class="dateholder">		
			<utils:date separator="/" />
		</div>
	</div>
	<div class="menu">
		<nav class="buttonsBar">
			<c:url value="/" var="themeUrl">
				<c:param name="theme" value="blue"/>
			</c:url>
			<a href="${themeUrl}">
				<span class="blue buttonBorder${isBlueTheme?" active":""}">
					<span class="blue themeholder${isBlueTheme?" active":""}"></span>
				</span>
			</a>
			
			<c:url value="/" var="themeUrl">
				<c:param name="theme" value="yellow"/>
			</c:url>
			<a href="${themeUrl}">
				<span class="yellow buttonBorder${isYellowTheme?" active":""}">
					<span class="yellow themeholder${isYellowTheme?" active":""}"></span>
				</span>
			</a>
			
			<c:url value="/" var="themeUrl">
				<c:param name="theme" value="green"/>
			</c:url>
			<a href="${themeUrl}">
				<span class="green buttonBorder${isGreenTheme?" active":""}">
					<span class="green themeholder${isGreenTheme?" active":""}"></span>
				</span>
			</a>
			
			<c:url value="/" var="themeUrl">
				<c:param name="theme" value="red"/>
			</c:url>
			<a href="${themeUrl}">
				<span class="red buttonBorder${isRedTheme?" active":""}">
					<span class="red themeholder${isRedTheme?" active":""}"></span>
				</span>
			</a>
		</nav>
		<nav class="buttonsBar">
			<a href="?lang=en_EN">
				<c:choose>
					<c:when test="${isUKLocale}">
						<span class="buttonBorder active">
							<span class="uk flagholder active"></span>
						</span>
					</c:when>
					<c:otherwise>
						<span class="buttonBorder">
							<span class="uk flagholder"></span>
						</span>
					</c:otherwise>
				</c:choose>
			</a>
			<a href="?lang=de_DE">
				<c:choose>
					<c:when test="${isDELocale}">
						<span class="buttonBorder active">
							<span class="de flagholder active"></span>
						</span>
					</c:when>
					<c:otherwise>
						<span class="buttonBorder">
							<span class="de flagholder"></span>
						</span>
					</c:otherwise>
				</c:choose>
			</a>
			<a href="?lang=pl_PL">
				<c:choose>
					<c:when test="${isPLLocale}">
						<span class="buttonBorder active">
							<span class="pl flagholder active"></span>
						</span>
					</c:when>
					<c:otherwise>
						<span class="buttonBorder">
							<span class="pl flagholder"></span>
						</span>
					</c:otherwise>
				</c:choose>
			</a>
		</nav>

	</div>
	<div class="clockHolder">
		<canvas class="clockBar" id="clock" width="75" height="75"></canvas>
	</div>
		<c:if test="${not empty navItems}">
		<div class="navbar">
			<div>
				<navigation:navBar navigationItems="${navItems}" />
			</div>
			<div class="navbar_corner">
				<img id="goimg" src="${pageContext.request.contextPath}/themes/<spring:theme code="img.nav.bar.corner"/>"
				width="33" height="37"/>
			</div>
		</div>
	</c:if>	
</header>

