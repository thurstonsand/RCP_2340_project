<%@ page import="seedswap.Farmer" %>



<div class="fieldcontain ${hasErrors(bean: farmerInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="farmer.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${farmerInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: farmerInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="farmer.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${farmerInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: farmerInstance, field: 'climateZone', 'error')} required">
	<label for="climateZone">
		<g:message code="farmer.climateZone.label" default="Climate Zone" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="climateZone" required="" value="${farmerInstance.climateZone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: farmerInstance, field: 'address', 'error')} ">
	<label for="address">
		<g:message code="farmer.address.label" default="Address" />
		
	</label>
	<g:textArea name="address" cols="40" rows="5" value="${farmerInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: farmerInstance, field: 'interests', 'error')} ">
	<label for="interests">
		<g:message code="farmer.interests.label" default="Interests" />
		
	</label>
	<g:textArea name="interests" cols="40" rows="5" value="${farmerInstance?.interests}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: farmerInstance, field: 'seeds', 'error')} ">
	<label for="seeds">
		<g:message code="farmer.seeds.label" default="Seeds" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${farmerInstance?.seeds?}" var="s">
    <li><g:link controller="seed" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="seed" action="create" params="['farmer.id': farmerInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'seed.label', default: 'Seed')])}</g:link>
</li>
</ul>

</div>

