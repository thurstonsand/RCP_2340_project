               <!-- This is the html framework for our login page. It handles formatting and
               association of text input with the corresponding fields in the Farmer class.-->
                <html>
                    <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                    <meta name="layout" content="main" />
                    <title>User Login</title>
                    <g:javascript library="jquery"></g:javascript>
                    </head>
                    <body>
                        <div class="body" id="userContainer">
                            <g:form action="doLogin" method="post" controller="user">
                            <g:renderErrors bean="${user}" />
                                <div class="dialog">
                                    <p>Enter your login details below:</p>
                                    <table class="userForm">
                                        <tr class='prop'>
                                            <td valign='top' style='text-align:left;' width='20%'>
                                                <label for='email'>Email:</label>
                                            </td>
                                            <td valign='top' style='text-align:left;' width='80%'>
                                                <input id="email" type='text' name='email' value='${user?.email}' />
                                             </td>
                                        </tr>

                                        <tr class='prop'>
                                            <td valign='top' style='text-align:left;' width='20%'>
                                                <label for='password'>Password:</label>
                                            </td>
                                            <td valign='top' style='text-align:left;' width='80%'>
                                                <input id="password" type='password' name='password'
                                                    value='${user?.password}' />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="buttons">
                                    <span class="formButton">
                                        <input type="submit" value="Login"></input>
                                    </span>
                                    <p>Don't have an account?
                                        <g:remoteLink action="signup" controller="user" update="userContainer">Sign up now!</g:remoteLink>
                                    </p>
                                </div>
                            </g:form>
                        </div>
                    </body>
                </html>