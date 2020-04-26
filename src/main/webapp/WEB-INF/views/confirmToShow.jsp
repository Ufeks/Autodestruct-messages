<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<jsp:include page="nav_template.jsp"/>

<br>
<div class="container">
    <div class="row">
        <div class="col-6 mx-auto">
            <div class="alert alert-warning" role="alert">Read and destroy?<br>
                You're about to read and destroy the note with link : ${message.link}</div>
            <a class="btn btn-lg btn-primary btn-success mt-3 mr-auto" href="http://localhost:8080/${message.link}/@">Read
                message</a>
            <a class="btn btn-lg btn-primary btn-error mt-3 ml-auto" href="http://localhost:8080/">Not now</a>
        </div>
    </div>
</div>
<jsp:include page="footer_template.jsp"/>
</html>
