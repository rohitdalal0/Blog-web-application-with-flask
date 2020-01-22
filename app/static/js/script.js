$(document).ready(function () {

  $("#thumb-clircle").click(() => {
    let status = $("#thumb-up").attr('class');
    if (status == 'fa fa-thumbs-o-up'){
      $("#thumb-up").removeClass('fa fa-thumbs-o-up').addClass('fa fa-thumbs-up');
      
    }else{
      $("#thumb-up").removeClass('fa fa-thumbs-up').addClass('fa fa-thumbs-o-up');
    };

  });
  //  I need to create a triger in 'if statment' which triger a function to call 
  // ajax and ajax send data to python, it's handle backend query. after procedure
  // 'data' by ajax, It's sendback to JQuery and JQuery show data in the html page but real time.

  



  });