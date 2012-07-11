
<%@ page import="seedswap.Farmer" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'farmer.label', default: 'Farmer')}" />
		<title>${session.user.name}'s page /></title>
	</head>
	<body>
		<a href="#list-farmer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/farmer/list')}"><g:message code="default.home.label"/></a></li>
                <li><g:link action="show" id="${session.user.id}">${session.user.name}'s Bio</g:link></li>
            </ul>
		</div>
		<div id="list-farmer" class="content scaffold-list" role="main">
			<h1>All Farmers</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>

						<g:sortableColumn property="name" title="${message(code: 'farmer.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="climateZone" title="${message(code: 'farmer.climateZone.label', default: 'Climate Zone')}" />
					
						<g:sortableColumn property="address" title="${message(code: 'farmer.address.label', default: 'Address')}" />

                        <g:sortableColumn property="interests" title="${message(code: 'farmer.interests.label', default: 'Interests')}" />

                    </tr>
				</thead>
				<tbody>
				<g:each in="${farmerInstanceList}" status="i" var="farmerInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${farmerInstance.id}">${fieldValue(bean: farmerInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: farmerInstance, field: "climateZone")}</td>
					
						<td>${fieldValue(bean: farmerInstance, field: "address")}</td>

                        <td>${fieldValue(bean: farmerInstance, field: "interests")}</td>

					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${farmerInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
