<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<jsp:include page="nav_template.jsp"/>
<form:form modelAttribute="message" method="POST">
    <br>
    <h3>Create message</h3><br>
    <form:textarea path="messageContent" id="messageContent" placeholder="Write your message here..."
                   cssClass="form-control" cssStyle="background-color: blanchedalmond" cols="50" rows="9"/>
    <form:errors path="messageContent"/><br>
    <div class="d-none" id="options">
        <h6><b>Password</b></h6>
        Enter a custom password to encrypt the message
        <form:input path="password" id="password" type="password" placeholder="Password" cssClass="form-control"/><br>
        <h6><b>Destruction notification</b></h6>
        E-mail to notify when message is destroyed <form:input path="email" id="email" placeholder="E-mail" type="email"
                                                               cssClass="form-control"/><br>
        <div class="form-check">
            <form:checkbox path="destructionAsk" class="form-check-input" id="checkbox"></form:checkbox>
            <label class="form-check-label" for="checkbox">
                Do not ask for confirmation before showing and destroying the message.
            </label>
        </div>
    </div>
    <input type="submit" value="Create message" class="btn btn-lg btn-primary btn-block btn-success"></input><br>
    <div>
        <div id="standard_buttons">
            <button type="button" class="btn btn-lg btn-primary mt-2"
                    onclick="$('#standard_buttons,#test,#options').toggleClass('d-none'); ">
                Show options
            </button>
        </div>
        <div class="d-none" id="test">
            <button type="button" class="btn btn-lg btn-primary mt-2"
                    onclick="$('#test,#standard_buttons,#options').toggleClass('d-none'); ">
                Hide options
            </button>
        </div>
    </div>
</form:form>

<jsp:include page="footer_template.jsp"/>


</html>