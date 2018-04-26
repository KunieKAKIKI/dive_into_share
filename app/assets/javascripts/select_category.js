//セレクトボックス1でチームを選択すると、セレクトボックス2にカテゴリを表示
$(function() {
  $('#select_team').on('change', function() {
    $.ajax({
      type: "GET",
      url: $('#select_team').find('option:selected').data('path'),
      dataType: 'json',
    })
    // Ajaxリクエストが成功した場合
    .then(function (data) {
      $("#select_category").children().remove();
      data.forEach(function(element){
        var option = $('<option>');
        option.val(element.id);
        option.text(element.name);
        $("#select_category").append(option);
      });
    })
    // Ajaxリクエストが失敗した場合
    .catch(function (data) {
      alert('カテゴリの取得に失敗しました');
    });
  });
});
