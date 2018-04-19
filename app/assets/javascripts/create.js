$("#like-buttons").html("<%= escape_javascript(render partial: 'likes/like_links', locals: { prototype: @prototype, likes: @likes, like: @like}) %>")
$("<%= @id_heart %>").removeClass('.heart-empty');
$("<%= @id_heart %>").addClass('.heart');
console.log(this)
