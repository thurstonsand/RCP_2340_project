<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Seed Swap"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
        <g:javascript library="jquery"></g:javascript>
		<g:layoutHead/>
	    <div class="header" role="contentinfo"></div>

		<r:layoutResources />
	</head>
	<body>
	    <%-- Navigation --%>
		<g:if test="${session.user}">
            <div class="nav" role="navigation">
                <ul>
                    <li><a class="home" href="${createLink(uri: '/seed/list')}"><g:message code="default.home.label"/></a></li>
                    <li><g:link action="list" controller="seed">Seeds</g:link></li>
                    <li>
                        <g:form url='[controller: "Seed", action: "search"]' name="search">
                            <input name="search" id="search" value="${seed?.search}" size="10"/> <input type="submit" value="Search" />
                        </g:form>
                    </li>
                    <li style="float:right"><g:link controller="user" action="logout">Logout</g:link></li>
                    <li style="float:right"><g:link action="show" id="${session.user.id}" controller="farmer">My Profile</g:link></li>
                </ul>
            </div>
        </g:if>

		<div id="layoutBody">
		    <g:layoutBody/>
		</div>
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		<g:javascript library="application"/>
		<r:layoutResources />
	</body>
</html>