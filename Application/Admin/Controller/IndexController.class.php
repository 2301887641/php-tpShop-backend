<?php
namespace Admin\Controller;
use Think\Controller;

class IndexController extends Controller{
    public function __construct(){
        parent::__construct();
       if(!session("id")){
           $this->error("请先登录",U('Admin/Login/login'));
           exit;
       }   
        $sub=session('sub');
        $this->assign('pri_name',$sub);
       
       
       
       
       $pri_list=session('pri');
       
      
           
       $now=MODULE_NAME.'/'.CONTROLLER_NAME.'/'.ACTION_NAME; 
       //var_dump($now);die;
       if((MODULE_NAME=='Admin') && (CONTROLLER_NAME=='Index')){//不能同时判断3者，只能前2者
           return true;
           
       }
       if($pri_list!='*' && !in_array($now, $pri_list)){
           $this->error("权限不够");
           exit;
           
       }    
    
       
    }
    public function index(){
        $this->display();
        
        
    }
     public function login(){
        $this->display();
        
        
    }
      public function left(){
        $this->display();
        
        
    }
      public function top(){
        $this->display();
        
        
    }
    
         public function main(){
        $this->display();
        
        
    }
    
}