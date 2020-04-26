<jsp:useBean id="message" scope="request" type="pl.prnote.model.Message"/>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:include page="nav_template.jsp"/>
<script>$(document).ready(function () {
    $.get("http://localhost:8080/${message.link}/d");
})</script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
<br>
<div class="container">
    <div class="row">
        <div class="col-6 mx-auto">
            <h2>Message content:</h2>
            <div class="alert alert-warning alert-dismissible fade show" role="alert">
                <b>This message was destroyed.</b> <br>
                If you need to keep it, copy it before closing this window.
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <textarea style="width: 100%; background-color: blanchedalmond" cols="50" rows="9" class="d-block"
                      cssClass="form-control"
                      id="message" type="text"
                      readonly
            >${message.messageContent}</textarea>
            <div class="d-flex">
                <button class="btn btn-lg btn-primary mt-3" onclick="$('#message').select();">Select text</button>
            </div>
        </div>
    </div>
</div>

<jsp:include page="footer_template.jsp"/>
</html>

