<%@ page import="java.util.*" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Пустая страница</title>
</head>
<body>
<h1>Просто пустая страница</h1>
<table border="1">
    <tr>
        <th>Header Name</th><th>Header Value(s)</th>
    </tr>
    <%
        Enumeration headerNames = request.getHeaderNames();
        while(headerNames.hasMoreElements()) {
            String paramName = (String)headerNames.nextElement();
            out.print("<tr><td>" + paramName + "</td>\n");
            String paramValue = request.getHeader(paramName);
            out.println("<td> " + paramValue + "</td></tr>\n");
        }
    %>
</table>

<h2>Request headers</h2>
<dl>
    <c:forEach items="${headerValues}" var="entry">
        <dt><c:out value="${entry.key}" /></dt>
        <dd>
            <c:forEach items="${entry.value}" var="headerValue" varStatus="loop">
                <c:out value="${headerValue}" />${not loop.last ? ', ' : ''}
            </c:forEach>
        </dd>
    </c:forEach>
</dl>

<h2>Request params</h2>
<dl>
    <c:forEach items="${paramValues}" var="entry">
        <dt><c:out value="${entry.key}" /></dt>
        <dd>
            <c:forEach items="${entry.value}" var="paramValue" varStatus="loop">
                <c:out value="${paramValue}" />${not loop.last ? ', ' : ''}
            </c:forEach>
        </dd>
    </c:forEach>
</dl>

<h2>Request scope</h2>
<dl>
    <c:forEach items="${requestScope}" var="entry">
        <dt><c:out value="${entry.key}" /></dt>
        <dd><c:out value="${entry.value}" /></dd>
    </c:forEach>
</dl>

<h2>Session scope</h2>
<dl>
    <c:forEach items="${sessionScope}" var="entry">
        <dt><c:out value="${entry.key}" /></dt>
        <dd><c:out value="${entry.value}" /></dd>
    </c:forEach>
</dl>

<%--<h2>Application scope</h2>--%>
<%--<dl>--%>
    <%--<c:forEach items="${applicationScope}" var="entry">--%>
        <%--<dt><c:out value="${entry.key}" /></dt>--%>
        <%--<dd><c:out value="${entry.value}" /></dd>--%>
    <%--</c:forEach>--%>
<%--</dl>--%>

</body>
</html>
