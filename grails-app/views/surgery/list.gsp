
<%@ page import="gabinet.Surgery" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'surgery.label', default: 'Surgery')}" />
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
							<g:sortableColumn property="date" title="${message(code: 'surgery.date.label', default: 'Date')}" />
                        
                            <g:sortableColumn property="recommendation" title="${message(code: 'surgery.recommendation.label', default: 'Recommendation')}" />
                        
                            <g:sortableColumn property="skin" title="${message(code: 'surgery.skin.label', default: 'Skin')}" />
                        
                            <g:sortableColumn property="surgery" title="${message(code: 'surgery.surgery.label', default: 'Surgery')}" />
                        
                            <g:sortableColumn property="therapy" title="${message(code: 'surgery.therapy.label', default: 'Therapy')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${surgeryInstanceList}" status="i" var="surgeryInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:formatDate format="yyyy-MM-dd" date="${surgeryInstance.date}" /></td>
                        
                            <td>${fieldValue(bean: surgeryInstance, field: "recommendation")}</td>
                        
                            <td>${fieldValue(bean: surgeryInstance, field: "skin")}</td>
                        
                            <td><g:link action="show" id="${surgeryInstance.id}">${fieldValue(bean: surgeryInstance, field: "surgery")}</g:link></td>
                        
                            <td>${fieldValue(bean: surgeryInstance, field: "therapy")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${surgeryInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
