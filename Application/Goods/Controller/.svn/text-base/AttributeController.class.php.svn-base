<?php 
namespace Goods\Controller;
use Admin\Controller\IndexController;

class AttributeController extends IndexController{
    public function add($type_id){//添加
       if(IS_POST){
          $admin= D("Attribute");//D函数必须自己创建模型,一般模型中有验证规则时用D
          if($admin->create()){
              if($admin->add()){
                 $this->success("添加成功",U("lst",array('type_id'=>$type_id))); 
                 exit; 
                  
              }else
               $this->error("添加失败");   
          }else
              
            $this->error($admin->getError());//从模型中获取失败的原因   
              exit;
          
       }
    
       $this->display();
       } 
       
       public function save($type_id){//修改 修改表单要有一个隐藏表单域,name位主键
        $admin= D("Attribute");//D函数必须自己创建模型,一般模型中有验证规则时用D
       if(IS_POST){
          
          if($admin->create()){
              if($admin->save()!==false){//返回受影响的行数
                $this->success("修改成功",U("lst",array('type_id'=>$type_id))); 
                 exit; 
                  
              }else
               $this->error("修改失败");   
          }else
              
            $this->error($admin->getError());//从模型中获取失败的原因   
              exit;
          
       }
       $d=$admin->find($type_id);
       $this->assign('data',$d);
       $this->display();
       } 
        
       public function lst($type_id){
          $admin= D("Attribute");//D函数必须自己创建模型,一般模型中有验证规则时用D  
          $data=$admin->search(); 
             $type= M('type');
             $type_datas=$type->select();
           $this->assign(array(
               'show'=>$data['show'],
               'list'=>$data['list'],
               'type_datas'=>$type_datas
           ));
     
       $this->display();
       }
       
       public function del($id){
      
              $admin=D('Attribute'); 
              $admin->delete($id); 
        
        $this->success("删除成功",U("lst",array('type_id'=>$type_id)));    
           
           
           
       }
        public function bdel(){
        $del=I('post.del_check');
        if($del){
           $admin=D('Attribute');
           $str=implode(',',$del);
           $admin->delete($str);
       }
      $this->success("删除成功",U("lst",array('type_id'=>$type_id))); 
       } 
    }
    
    
    
