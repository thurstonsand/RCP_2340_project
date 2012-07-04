<g:formRemote name="login" update="userContainer" url="[controller:'user', action:'doLogin']">
    <g:renderErrors bean="${cmd}" />
    <p>${msg}</p>
        <div class="dialog">
            <p>Enter your login details below:</p>
            <table>
                <tr class='prop'>
                    <td valign='top' style='text-align:left;' width='20%'>
                        <label for='email'>Email:</label>
                    </td>
                    <td valign='top' style='text-align:left;' width='80%'>
                        <g:textField name="email"/>
                     </td>
                </tr>

                <tr class='prop'>
                    <td valign='top' style='text-align:left;' width='20%'>
                        <label for='password'>Password:</label>
                    </td>
                    <td valign='top' style='text-align:left;' width='80%'>
                        <g:passwordField name="password"/>
                    </td>
                </tr>
            </table>
        </div>
        <div class="buttons">
            <span class="formButton">
                <input type="submit" value="Login"></input>
            <p>Don't have an account?
                <g:remoteLink action="signup" controller="user" update="userContainer">Sign up now!</g:remoteLink>
            </p>
            </span>
        </div>
</g:formRemote>
</div>
