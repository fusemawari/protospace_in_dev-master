$("#like-buttons").html("<%= escape_javascript(render partial: 'likes/like_links', locals: { prototype: @prototype, likes: @likes }) %>");
$("<%= @id_heart %>").addClass('.heart-empty');
$("<%= @id_heart %>").removeClass('.heart');
console.log(1)
