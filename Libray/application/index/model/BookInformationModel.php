<?php
/**
 * Created by PhpStorm.
 * User: sj
 * Date: 2019/1/9
 * Time: 12:02
 */

namespace app\index\model;

use think\Model;
class BookInformationModel extends Model{
    protected $table = 'BookInformation';
    // 设置当前模型的数据库连接
    protected $connection = 'lib';
    public function BookInformationModel(){
        return $this->hasOne('BookInformationModel','libno','libno');
    }
}