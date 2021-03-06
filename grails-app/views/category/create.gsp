<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="adminpanel">
	<g:set var="entityName" value="${message(code: 'category.label', default: 'Category')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>
<a href="#create-category" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav-grails">
	<ul>
		<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
	</ul>
</div>
<div id="create-category" class="content scaffold-create" role="main">
	<h4><g:message code="default.create.label" args="[entityName]" /></h4>
	<g:if test="${flash.message}">
		<div class="message" role="status">${flash.message}</div>
	</g:if>
	<g:hasErrors bean="${categoryInstance}">
		<ul class="errors" role="alert">
			<g:eachError bean="${categoryInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
			</g:eachError>
		</ul>
	</g:hasErrors>
	<g:form url="[resource:categoryInstance, action:'save']" >
		<fieldset class="form">
			<g:render template="form"/>
		</fieldset>
		<fieldset class="buttons">
			<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
		</fieldset>
	</g:form>
</div>
</body>
</html>
