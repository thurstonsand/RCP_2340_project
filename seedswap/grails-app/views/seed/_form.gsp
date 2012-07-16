<%@ page import="seedswap.Seed" %>



<div class="fieldcontain ${hasErrors(bean: seedInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="seed.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${seedInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: seedInstance, field: 'scientificName', 'error')} required">
	<label for="scientificName">
		<g:message code="seed.scientificName.label" default="Scientific Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="scientificName" required="" value="${seedInstance?.scientificName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: seedInstance, field: 'hardiness', 'error')} required">
	<label for="hardiness">
		<g:message code="seed.hardiness.label" default="Hardiness" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="hardiness" max="7" min="0" required="" value="${seedInstance.hardiness}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: seedInstance, field: 'specialRequirements', 'error')} ">
	<label for="specialRequirements">
		<g:message code="seed.specialRequirements.label" default="Special Requirements" />
		
	</label>
	<g:textArea name="specialRequirements" cols="40" rows="5" value="${seedInstance?.specialRequirements}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: seedInstance, field: 'growingTips', 'error')} ">
	<label for="growingTips">
		<g:message code="seed.growingTips.label" default="Growing Tips" />
		
	</label>
	<g:textArea name="growingTips" cols="40" rows="5" value="${seedInstance?.growingTips}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: seedInstance, field: 'harvestingInfo', 'error')} ">
	<label for="harvestingInfo">
		<g:message code="seed.harvestingInfo.label" default="Harvesting Info" />
		
	</label>
	<g:textArea name="harvestingInfo" cols="40" rows="5" value="${seedInstance?.harvestingInfo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: seedInstance, field: 'growingSeason', 'error')} ">
	<label for="growingSeason">
		<g:message code="seed.growingSeason.label" default="Growing Season" />
		
	</label>
	<g:datePicker name="growingSeason" precision="day"  value="${seedInstance?.growingSeason}" default="none" noSelection="['': '']" />
</div>

<!--<div class="fieldcontain ${hasErrors(bean: seedInstance, field: 'farmer', 'error')} required">
	<label for="farmer">
		<g:message code="seed.farmer.label" default="Farmer" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="farmer" name="farmer.id" from="${seedswap.Farmer.list()}" optionKey="id" required="" value="${seedInstance?.farmer?.id}" class="many-to-one"/>
</div> -->
<g:hiddenField id="farmer" name="farmer.id" value="${seedInstance?.farmer?.id}"/>

