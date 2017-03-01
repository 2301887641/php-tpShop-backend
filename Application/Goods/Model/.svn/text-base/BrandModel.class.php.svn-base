<?php 
namespace Goods\Model;
use Think\Model;
class BrandModel extends Model{

   protected $_validate =array(
   
     
   array('brand_name','require','品牌名称不能为空',1),
 

    
   //array('brand_logo','require','品牌logo不能为空',1),
 

    
   array('brand_url','require','官方网站不能为空',1),
 

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
   
   public function _before_insert(&$data, $options) {
     
         if(!empty($_FILES["brand_logo"]["name"])){
          
             $upload = new \Think\Upload();
             $upload->exts      =     array('jpg', 'gif', 'png', 'jpeg');
             $upload->rootPath  =      './Public/Uploads/';
             $upload->savePath='Brand/';
              $info   =   $upload->upload();
        
              $image = new \Think\Image(); 
              $image_path='./Public/Uploads/'.$info["brand_logo"]["savepath"].$info["brand_logo"]["savename"];
              $image->open($image_path);

              $image->thumb(C('IMG_WIDTH'), C('IMG_HEIGHT'))->save($image_path);//将原图覆盖掉
             //将地址保存到数据库中
              $data['brand_logo']=$info["brand_logo"]["savepath"].$info["brand_logo"]["savename"];
         }
   }

   public function _before_delete($options) {
       
        if(is_array($options['where']['id'])){
        
           $data=$this->where('id in ('.$options['where']['id'][1].')')->select(); 
           foreach($data as $d){
               if(is_file($d["brand_logo"])) unlink($d["brand_logo"]);
               
               
           }
        }else{
     
          $data=$this->where('id ='.$options['where']['id'])->select();
             foreach($data as $d){
               if(is_file($d["brand_logo"])) unlink($d["brand_logo"]);
               
               
           }
            
        }
        
        
       }
   
   public function _before_update(&$data, $options) {
       
       if(!empty($_FILES["brand_logo"]["name"])){
            $data=$this->where($options['id'])->find();
            
       if(is_file('./Public/Uploads/'.$data["brand_logo"])) unlink($data["brand_logo"]);
           
       
             $upload = new \Think\Upload();
             $upload->maxSize   =     2097152 ;// 设置附件上传大小
             $upload->exts      =     array('jpg', 'gif', 'png', 'jpeg');
             $upload->rootPath  =      './Public/Uploads/';
             $upload->savePath='Brand/';
              $info   =   $upload->upload();
        
              $image = new \Think\Image(); 
              $image_path='./Public/Uploads/'.$info["brand_logo"]["savepath"].$info["brand_logo"]["savename"];
              $image->open($image_path);

              $image->thumb(C('IMG_WIDTH'), C('IMG_HEIGHT'))->save($image_path);//将原图覆盖掉
             //将地址保存到数据库中
              $data['brand_logo']=$info["brand_logo"]["savepath"].$info["brand_logo"]["savename"];
         }
       
       
   }
   
   
   
   
   
}
