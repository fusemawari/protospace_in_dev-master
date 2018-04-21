$(function() {

  //入力されたキーを保存する
  var inputKey = [];

  //入力されたキーと比較する隠しコマンド
  //38 = 上
  //40 = 下
  //37 = 左
  //39 = 右
  //66 = B
  //65 = A
  var konamiCommand = [38,38,40,40,37,39,37,39,66,65];

 //画面上のキー入力イベントリスナ
 $(window).keyup(function(e) {
   //キー入力を配列に追加
   inputKey.push(e.keyCode);

   //キー入力が保存された配列と隠しコマンドを比較
   if (inputKey.toString().indexOf(konamiCommand) >= 0) {
      alert('カカロットォ!!')

    location.href = 'http://budouden2.gamelando.com/';

      //キー入力を初期化
      inputKey = [];
   }
 });
});
