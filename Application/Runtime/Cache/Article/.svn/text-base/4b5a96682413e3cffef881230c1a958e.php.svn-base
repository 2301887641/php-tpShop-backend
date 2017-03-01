<?php if (!defined('THINK_PATH')) exit();?><!-- $Id: brand_info.htm 14216 2008-03-10 02:27:21Z testyang $ -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>ECSHOP 管理中心 - 修改文章分类 </title>
<meta name="robots" content="noindex, nofollow">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="/Public/Styles/general.css" rel="stylesheet" type="text/css" />
<link href="/Public/Styles/main.css" rel="stylesheet" type="text/css" />
</head>
<body>
<h1>
    <span class="action-span"><a href="/Article/ArticleCat/lst">文章分类列表</a></span>
    <span class="action-span1"><a href="#">ECSHOP 文章分类中心</a></span>
    <span id="search_id" class="action-span1"> - 修改文章分类 </span>
    <div style="clear:both"></div>
</h1>
<div class="main-div">
    <form method="post" action="/Article/ArticleCat/save/id/2" enctype="multipart/form-data" >
       
        <table cellspacing="1" cellpadding="3" width="100%">
            <input type="hidden" name="id" value="<?php echo $data['id']?>">            <tr>
                <td class="label">分类名称:</td>
                <td>
                                        <input type="text" name="cat_name" maxlength="60" value="<?php echo $data['cat_name']?>"/>
                                                            <span class="require-field">*</span>
                                    </td>
            </tr>
                     <tr>
                <td class="label">是否是帮助:</td>
                <td>
                                      
                                        <input type="radio" <?php if($data['is_help']=='是') echo "checked='checked'";?> value="是" name="is_help">是                                         <input type="radio" <?php if($data['is_help']=='否') echo "checked='checked'";?> value="否" name="is_help">否                        
                                                            <span class="require-field">*</span>
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