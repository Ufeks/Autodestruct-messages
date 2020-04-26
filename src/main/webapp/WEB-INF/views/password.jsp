<%@ taglib prefix="button" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="message" scope="request" type="pl.prnote.model.Message"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:include page="nav_template.jsp"/>

<br>
<div class="container">
    <div class="row">
        <div class="col-6 mx-auto">
            <div class="alert alert-info" role="alert">
                You're about to read and destroy the message with link /${message.link}.<br>
                Please enter the password to read the message.
            </div>
            <form:form action="/${message.link}/password" method="post">
                <div class="form-group">
                    <label for="password">Enter Password</label>
                    <input class="form-control" id="password" name="password" type="password">
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form:form>
        </div>
    </div>
</div>
<jsp:include page="footer_template.jsp"/>
</html>
