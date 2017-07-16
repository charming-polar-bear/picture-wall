<div class="col-md-4">
  <%= link_to p do %>
    <%= image_tag p.picture %>
  <% end %>

  <%= render 'common/post_user', post_user: p.user %>

  <%= p.description %><br>
  <div>
    <i class="fa fa-heart" aria-hidden="true"><%= p.likers.count %></i>
    <i class="fa fa-comment-o" aria-hidden="true"><%= p.comments.count %></i>
  </div>
</div>

<% end %>
