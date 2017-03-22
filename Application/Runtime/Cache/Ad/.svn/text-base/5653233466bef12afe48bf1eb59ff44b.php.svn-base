<?php if (!defined('THINK_PATH')) exit();?><html>

<head>
	
        <script src="/Public/Js/jquery.js" type="text/javascript"></script>
</head>

<body>
<img src="" id="pre_img" width="100" />
<form target="img" method="POST" action="/Ad/Ad/test.html" enctype="multipart/form-data">
<input id="pic" type="file" name="imgs" />
<input type="submit" value="上传" />
</form>
<iframe name="img" style="display:none;"></iframe>
</body></html>
<script>

$("#pic").change(function(){
	var pic = this.files[0];
	var xiao = window.URL.createObjectURL(pic);
        $("#pre_img").attr('width',100);
	$("#pre_img").attr('src', xiao);
});

</script>