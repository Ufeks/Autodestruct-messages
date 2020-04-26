<%@ taglib prefix="button" uri="http://www.springframework.org/tags/form" %>
<jsp:useBean id="message" scope="request" type="pl.prnote.model.Message"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:include page="nav_template.jsp"/>


<br>
<div class="container">
    <div class="row">
        <div class="col-6 mx-auto">
            <div>Link to message:
                <div><br>
                    <input style="width: 100%; background-color: blanchedalmond" class="d-block" type="text" readonly
                           value="http://localhost:8080/${message.link}"/>
                    <div class="d-flex">
                        <button class="btn btn-lg btn-primary mt-3" onclick="$('input').select();">Select link</button>
                        <a class="btn btn-lg btn-light mt-3 ml-3"
                           href="mailto:?body=http://localhost:8080/${message.link}">Send link by mail</a>
                        <a class="btn btn-lg btn-primary btn-warning mt-3 ml-auto"
                           href="http://localhost:8080/${message.link}">Read
                            message</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<jsp:include page="footer_template.jsp"/>
</html>
