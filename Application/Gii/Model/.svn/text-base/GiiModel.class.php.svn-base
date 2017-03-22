<?php
namespace Gii\Model;
use Think\Model;
class GiiModel extends Model{
    protected $fields           =   array(//直接指明当前表的字段,而不查询数据库,也不用建立gii表
        'table_name','module_name'
        
    );
    protected $_validate =array(
    array("table_name",'require','表名必须填写',1),
    array("module_name",'require','模型名必须填写',1),
     
   );  
    public function make_template(){
      
           $first_str=ucfirst($this->module_name);//模块名首字母大写 
           $contrl=APP_PATH.$first_str.'/Controller';//生成的控制器路径
           $model=APP_PATH.$first_str.'/Model';//生成的模型路径
           $view=APP_PATH.$first_str.'/View';//生成的视图路径
           $Gii_template=APP_PATH.'Gii/Template';
          if(!is_dir(APP_PATH.$first_str)){
           mkdir(APP_PATH.$first_str,0777);//生成模块目录,首字母大写
          }
          if(!is_dir($contrl)){
           mkdir($contrl,0777);
          }
          if(!is_dir($model)){
           mkdir($model,0777);
          }
          if(!is_dir($view)){
           mkdir($view,0777);
          }
           $contrl_model_name=$this->table_name_make();//生成控制器和模型的前缀名
        
           //################生成控制器模板########################## 
           ob_start();//开启ob缓冲
           include($Gii_template.'/Controller.php');//将控制器模板输出到缓冲区
           $contents=ob_get_clean();//从缓冲区读出模板内容,会直接执行php代码,所以要将控制器模板的<?php去掉
           $last_path=$contrl.'/'.$contrl_model_name.'Controller.class.php';//定义要输出的位置
           file_put_contents($last_path,"<?php \r\n".$contents);//将控制器模板内容输出到文件中
           
           //################生成模型模板########################## 
           $models=M();
           $a=array();
           $datas=$models->query("show tables");
           foreach($datas as $k=>$d){
               foreach($d as $dd){
               array_push($a,$dd);
               }
               
           }
            if(!in_array($this->table_name,$a)){
                $this->error='表名不存在';
                return false;
                
            }
           
           $data=$models->query("show full fields from $this->table_name");
           
            $table_desc=$models->query("show table status from shop where name='$this->table_name'");//取出表的comment信息
            $table_comment=$table_desc[0]['comment'];//将comment信息从一维数组转换成二维数组
            //var_dump($data[5]['field']);die;
            
            ob_start();//开启ob缓冲
            include($Gii_template.'/Model.php');//将模型模板输出到缓冲区
            $contents=ob_get_clean();//从缓冲区读出模板内容,会直接执行php代码,所以要将模板的<?php去掉
            $last_path=$model.'/'.$contrl_model_name.'Model.class.php';//定义要输出的位置
            file_put_contents($last_path,"<?php \r\n".$contents);//将控制器模板内容输出到文件中
            
            //###############在view文件夹下生成3个静态页###########################
            //生成view下的文件夹
            $view_file=$view.'/'.$contrl_model_name;
            if(!is_dir($view_file)){
                
                mkdir($view_file,0777);
                
            }
             //先生成add模板
             ob_start();//开启ob缓冲
            include($Gii_template.'/add.html');//将模型模板输出到缓冲区
            $contents=ob_get_clean();//从缓冲区读出模板内容,会直接执行php代码,所以要将模板的<?php去掉
            $last_path=$view_file.'/add.html';//定义要输出的位置
            file_put_contents($last_path,$contents);//将控制器模板内容输出到文件中
            
            //生成save模板
              ob_start();//开启ob缓冲
            include($Gii_template.'/save.html');//将模型模板输出到缓冲区
            $contents=ob_get_clean();//从缓冲区读出模板内容,会直接执行php代码,所以要将模板的<?php去掉
            $last_path=$view_file.'/save.html';//定义要输出的位置
            file_put_contents($last_path,$contents);//将控制器模板内容输出到文件中
            
            //生成lst模板
                ob_start();//开启ob缓冲
            include($Gii_template.'/lst.html');//将模型模板输出到缓冲区
            $contents=ob_get_clean();//从缓冲区读出模板内容,会直接执行php代码,所以要将模板的<?php去掉
            $last_path=$view_file.'/lst.html';//定义要输出的位置
            file_put_contents($last_path,$contents);//将控制器模板内容输出到文件中
            
            return true;
        
        
     
        
        
        
    }
    
    public function table_name_make(){//为项目的控制器和模型
        $table_prefix=C('DB_PREFIX');//将数据库表前缀读取出来
        $contro_name=str_replace($table_prefix, '', $this->table_name);//将前缀去掉,并且将剩下的作为控制器的前缀拼接
        if(strpos($contro_name,'_')!==false){
        $arr=explode('_',$contro_name);
        $arr=array_map('ucfirst',$arr);
        return  implode('',$arr);   
            
        }else{
        return  ucfirst($contro_name);
            
        }
       
        
    }
    
    
}
