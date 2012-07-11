<%@ page import="seedswap.Farmer" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'farmer.label', default: 'Farmer')}" />
		<title>Edit your information</title>
	</head>
	<body>
		<a href="#edit-farmer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/farmer/list')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="edit-farmer" class="content scaffold-edit" role="main">
			<h1>Edit your information</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${farmerInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${farmerInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post" >
				<g:hiddenField name="id" value="${farmerInstance?.id}" />
				<g:hiddenField name="version" value="${farmerInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
