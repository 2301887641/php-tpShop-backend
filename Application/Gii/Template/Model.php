namespace <?php echo $first_str;?>\Model;
use Think\Model;
class <?php echo $contrl_model_name;?>Model extends Model{

   protected $_validate =array(
   
    <?php foreach($data as $v):
        if($v['key']=='PRI')
            continue;
        if($v['null']=='NO' && $v['default']===NULL):
        ?> 
   array('<?php echo $v['field']?>','require','<?php echo $v['comment']?>不能为空',1),
 

   <?php endif;endforeach;?>
   <?php foreach($data as $vv):if($vv['key']=='UNI'):?>
      
   array('<?php echo $vv['field']?>','','<?php echo $vv['comment']?>不能重复',1,'unique'),
   
   <?php endif;endforeach;?>
   );  
  public function search(){
       $pages=15;
      
       $where=1;
       
        $count= $this->where($where)->count();// 查询满足要求的总记录数
       $Page= new \Think\Page($count,$pages);// 实例化分页类 传入总记录数和每页显示的记录数(25)
     
       $data['show'] = $Page->show();// 分页显示输出

      $data['list']=$this->order('id')->where($where)->limit($Page->firstRow.','.$Page->listRows)->select();
      //echo $this->getLastSql();die;
      return $data;
   }   

}
