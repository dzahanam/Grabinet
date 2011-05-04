
<%@ page import="gabinet.Client" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'client.label', default: 'Client')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'client.id.label', default: 'Id')}" />
                        
                            <th><g:message code="client.address.label" default="Address" /></th>
                        
                            <g:sortableColumn property="allergy" title="${message(code: 'client.allergy.label', default: 'Allergy')}" />
                        
                            <g:sortableColumn property="birthDate" title="${message(code: 'client.birthDate.label', default: 'Birth Date')}" />
                        
                            <g:sortableColumn property="cellPhone" title="${message(code: 'client.cellPhone.label', default: 'Cell Phone')}" />
                        
                            <g:sortableColumn property="comment" title="${message(code: 'client.comment.label', default: 'Comment')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${clientInstanceList}" status="i" var="clientInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${clientInstance.id}">${fieldValue(bean: clientInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: clientInstance, field: "address.city")}, ${fieldValue(bean: clientInstance, field: "address.postalCode")}, ${fieldValue(bean: clientInstance, field: "address.street")}</td>
                        
                            <td>${fieldValue(bean: clientInstance, field: "allergy")}</td>
                        
                            <td><g:formatDate date="${clientInstance.birthDate}" /></td>
                        
                            <td>${fieldValue(bean: clientInstance, field: "cellPhone")}</td>
                        
                            <td>${fieldValue(bean: clientInstance, field: "comment")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${clientInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
