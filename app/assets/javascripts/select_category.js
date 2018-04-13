//セレクトボックス1でチームを選択すると、セレクトボックス2にカテゴリを表示
$(window).on('load', function(){

  $('#select_team').change(function() {
    $.ajax({
      type: "GET",
      url: $('#select_team').find('option:selected').data().path,
      dataType: "json",
    })
    // Ajaxリクエストが成功した場合
    .done( (data) => {
      $("#select_category").children().remove();
      for(var i in data) {
        $("#select_category").append("<option value=" +data[i].id + ">" + data[i].name +  "</option>");
      }
    })
    // Ajaxリクエストが失敗した時発動
    .fail( (data) => {
      console.log('failed');
    });
  });
});
