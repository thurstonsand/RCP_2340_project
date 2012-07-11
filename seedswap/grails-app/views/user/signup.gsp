<g:formRemote name="signup" update="userContainer" url="[controller:'user', action:'register']">
    <g:renderErrors bean="${user}" />
    <div class="dialog">
        <p>Enter the following information to set up an account:</p>
        <table>
            <tr class='prop'>
                <td valign='top' style='text-align:left;' width='20%'>
                    <label for='name'>Name:</label>
                </td>
                <td valign='top' style='text-align:left;' width='80%'>
                    <input id="name" type='text' name='name' value='${user?.name}' />
                 </td>
            </tr>
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
                    <input id="password" type='password' name='password' value='${user?.password}' />
                </td>
            </tr>
        </table>
    </div>
    </div>
    <div class="buttons">
        <span class="formButton">
            <input type="submit" value="Sign up"></input>
                <input type="reset">
                <br>Already have an account?
                <g:remoteLink action="login" controller="user" update="userContainer">Login Here</g:remoteLink>
            </span>
    </div>
</g:formRemote>