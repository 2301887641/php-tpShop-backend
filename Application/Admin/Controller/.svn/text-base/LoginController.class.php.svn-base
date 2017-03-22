<?php
namespace Admin\Controller;
use Think\Controller;

class LoginController extends Controller{
    
 //用户登录
     public function login(){
         if(IS_POST){
             $admin=D("admin");
             if($admin->create($_POST,4)){
                 
                $cod=$admin->check_login();
                 if($cod==1){
                     $this->success('登录成功',U('Index/index'));
                     exit;
                 }
                 
                 $cod==2?$this->error("密码错误"):$this->error("没有这个用户"); 
           
                 
             }else
                 
            $this->error($admin->getError());  
         
         }
        $this->display();
        
        
    }
   //生成验证码 
 public function chek_code(){
     
     $Verify = new \Think\Verify();
     $Verify->entry();
     
     
 }
 //退出登录
 public function logout(){
     $admin=D('admin');
     $admin->logout();
     $this->success("退出成功",U('Login/login'));
     exit;
 }
    
}