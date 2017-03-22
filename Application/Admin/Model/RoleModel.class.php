<?php 
namespace Admin\Model;
use Think\Model;
class RoleModel extends Model{

   protected $_validate =array(
   
     
   array('role_name','require','角色名称不能为空',1),
 

            
   array('role_name','','角色名称不能重复',1,'unique'),
   
      );  
  public function search(){
       $pages=15;
      
       $where=1;
       
        $count= $this->where($where)->count();// 查询满足要求的总记录数
       $Page= new \Think\Page($count,$pages);// 实例化分页类 传入总记录数和每页显示的记录数(25)
     
       $data['show'] = $Page->show();// 分页显示输出

      $data['list']=$this->field('a.*,group_concat(b.pri_name) as pri_name')->alias('a')->join('left join sh_privilege b on find_in_set(b.id,a.pri_id_list)')->group('a.id')->order('id')->where($where)->limit($Page->firstRow.','.$Page->listRows)->select();
   //  var_dump($data['list']);die;      
//echo $this->getLastSql();die;
      return $data;
   }   
   public function _before_insert(&$data, $options) {
       $data["pri_id_list"]=implode(',',$data["pri_id_list"]);
     
   }
   
   public function _before_update(&$data, $options) {
     $data["pri_id_list"]=implode(',',$data["pri_id_list"]);  
   }

}
