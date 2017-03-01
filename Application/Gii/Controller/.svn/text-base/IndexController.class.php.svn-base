<?php
namespace Gii\Controller;
use Think\Controller;
class IndexController extends Controller{
    public function index(){//使用Gii来生成模块代码
        if(IS_POST){
            $gii=D('Gii');
            if($gii->create()){
            if($gii->make_template()){
               $this->success("操作成功"); 
               exit; 
            }  else {
            $this->error ($gii->getError ());    
            }
             
             
            }else
           $this->error ($gii->getError ());
        }
       $this->display();
        
    }
    
    
    
    
    
}