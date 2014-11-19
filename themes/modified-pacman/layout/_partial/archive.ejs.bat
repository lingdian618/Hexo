<%
var title = '';
var icon = '';
if (page.category){
  title = page.category;
  icon = 'category';
};
if (page.tag){
  title = page.tag;
  icon = 'tag';
};
if (page.archive){
  icon = 'archive';
  if (page.year) title = page.year+  (page.month ? '/' + page.month : '');
  else title = __('archive_a');
};
%>

<div class="archive-title" >
  <h2 class="<%= icon %>-icon"><%= title %></h2>
  <% if(page.archive){ %>
  <div class="archiveslist archive-float clearfix">
   <%- list_archives() %>
 </div>
  <% } %>
</div>
<div id="main" class="archive-part clearfix">
  <div id="archive-page">
<% page.posts.each(function(item){ %>
  <%- partial('_partial/article', {item: item, index: true,desc: false}) %>
<% }); %>
<% if (page.total > 1){ %>
  <nav id="page-nav" class="clearfix archive-nav">
    <%- paginator({
      prev_text: '&laquo; Prev',
      next_text: 'Next &raquo;'
    }) %>
  </nav>
<% } %>
  </div>
</div>
