<?php 
namespace Goods\Controller;
use Admin\Controller\IndexController;

class CategoryController extends IndexController{
    public function add(){//添加
        $admin= D("Category");//D函数必须自己创建模型,一般模型中有验证规则时用D
       if(IS_POST){
          
          if($admin->create()){
              if($admin->add()){
                 $this->success("添加成功",U("lst")); 
                 exit; 
                  
              }else
               $this->error("添加失败");   
          }else
              
            $this->error($admin->getError());//从模型中获取失败的原因   
              exit;
          
       }
       $category=$admin->get_category();
       $recommend=M('recommend');
       $recommends=$recommend->where('rec_type="分类"')->select();
       
        //取出商品类型表中所有的属性类型  
       $type=M('type'); 
       $types=$type->field('id,type_name')->select();
       $this->assign(array(
           'category'=>$category,
           'recommend'=>$recommends,
           'type'=>$types
       ));
       $this->display();
       } 
       
       public function save($id){//修改 修改表单要有一个隐藏表单域,name位主键
        $admin= D("Category");//D函数必须自己创建模型,一般模型中有验证规则时用D
       if(IS_POST){
          
          if($admin->create()){
              if($admin->save()!==false){//返回受影响的行数
                 $this->success("修改成功",U("lst")); 
                 exit; 
                  
              }else
               $this->error("修改失败");   
          }else
              
            $this->error($admin->getError());//从模型中获取失败的原因   
              exit;
          
       }
       $d=$admin->find($id);
       $this->assign('data',$d);
       $category=$admin->get_category();
       $recommend=M('recommend');//推荐位
       $recommends=$recommend->where('rec_type="分类"')->select();
       $recommendItem=M('recommendItem');
       $recs=$recommendItem->alias('a')->field('group_concat(a.rec_id) rec_ids')->join('join sh_recommend b on a.rec_id=b.id')->where('goods_id='.$id.' and b.rec_type="分类"')->select();
       
       //取出商品类型表中所有的属性类型  
       $type=M('type'); 
       $types=$type->field('id,type_name')->select();

       $this->assign(array(
           'category'=>$category,
           'recommend'=>$recommends,
           'recs'=>$recs[0]["rec_ids"],
           'type'=>$types
       ));
       $this->display();
       } 
        
       public function lst(){
          $admin= D("Category");//D函数必须自己创建模型,一般模型中有验证规则时用D  
           $arr=$admin->get_category();

           $this->assign(array(
            'list'=>$arr
            ));
           $this->display();
       }
       //删除商品分类
       public function del($id){
              $admin=D('category'); 
              $admin->delete($id); 
         $this->success("修改成功");   
       }
       //批量删除商品分类
        public function bdel(){
        $del=I('post.del_check');
        if($del){
           $admin=D('Category');
           $str=implode(',',$del);
           $admin->delete($str);
       }
       $this->success("删除成功");
       } 

       //ajax获取指定类型下的属性
       public function ajaxGetAttr($id){
        if($id){
          $attr=M('attribute');
          //只取出单选的属性
         $json=$attr->field('id,attr_name')->where("type_id=$id and attr_type='单选'")->select();
        //转成json进行返回
         echo json_encode($json);
        }
        
       }

    }
    
    
    
