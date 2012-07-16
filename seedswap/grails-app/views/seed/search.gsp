<table>
    <thead>
        <tr>
            <th>${message(code: 'seed.name.label', default: 'Name')}</th>
            <th>${message(code: 'seed.scientificName.label', default: 'Scientific Name')}</th>
            <th>${message(code: 'seed.hardiness.label', default: 'Hardiness')}</th>
        </tr>
    </thead>
    <g:each in="${searchResultList}" status="i" var="search">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
            <td><g:link action="show">${fieldValue(bean: search, field: "name")}</g:link></td>
            <td>${fieldValue(bean: search, field: "scientificName")}</td>
            <td>${fieldValue(bean: search, field: "hardiness")}</td>
        </tr>
    </g:each>
        <g:if test="${searchResultList.size() == 0}">
            <tr><td colspan=7 class="not-available">No results available for search term</td></tr>
        </g:if>
</table>