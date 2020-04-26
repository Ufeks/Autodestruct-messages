<%@ taglib prefix="button" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:include page="nav_template.jsp"/>

<br>
<div class="container">
    <div class="row">
        <div class="col-6 mx-auto">
            <div style="text-align: center;" class="alert alert-danger" role="alert">
                <h4>
                    <p>Oppps you entered wrong password.</p>
                    <p>Your message was destroyed.</p>
                    <p>Good luck next time</p>
                </h4>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer_template.jsp"/>
</html>
