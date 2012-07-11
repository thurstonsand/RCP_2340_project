
<%@ page import="seedswap.Seed" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'seed.label', default: 'Seed')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-seed" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-seed" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'seed.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="scientificName" title="${message(code: 'seed.scientificName.label', default: 'Scientific Name')}" />
					
						<g:sortableColumn property="hardiness" title="${message(code: 'seed.hardiness.label', default: 'Hardiness')}" />
					
						<g:sortableColumn property="specialRequirements" title="${message(code: 'seed.specialRequirements.label', default: 'Special Requirements')}" />
					
						<g:sortableColumn property="growingTips" title="${message(code: 'seed.growingTips.label', default: 'Growing Tips')}" />
					
						<g:sortableColumn property="harvestingInfo" title="${message(code: 'seed.harvestingInfo.label', default: 'Harvesting Info')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${seedInstanceList}" status="i" var="seedInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${seedInstance.id}">${fieldValue(bean: seedInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: seedInstance, field: "scientificName")}</td>
					
						<td>${fieldValue(bean: seedInstance, field: "hardiness")}</td>
					
						<td>${fieldValue(bean: seedInstance, field: "specialRequirements")}</td>
					
						<td>${fieldValue(bean: seedInstance, field: "growingTips")}</td>
					
						<td>${fieldValue(bean: seedInstance, field: "harvestingInfo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${seedInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
