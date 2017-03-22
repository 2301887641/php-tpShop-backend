<?php
namespace Admin\Model;

use Think\Model;
class AdminModel extends Model{
     protected $tableName        =   'admin';
   protected $_validate =array(
         //array("check_img",'check_codes','验证码错误',1,"callback",4),
       array("username",'require','用户名不能为空',1),
        array("password",'require','密码不能为空',1,'regex',1),
        array("password",'require','密码不能为空',1,'regex',4),
        array("username",'','用户名重复了',1,"unique",1),
        array("username",'','用户名重复了',1,"unique",2),
     
   );  // 自动验证定义  
   
   public function check_codes($code){
       $verify = new \Think\Verify(); 
       return $verify->check($code,''); 
   }
   
   
   protected function _before_insert(&$data) {
       $data["password"]=md5($data["password"]);
   
   } 
     protected function _before_update(&$data,$options) {
      if(trim($data['password'])){
          $data['password']=md5($data['password']);
          
      }else{
          unset($data['password']);
      }   
         
         
     }
   public function check_login(){
       $password=$this->password;
       $data=$this->where('username='."'$this->username'")->find();
       if($data){
        if($data['password']==md5($password)){
            session('id',$data['id']);
            session('username',$data['usernmae']);
           $this->write_pri($data['role_id']);
            return 1;//用户名正确
           
       }else{
           return 2;//密码错误
           
       }   
           
       }else{
           return 3;//没有这个用户
           
       }
      
       
   }
   
   public function write_pri($role_id){
       $role=M('role');
       $pri_id=$role->where('id='.$role_id)->find();//将管理员的权限id取出
         $pri=M('privilege');
       if($pri_id['pri_id_list']=='*'){//如果是超级管理员的话
        session('pri','*'); //取出所有的前两级的权限作为按钮  

        $ps=$pri->where('parent_id=0')->select();
        foreach($ps as $k=>$p){
         $ps[$k]['sub']=$pri->where('parent_id='.$p['id'])->select(); 
     
        }
    
       session('sub',$ps);
       }else{
           
     
     
       $pri_list=$pri->field("*,concat(module_name,'/',controller_name,'/',action_name) as pri_all")->where('id in ('.$pri_id['pri_id_list'].')')->select();    
       //var_dump($pri_list);die;
       $arr=array();
       $arr2=array();
       foreach($pri_list as $k=>$p){
           $arr[]=$p['pri_all'];
            if($p['parent_id']==0){
               $arr2[]=$p;
               
           }
           
       }
       
        foreach ($pri_list as $k2=>$p2){
           foreach($arr2 as $kk=>$a){
               if($a['id']==$p2['parent_id']){
                   $arr2[$kk]['sub'][]=$p2;
                   
                   
               }
               
               
           }
           
           
       }
       session('sub',$arr2);
       session('pri',$arr);
       }
       
      
       
   }

   public function search(){
       $pages=15;
      
       $where=1;
       if($un=I('get.un'))
           $where.=" and username like '%$un%' ";
       if($id=I('get.id'))
           $where.=" and id=$id";

        $count= $this->where($where)->count();// 查询满足要求的总记录数
       $Page= new \Think\Page($count,$pages);// 实例化分页类 传入总记录数和每页显示的记录数(25)
     
       $data['show'] = $Page->show();// 分页显示输出

      $data['list']=$this->order('id')->where($where)->limit($Page->firstRow.','.$Page->listRows)->select();
      //echo $this->getLastSql();die;
      return $data;
   }
  public function logout(){
        session(null);
      
  }
}
