<table id="test">
    <thead>
        <tr>
            <th>Email</th>
            <th>Status</th>
        </tr>
    </thead>
    <tbody>
        <g:each in="${userList}" status="i" var="user">
          <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
            <td>
              <g:remoteLink action="unlock" params="[id:user.id]" update="test">${user.email?.encodeAsHTML()}</g:remoteLink>
            </td>
            <td>
                ${user.locked? 'Locked' : 'Not Locked'}
            </td>
          </tr>
        </g:each>
    </tbody>
</table>
