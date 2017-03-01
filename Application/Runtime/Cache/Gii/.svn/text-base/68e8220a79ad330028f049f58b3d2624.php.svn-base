<?php if (!defined('THINK_PATH')) exit();?><!-- $Id: brand_info.htm 14216 2008-03-10 02:27:21Z testyang $ -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>ECSHOP 管理中心 - 修改按钮表 </title>
<meta name="robots" content="noindex, nofollow">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="/Public/Styles/general.css" rel="stylesheet" type="text/css" />
<link href="/Public/Styles/main.css" rel="stylesheet" type="text/css" />
</head>
<body>
<h1>
    <span class="action-span"><a href="/Gii/Buttons/lst">按钮表列表</a></span>
    <span class="action-span1"><a href="#">ECSHOP 按钮表中心</a></span>
    <span id="search_id" class="action-span1"> - 修改按钮表 </span>
    <div style="clear:both"></div>
</h1>
<div class="main-div">
    <form method="post" action="/Gii/Buttons/save/id/3" enctype="multipart/form-data" >
       
        <table cellspacing="1" cellpadding="3" width="100%">
            <input type="hidden" name="id" value="<?php echo $data['id']?>">            <tr>
                <td class="label">按钮名称:</td>
                <td>
                                        <input type="text" name="btn_name" maxlength="60" value="<?php echo $data['btn_name']?>"/>
                                                            <span class="require-field">*</span>
                                    </td>
            </tr>
                     <tr>
                <td class="label">按钮地址:</td>
                <td>
                                        <input type="text" name="btn_url" maxlength="60" value="<?php echo $data['btn_url']?>"/>
                                                            <span class="require-field">*</span>
                                    </td>
            </tr>
                     <tr>
                <td class="label">是否打开新窗口:</td>
                <td>
                                      
                                        <input type="radio" <?php if($data['open_new']=='是') echo "checked='checked'";?> value="是" name="open_new">是                                         <input type="radio" <?php if($data['open_new']=='否') echo "checked='checked'";?> value="否" name="open_new">否                        
                                                        </td>
            </tr>
                     <tr>
                <td class="label">按钮位置:</td>
                <td>
                                      
                                        <input type="radio" <?php if($data['btn_pos']=='上') echo "checked='checked'";?> value="上" name="btn_pos">上                                         <input type="radio" <?php if($data['btn_pos']=='中') echo "checked='checked'";?> value="中" name="btn_pos">中                                         <input type="radio" <?php if($data['btn_pos']=='下') echo "checked='checked'";?> value="下" name="btn_pos">下                        
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