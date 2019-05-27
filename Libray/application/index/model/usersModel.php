<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/9/16
 * Time: 14:11
 */

namespace app\index\model;

use think\Model;
class usersModel extends Model{
    protected $table = 'users';
    // 设置当前模型的数据库连接
    protected $connection = 'lib';
    public function usersModel(){
        return $this->hasOne('usersModel','district_index_id','userno');
    }
}