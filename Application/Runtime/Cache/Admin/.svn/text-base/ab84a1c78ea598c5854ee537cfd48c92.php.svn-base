<?php if (!defined('THINK_PATH')) exit();?><!-- $Id: brand_info.htm 14216 2008-03-10 02:27:21Z testyang $ -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>ECSHOP 管理中心 - 添加角色表 </title>
<meta name="robots" content="noindex, nofollow">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="/Public/Styles/general.css" rel="stylesheet" type="text/css" />
<link href="/Public/Styles/main.css" rel="stylesheet" type="text/css" />
<script src="/Public/Js/jquery.js" type="text/javascript"></script>
<style>
    ul li{
        list-style: none;


    }

</style>
</head>
<body>
<h1>
    <span class="action-span"><a href="/Admin/Role/lst">角色表列表</a></span>
    <span class="action-span1"><a href="#">ECSHOP 角色表中心</a></span>
    <span id="search_id" class="action-span1"> - 添加角色表 </span>
    <div style="clear:both"></div>
</h1>
<div class="main-div">
    <form method="post" action="/Admin/Role/add" enctype="multipart/form-data" >

        <table cellspacing="1" cellpadding="3" width="100%">
                        <tr>
                <td class="label">角色名称:</td>
                <td>
                                        <input type="text" name="role_name" maxlength="60" />
                                                            <span class="require-field">*</span>
                                    </td>
            </tr>
                     <tr>
                <td class="label">权限列表:</td>
                <td align="left">
                   <ul>
                       <?php foreach($pri as $p):?>
                       <li level="<?php echo $p['level']?>"><?php echo str_repeat('-',$p['level']*5)?><input type="checkbox" name='pri_id_list[]' value="<?php echo $p['id']?>"><?php echo $p['pri_name']?></li>
                       <?php endforeach;?>

                   </ul>

                                                        </td>
            </tr>

            <tr>
                <td colspan="2" align="center"><br />
                    <input type="submit" class="button" value=" 确定 " />
                    <input type="reset" class="button" value=" 重置 " />
                </td>
            </tr>
        </table>

    </form>
</div>

<div id="footer">
共执行 1 个查询，用时 0.018952 秒，Gzip 已禁用，内存占用 2.197 MB<br />
版权所有 &copy; 2005-2012 高端大气上档次有限公司，并保留所有权利。</div>
</body>
</html>
<script>
$(':checkbox').click(function(){
    var chk=$(this).attr('checked');
   var par=$(this).parent();
   var level=par.attr('level');//获取level属性 
    var li=par.prevAll("li");
   li.each(function(){
  
       if($(this).attr('level')<level && chk){
           $(this).find(':checkbox').attr('checked','checked');
           if($(this).attr('level')=='0'){
               return false;
           
       }
           
       }

   });
    if(!chk){
       var next_li=par.nextAll("li");
        next_li.each(function(){
            if($(this).attr('level')>level){
           $(this).find(':checkbox').removeAttr('checked'); 
        
       }else{
          return false; 
           
       } 
        });   
       
       }
   
    
});    



 
</script>