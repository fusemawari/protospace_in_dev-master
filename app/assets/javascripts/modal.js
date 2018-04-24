$('#modal-sample').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget);
    var recipient = button.data('comments.content');
    var modal = $(this);
    modal.find('.modal-title').text(recipient);
    console.log(11)
});
