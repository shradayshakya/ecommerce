
<%@ page import="dwitphase3.UserOrder" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="adminpanel">
		<g:set var="entityName" value="${message(code: 'userOrder.label', default: 'UserOrder')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-userOrder" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

		<div id="list-userOrder" class="content scaffold-list" role="main">
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>

						<g:sortableColumn property="email" title="${message(code: 'userOrder.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="fname" title="${message(code: 'userOrder.fname.label', default: 'Fname')}" />
					
						<g:sortableColumn property="lname" title="${message(code: 'userOrder.lname.label', default: 'Lname')}" />
					
						<g:sortableColumn property="phone" title="${message(code: 'userOrder.phone.label', default: 'Phone')}" />

						<g:sortableColumn property="product" title="${message(code: 'userOrder.product.label', default: 'Product')}" />

						<g:sortableColumn property="quantity" title="${message(code: 'userOrder.quantity.label', default: 'Quantity')}" />

					</tr>
				</thead>
				<tbody>
				<g:each in="${userOrderInstanceList}" status="i" var="userOrderInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					

						<td><g:link action="show" id="${userOrderInstance.id}">${fieldValue(bean: userOrderInstance, field: "email")}</g:link></td>
					
						<td>${fieldValue(bean: userOrderInstance, field: "fname")}</td>
					
						<td>${fieldValue(bean: userOrderInstance, field: "lname")}</td>
					
						<td>${fieldValue(bean: userOrderInstance, field: "phone")}</td>

						<td><g:link controller="product" action="show" id="${userOrderInstance?.product?.id}">${userOrderInstance?.product?.name}</g:link></td>

						<td>${fieldValue(bean: userOrderInstance, field: "quantity")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${userOrderInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
