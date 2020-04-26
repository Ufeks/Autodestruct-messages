<jsp:useBean id="message" scope="request" type="pl.prnote.model.Message"/>
<%@    taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:include page="nav_template.jsp"/>

<br>
<div class="container">
    <div class="row">
        <div class="col-6 mx-auto">
            <div class="alert alert-primary" role="alert">Twoja wiadomość została przeczytana : <br>
                ${message.destroyed}</div>
        </div>
    </div>
</div>
<jsp:include page="footer_template.jsp"/>
</html>
