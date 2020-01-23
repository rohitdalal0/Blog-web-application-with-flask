$(document).ready(function () {

  $("#thumb-clircle").click(() => {
    let status = $("#thumb-up").attr('class');
    if (status == 'fa fa-thumbs-o-up'){
      $("#thumb-up").removeClass('fa fa-thumbs-o-up').addClass('fa fa-thumbs-up');
      var p_id = $("#post_id").attr('class');
      like_update('fa fa-thumbs-up', p_id);
      
    }else{
      $("#thumb-up").removeClass('fa fa-thumbs-up').addClass('fa fa-thumbs-o-up');
      var _id = $("#post_id").attr('class');
      like_update('fa fa-thumbs-o-up', _id);
    };

    function like_update(state, post_id){
      $.ajax({
          url: '/like_update',
          method: 'POST',
          data : {
            'state': state,
            'id': post_id,
          },

          success: (data)=>{
            $('#total_like').fadeOut(200).text(data.total_like).fadeIn(200);
          },

      });
    };

  });
  });
