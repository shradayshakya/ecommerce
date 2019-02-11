
<%@ page import="dwitphase3.Product" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="adminpanel">
	<g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
<a href="#show-product" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav-grails">
	<ul>
		<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
		<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
	</ul>
</div>
<div id="show-product" class="content scaffold-show" role="main">
	<h4><g:message code="default.show.label" args="[entityName]" /></h4>
	<g:if test="${flash.message}">
		<div class="message" role="status">${flash.message}</div>
	</g:if>
	<ol class="property-list product">
			
		<g:if test="${productInstance?.name}">
			<li class="fieldcontain">
				<span id="name-label" class="property-label"><g:message code="product.name.label" default="Name" /></span>
					
				<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${productInstance}" field="name"/></span>
					
			</li>
		</g:if>
			
		<g:if test="${productInstance?.price}">
			<li class="fieldcontain">
				<span id="price-label" class="property-label"><g:message code="product.price.label" default="Price" /></span>
					
				<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${productInstance}" field="price"/></span>
					
			</li>
		</g:if>
			
		<g:if test="${productInstance?.stock}">
			<li class="fieldcontain">
				<span id="stock-label" class="property-label"><g:message code="product.stock.label" default="Stock" /></span>
					
				<span class="property-value" aria-labelledby="stock-label"><g:fieldValue bean="${productInstance}" field="stock"/></span>
					
			</li>
		</g:if>
			
		<g:if test="${productInstance?.discount}">
			<li class="fieldcontain">
				<span id="discount-label" class="property-label"><g:message code="product.discount.label" default="Discount" /></span>
					
				<span class="property-value" aria-labelledby="discount-label"><g:fieldValue bean="${productInstance}" field="discount"/></span>
					
			</li>
		</g:if>
			
		<g:if test="${productInstance?.description}">
			<li class="fieldcontain">
				<span id="description-label" class="property-label"><g:message code="product.description.label" default="Description" /></span>
					
				<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${productInstance}" field="description"/></span>
					
			</li>
		</g:if>
			
		<g:if test="${productInstance?.image}">
			<li class="fieldcontain">
				<span id="image-label" class="property-label"><g:message code="product.image.label" default="Image" /></span>
					
				<span class="property-value" aria-labelledby="image-label">
					<img src="${resource(file: "product/images/"+productInstance.image)}" width="150" height="150" alt="Grails"/>
				</span>
					
			</li>
		</g:if>
			
		<g:if test="${productInstance?.category}">
			<li class="fieldcontain">
				<span id="category-label" class="property-label"><g:message code="product.category.label" default="Category" /></span>
					
				<span class="property-value" aria-labelledby="category-label"><g:link controller="category" action="show" id="${productInstance?.category?.id}">${productInstance?.category?.encodeAsHTML()}</g:link></span>
					
			</li>
		</g:if>
			
	</ol>
	<g:form url="[resource:productInstance, action:'delete']" method="DELETE">
		<fieldset class="buttons">
			<g:link class="edit" action="edit" resource="${productInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
			<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
		</fieldset>
	</g:form>
</div>
</body>
</html>
