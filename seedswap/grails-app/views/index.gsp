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
                        <!--login.gsp should load here on page load-->
                        <g:include view="/user/login.gsp" />
                        </div>
                    </body>
                </html>