
<%@ page import="seedswap.Seed" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'seed.label', default: 'Seed')}" />
		<title>created ${seedInstance.name}</title>
	</head>
	<body>
		<a href="#show-seed" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/farmer/list')}"><g:message code="default.home.label"/></a></li>
                <g:if test="${session.user.id==seedInstance.farmer.id}">
				    <li><g:link class="show" action="show" controller="farmer" id="${session.user.id}">back to Bio</g:link></li>
                </g:if>
			</ul>
		</div>
		<div id="show-seed" class="content scaffold-show" role="main">
			<h1>${seedInstance.farmer.name}'s seed: ${seedInstance.name}</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list seed">
			
				<g:if test="${seedInstance?.scientificName}">
				<li class="fieldcontain">
					<span id="scientificName-label" class="property-label"><g:message code="seed.scientificName.label" default="Scientific Name" /></span>
					
						<span class="property-value" aria-labelledby="scientificName-label"><g:fieldValue bean="${seedInstance}" field="scientificName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${seedInstance?.hardiness}">
				<li class="fieldcontain">
					<span id="hardiness-label" class="property-label"><g:message code="seed.hardiness.label" default="Hardiness" /></span>
					
						<span class="property-value" aria-labelledby="hardiness-label"><g:fieldValue bean="${seedInstance}" field="hardiness"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${seedInstance?.specialRequirements}">
				<li class="fieldcontain">
					<span id="specialRequirements-label" class="property-label"><g:message code="seed.specialRequirements.label" default="Special Requirements" /></span>
					
						<span class="property-value" aria-labelledby="specialRequirements-label"><g:fieldValue bean="${seedInstance}" field="specialRequirements"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${seedInstance?.growingTips}">
				<li class="fieldcontain">
					<span id="growingTips-label" class="property-label"><g:message code="seed.growingTips.label" default="Growing Tips" /></span>
					
						<span class="property-value" aria-labelledby="growingTips-label"><g:fieldValue bean="${seedInstance}" field="growingTips"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${seedInstance?.harvestingInfo}">
				<li class="fieldcontain">
					<span id="harvestingInfo-label" class="property-label"><g:message code="seed.harvestingInfo.label" default="Harvesting Info" /></span>
					
						<span class="property-value" aria-labelledby="harvestingInfo-label"><g:fieldValue bean="${seedInstance}" field="harvestingInfo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${seedInstance?.growingSeason}">
				<li class="fieldcontain">
					<span id="growingSeason-label" class="property-label"><g:message code="seed.growingSeason.label" default="Growing Season" /></span>
					
						<span class="property-value" aria-labelledby="growingSeason-label"><g:formatDate date="${seedInstance?.growingSeason}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${seedInstance?.id}" />
                    <g:if test="${session.user.id==seedInstance.farmer.id}">
					    <g:link class="edit" action="edit" id="${seedInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
    					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    </g:if>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
