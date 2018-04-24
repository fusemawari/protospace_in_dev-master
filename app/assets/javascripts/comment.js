$(function(){
function buildHtml(comment){

    var comments = `<div class="media" data-id="${comment.id}">
                      <div class="media-left">
                        <a href="/users/${comment.url}">
                          <img style="width: 64px; height: 64px;" class="media-object" "alt: "profile_photo"
                          src=${comment.avatar}>
                        </a>
                      </div>
                      <div class="media-body">
                        <h4 class="media-heading" id="top-aligned-media" data-id="${comment.id}">
                          ${comment.name}
                          <a class="anchorjs-link" href="#top-aligned-media">
                            <span class="anchorjs-icon" ></span>
                          </a>
                          <p>${comment.content}</p>
                        </h4>
                      </div>
                        <a data-confirm="削除しますか？" class='comment-remove comment-user__btn comment-user__btn--remove js-remove-btn' >削除</a>
                        <a class='comment-edit comment-user__btn comment-user__btn--edit data-toggle="modal" data-target="#basicModal"js-edit-btn'>編集</a>
                    </div>`
    return comments;
}



  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    console.log(this)
    var formData = new FormData(this);
    var url = window.location.href + '/comments'


    $.ajax({
      url: url,
      data: formData,
      type: 'POST',
      datatype: 'json',
      processData: false,
      contentType: false
    })

    .done(function(data){
      console.log(1)
      var html =buildHtml(data);
      $('#comment_list').append(html)
      $('.num').html(`(${data.count})`)
      $('#textbox').val('')
    })
    .fail(function(){
    alert('error');
    })
  });

  $(document).on('click', '.comment-user__btn--remove',function(){
    $(this).parent().remove();
  });

  $(document).on('click', '.comment-user__btn--edit',function(){
    if(!$('#top-aligned-media data-id="${comment.id}" p').hasClass('on')){
       $('#top-aligned-media data-id="${comment.id}" p').addClass('on');
       var txt = $('#top-aligned-media data-id="${comment.id}" p').text();
       $('#top-aligned-media data-id="${comment.id}" p').html('<input type="text" value="'+txt+'" />');
       $('#top-aligned-media data-id="${comment.id}" p > input').focus().blur(function(){
           var inputVal = $('#top-aligned-media data-id="${comment.id}" p').val();
           if(inputVal===''){
               inputVal = $('#top-aligned-media data-id="${comment.id}" p').attr("defaultValue");
           };
           $('#top-aligned-media data-id="${comment.id}" p').parent().removeClass('on').text(inputVal);
      });
    };
  });
});
