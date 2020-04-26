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
                    <input style="width: 100%; background-color: blanchedalmond" class="d-block" type="text" id="link"
                           readonly
                           value="http://localhost:8080/${message.link}"/>
                    <div class="d-flex">
                        <button class="btn btn-lg btn-primary mt-3 md-5 " onclick="$('#link').select();">Select link
                        </button>
                        <a class="btn btn-lg btn-light mt-3 ml-3 md-5"
                           href="mailto:?body=http://localhost:8080/${message.link}">Send link by mail</a>
                        <a class="btn btn-lg  btn-warning mt-3 ml-auto md-5"
                           href="http://localhost:8080/${message.link}">Read
                            message</a>
                    </div>
                    <br>
                    <div>Password to message:
                        <div><br>
                            <input type="hidden" id="pass" readonly
                                   value="${message.password}"/>
                            <input style="width: 100%; background-color: lightgray" id="visible_pass" class="d-block"
                                   type="text"
                                   readonly
                                   value="******************"/>
                            <div id="standard_buttons">
                                <button class="btn btn-lg btn-dark mt-3"
                                        onclick="$('#visible_pass').val($('#pass').val()); $('#hiden_buttons,#standard_buttons').toggleClass('d-none'); ">
                                    Show
                                    password
                                </button>
                            </div>
                            <div class="d-none" id="hiden_buttons">
                                <button class="btn btn-lg btn-dark mt-3"
                                        onclick="$('#visible_pass').val('******************'); $('#hiden_buttons,#standard_buttons').toggleClass('d-none'); ">
                                    Hide
                                    password
                                </button>
                                <button class="btn btn-lg btn-primary mt-3 ml-3 "
                                        onclick="$('#visible_pass').select();">Select
                                    password
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="footer_template.jsp"/>
</html>
