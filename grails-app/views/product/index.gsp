
<%@ page import="dwitphase3.Product" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="adminpanel">
	<g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<a href="#list-product" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav-grails">
	<ul>
		<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
	</ul>
</div>
<div id="list-product" class="content scaffold-list" role="main">
	<h4><g:message code="default.list.label" args="[entityName]" /></h4>
	<g:if test="${flash.message}">
		<div class="message" role="status">${flash.message}</div>
	</g:if>
	<table>
		<thead>
		<tr>
			<g:sortableColumn property="name" title="${message(code: 'product.name.label', default: 'Name')}" />
					
			<g:sortableColumn property="price" title="${message(code: 'product.price.label', default: 'Price')}" />
					
			<g:sortableColumn property="stock" title="${message(code: 'product.stock.label', default: 'Stock')}" />
					
			<g:sortableColumn property="discount" title="${message(code: 'product.discount.label', default: 'Discount')}" />
					
			<g:sortableColumn property="description" title="${message(code: 'product.description.label', default: 'Description')}" />
					
			<g:sortableColumn property="image" title="${message(code: 'product.image.label', default: 'Image')}" />
					
		</tr>
		</thead>
		<tbody>
		<g:each in="${productInstanceList}" status="i" var="productInstance">
			<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
				<td><g:link action="show" id="${productInstance.id}">${fieldValue(bean: productInstance, field: "name")}</g:link></td>
					
				<td>${fieldValue(bean: productInstance, field: "price")}</td>
					
				<td>${fieldValue(bean: productInstance, field: "stock")}</td>
					
				<td>${fieldValue(bean: productInstance, field: "discount")}</td>
					
				<td>${fieldValue(bean: productInstance, field: "description")}</td>
					
				<td>${fieldValue(bean: productInstance, field: "image")}</td>
					
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<g:paginate total="${productInstanceCount ?: 0}" />
	</div>

</div>
</div>
</body>
</html>
