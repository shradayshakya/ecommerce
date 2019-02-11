
<%@ page import="dwitphase3.UserOrder" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="adminpanel">
		<g:set var="entityName" value="${message(code: 'userOrder.label', default: 'UserOrder')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-userOrder" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav-grails" role="navigation">
			<ul>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-userOrder" class="content scaffold-show" role="main">

			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list userOrder">

				<g:if test="${userOrderInstance?.email}">
					<li class="fieldcontain">
						<span id="email-label" class="property-label"><g:message code="userOrder.email.label" default="Email" /></span>

						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${userOrderInstance}" field="email"/></span>

					</li>
				</g:if>

				<g:if test="${userOrderInstance?.fname}">
					<li class="fieldcontain">
						<span id="fname-label" class="property-label">First name</span>

						<span class="property-value" aria-labelledby="fname-label"><g:fieldValue bean="${userOrderInstance}" field="fname"/></span>

					</li>
				</g:if>

				<g:if test="${userOrderInstance?.lname}">
					<li class="fieldcontain">
						<span id="lname-label" class="property-label">Last name</span>

						<span class="property-value" aria-labelledby="lname-label"><g:fieldValue bean="${userOrderInstance}" field="lname"/></span>

					</li>
				</g:if>

				<g:if test="${userOrderInstance?.phone}">
					<li class="fieldcontain">
						<span id="phone-label" class="property-label"><g:message code="userOrder.phone.label" default="Phone" /></span>

						<span class="property-value" aria-labelledby="phone-label"><g:fieldValue bean="${userOrderInstance}" field="phone"/></span>

					</li>
				</g:if>


				<g:if test="${userOrderInstance?.product}">
					<li class="fieldcontain">
						<span id="product-label" class="property-label"><g:message code="userOrder.product.label" default="Product" /></span>

						<span class="property-value" aria-labelledby="product-label"><g:link controller="product" action="show" id="${userOrderInstance?.product?.id}">${userOrderInstance?.product?.name}</g:link></span>

					</li>
				</g:if>

				<g:if test="${userOrderInstance?.quantity}">
					<li class="fieldcontain">
						<span id="quantity-label" class="property-label"><g:message code="userOrder.quantity.label" default="Quantity" /></span>

						<span class="property-value" aria-labelledby="quantity-label"><g:fieldValue bean="${userOrderInstance}" field="quantity"/></span>

					</li>
				</g:if>
				<g:set var="qty" value="${fieldValue(bean: userOrderInstance, field: "quantity")}"/>
				<li class="fieldcontain">
					<span id="total-label" class="property-label">Total</span>

					<span class="property-value" aria-labelledby="total-label">${qty.toInteger() * userOrderInstance?.product?.price}</span>

				</li>

				<g:if test="${userOrderInstance?.country}">
					<li class="fieldcontain">
						<span id="country-label" class="property-label"><g:message code="userOrder.country.label" default="Country" /></span>

						<span class="property-value" aria-labelledby="country-label"><g:fieldValue bean="${userOrderInstance}" field="country"/></span>

					</li>
				</g:if>


				<g:if test="${userOrderInstance?.province}">
					<li class="fieldcontain">
						<span id="province-label" class="property-label"><g:message code="userOrder.province.label" default="Province" /></span>

						<span class="property-value" aria-labelledby="province-label"><g:fieldValue bean="${userOrderInstance}" field="province"/></span>

					</li>
				</g:if>
			
				<g:if test="${userOrderInstance?.city}">
				<li class="fieldcontain">
					<span id="city-label" class="property-label"><g:message code="userOrder.city.label" default="City" /></span>
					
						<span class="property-value" aria-labelledby="city-label"><g:fieldValue bean="${userOrderInstance}" field="city"/></span>
					
				</li>
				</g:if>

				<g:if test="${userOrderInstance?.zipcode}">
					<li class="fieldcontain">
						<span id="zipcode-label" class="property-label"><g:message code="userOrder.zipcode.label" default="Zipcode" /></span>

						<span class="property-value" aria-labelledby="zipcode-label"><g:fieldValue bean="${userOrderInstance}" field="zipcode"/></span>

					</li>
				</g:if>

			</ol>
			<g:form url="[resource:userOrderInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<i class="fa fa-check-circle"></i><g:link action="confirmOrder" resource="${userOrderInstance}">Confirm</g:link>
					<g:actionSubmit class="delete" action="delete" value="Decline" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
