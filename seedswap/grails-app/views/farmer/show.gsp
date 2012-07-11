
<%@ page import="seedswap.Farmer" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'farmer.label', default: 'Farmer')}" />
		<title><g:fieldValue bean="${farmerInstance}" field="name"/>'s page</title>
	</head>
	<body>
		<a href="#show-farmer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/farmer/list')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="show-farmer" class="content scaffold-show" role="main">
			<h1><g:fieldValue bean="${farmerInstance}" field="name"/></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list farmer">
			
				<g:if test="${farmerInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="farmer.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${farmerInstance}" field="email"/></span>
					
				</li>
				</g:if>

				<g:if test="${farmerInstance?.climateZone}">
				<li class="fieldcontain">
					<span id="climateZone-label" class="property-label"><g:message code="farmer.climateZone.label" default="Climate Zone" /></span>
					
						<span class="property-value" aria-labelledby="climateZone-label"><g:fieldValue bean="${farmerInstance}" field="climateZone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${farmerInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="farmer.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${farmerInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${farmerInstance?.interests}">
				<li class="fieldcontain">
					<span id="interests-label" class="property-label"><g:message code="farmer.interests.label" default="Interests" /></span>
					
						<span class="property-value" aria-labelledby="interests-label"><g:fieldValue bean="${farmerInstance}" field="interests"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${farmerInstance?.seeds}">
				<li class="fieldcontain">
					<span id="seeds-label" class="property-label"><g:message code="farmer.seeds.label" default="Seeds" /></span>
					
						<g:each in="${farmerInstance.seeds}" var="s">
						<span class="property-value" aria-labelledby="seeds-label"><g:link controller="seed" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${farmerInstance?.id}" />
                    <g:if test="${session.user.id==farmerInstance.id}">
					    <g:link class="edit" action="edit" id="${farmerInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    </g:if>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
