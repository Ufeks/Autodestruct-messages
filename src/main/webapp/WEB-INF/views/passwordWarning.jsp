<%@ taglib prefix="button" uri="http://www.springframework.org/tags/form" %>
<jsp:useBean id="message" scope="request" type="pl.prnote.model.Message"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:include page="nav_template.jsp"/>

<br>
<div class="container">
    <div class="row">
        <div class="col-6 mx-auto">
            <div class="alert alert-warning" role="alert">
                <h4> Read and destroy? </h4>
                You're about to read and destroy the message with link /${message.link}.
                <br>
                You will be asked for the password to read the message. If you don't have it, ask the person who sent
                you the message for it, before proceeding.
            </div>
            <div class="d-flex">

                <a class="btn btn-lg btn-success mt-3 mr-auto" href="http://localhost:8080/${message.link}/password">Read
                    message</a>
                <a class="btn btn-lg btn-info mt-3 ml-auto" href="http://localhost:8080/">Not now</a>
            </div>

        </div>
    </div>
</div>
<jsp:include page="footer_template.jsp"/>
</html>
