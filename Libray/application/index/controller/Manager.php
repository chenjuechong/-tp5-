<?php
/**
 * Created by PhpStorm.
 * User: God
 * Date: 2018/9/19
 * Time: 22:07
 */
namespace app\index\controller;


use app\index\model\BookModel;
use think\Controller;
use think\Db;
use think\Session;

class manager extends Controller
{
    public function bookinf(){
        if (Session::get('username') != null){
            $data=Db::table('booktype BookType,bookinformation BookInformation,ctsort CTSort,writer Writer,writing Writing,publish Publish')
                ->where('BookType.BookTypeNo=BookInformation.BookTypeNo and BookInformation.SortNo=CTSort.SortNo and BookInformation.LibNo=Writing.LibNo
                 and Writer.WriNo=Writing.WriNo and Publish.pubNo=BookInformation.pubNo')
                ->field('BookInformation.BookName,BookType.BookTypeName,CTSort.SortCreate,Writer.WriName,BookInformation.WordNum,BookInformation.Price,BookInformation.LibNo,Publish.address')
                ->select();
            $BookType=Db::table('booktype')->select();
            $Publish=Db::table('publish')->select();
            $CTSort=Db::table('ctsort')->select();
            $this->assign('Publish', $Publish);
            $this->assign('BookType', $BookType);
            $this->assign('CTSort', $CTSort);
            $this->assign('list', $data);
            $this->assign('username', Session::get('username'));
            return view();
        }
    }
    public function addbookinfomation(){
        if (Session::get('username') != null) {
            $data = [ 'bookname' => $_POST['bookname'], 'wordnum' =>$_POST['wordnum'],'price' =>$_POST['price'],'sortNo' =>$_POST['sortNo'],'booktypeno' =>$_POST['BookTypeNo'],'pubno' =>$_POST['PubNo']];
            $flag = Db::table('bookinformation')->insert($data);
            if ($flag >= 1)
            {
                $WriName=$_POST['WriName'];
                $sql="select * from writer where WriName='$WriName'";
                $Writer=Db::query($sql);
                foreach ($Writer as $item) {
                    if($item==null){
                        $this->error('请输入正确的作者');
                    }
                    else{
                        $bookname=$_POST['bookname'];
                        $wordnum=$_POST['wordnum'];
                        $s="select * from bookinformation where bookname='$bookname' and wordnum='$wordnum'";
                        $lib=Db::query($s);
                            $WriNo=$item['WriNo'];
                        foreach ($lib as $book){
                            $WriNo=$item['WriNo'];
                            $Writing=['WriNo' => $WriNo, 'libno' =>$book['libno'],'role' => 0];
                            $f = Db::table('writing')->insert($Writing);
                            if($f>=1){
                                $this->success('添加成功', url('manager/bookinf'));
                            }
                        }

                    }

                }
            }
        }
    }
    public function updatebook(){
        if (Session::get('username') != null) {
            $libno=$_GET['libno'];
            $bookinf=Db::table('booktype BookType,bookinformation BookInformation,ctsort CTSort,writer Writer,writing Writing,publish Publish')
                ->where('BookType.BookTypeNo=BookInformation.BookTypeNo and BookInformation.SortNo=CTSort.SortNo and BookInformation.LibNo=Writing.LibNo
                 and Writer.WriNo=Writing.WriNo and Publish.pubNo=BookInformation.pubNo')
                ->field('BookInformation.BookName,BookType.BookTypeName,CTSort.SortCreate,Writer.WriName,BookInformation.WordNum,BookInformation.Price,BookInformation.LibNo,Publish.address')
                ->where('BookInformation.LibNo',$libno)
                ->select();
            $BookType=Db::table('booktype')->select();
            $Publish=Db::table('publish')->select();
            $CTSort=Db::table('ctsort')->select();
            $library=Db::table('library')->select();
            $this->assign('Publish', $Publish);
            $this->assign('BookType', $BookType);
            $this->assign('CTSort', $CTSort);
            $this->assign('list', $bookinf);
            $this->assign('library', $library);
            $this->assign('username', Session::get('username'));
            return view();
        }
    }
    public function doupdate(){
        if (Session::get('username') != null) {
            $libno=$_POST['libno'];
            $booknum=$_POST['booknum'];
            $libraryno=$_POST['libraryno'];
            $i=0;
            for(;$i<$booknum;$i++) {
                $book = ['libno' => $libno, 'statues' => '空闲', 'libraryno' => $libraryno];
                $f= Db::table('book')->insert($book);
            }
            $kucun=Db::table('kucun')
                ->where('libraryNo',$libraryno)
                ->where('libNo',$libno)
                ->select();
            if($kucun==NULL){
                $data = [ 'libno' => $libno,'booknum' => $booknum,'libraryno' => $libraryno];
                $flag = Db::table('kucun')->insert($data);
                if ($flag >= 1) {
                    $this->assign('username', Session::get('username'));
                    $this->success('添加成功', url('bookinf'));
                }
            }
            foreach ($kucun as $kc){

                if($kc == NULL){
                    $data = [ 'libno' => $libno,'booknum' => $booknum,'libraryno' => $libraryno];
                    $flag = Db::table('kucun')->insert($data);
                    if ($flag >= 1) {
                        $this->assign('username', Session::get('username'));
                        $this->success('添加成功', url('bookinf'));
                    }
                }
                else{
                    $number=$kc['booknum'];
                    $num=$number+$booknum;
                    $data = [ 'libno' => $libno,'booknum' => $num,'libraryno' => $libraryno];
                    $flag = Db::table('kucun')->update($data);
                    if ($flag >= 1) {
                        $this->assign('username', Session::get('username'));
                        $this->success('添加成功', url('bookinf'));
                    }
                }
            }

        }
    }
    public function index()
    {
        if (Session::get('username') != null) {
            $this->assign('username', Session::get('username'));
             $data=Db::table('booktype BookType,bookinformation BookInformation,ctsort CTSort,writer Writer,writing Writing,publish Publish')
                ->where('BookType.BookTypeNo=BookInformation.BookTypeNo and BookInformation.SortNo=CTSort.SortNo and BookInformation.LibNo=Writing.LibNo
                 and Writer.WriNo=Writing.WriNo and Publish.pubNo=BookInformation.pubNo')
                ->field('BookInformation.BookName,BookType.BookTypeName,CTSort.SortCreate,Writer.WriName,BookInformation.WordNum,BookInformation.Price,BookInformation.LibNo,Publish.address')
                ->select();
 			$this->assign('list', $data);
            return view();
        }
    }
	 public function author()
    {
        if (Session::get('username') != null) {
			$list = Db::table('writer')->select();
			 $this->assign('list', $list);
			 $this->assign('username', Session::get('username'));
			 return view();
        }
    }
	 public function addauthor()
    {
        if (Session::get('username') != null) {
			 $data = [ 'WriName' => $_POST['WriName'], 'Contacting' =>$_POST['Contacting']];
            $flag = Db::table('writer')->insert($data);
            if ($flag >= 1) {
                $this->success('添加成功', url('manager/author'));
            }
        }
    }
	public function readtype(){
			if (Session::get('username') != null) {
			$list = Db::table('booktype')->select();
			 $this->assign('list', $list);
			 $this->assign('username', Session::get('username'));
			 return view();
        }
	}
	 public function addreadtype()
    {
        if (Session::get('username') != null) {
			 $data = [ 'booktypename' => $_POST['booktypename'],'booktypeno' => $_POST['booktypeno']];
            $flag = Db::table('booktype')->insert($data);
            if ($flag >= 1) {
                $this->success('添加成功', url('manager/readtype'));
            }
        }
    }
    public function borrowinf(){
        if (Session::get('username') != null) {
            $book=Db::table('book Book, borrowbook BorrowBook,bookinformation BookInformation ,reader Reader')
                ->where('Book.BookId = BorrowBook.BookId and BookInformation.libNo=Book.libNo and Reader.userno=BorrowBook.userno')
                ->select();
            $this->assign('books',$book);
            $this->assign('username', Session::get('username'));
            return view();
        }
    }
    public function fineinf(){
        if (Session::get('username') != null) {
            $book=Db::table('book Book, borrowbook BorrowBook,bookinformation BookInformation ,reader Reader ,finerecord FineRecord')
                ->where('Book.BookId = BorrowBook.BookId and BookInformation.libNo=Book.libNo and Reader.userno=BorrowBook.userno and FineRecord.BookId=Book.BookId')
                ->select();
            $this->assign('books',$book);
            $this->assign('username', Session::get('username'));
            return view();
        }
    }
	public function address(){
			if (Session::get('username') != null) {
			$list = Db::table('address')->select();
			 $this->assign('list', $list);
			 $this->assign('username', Session::get('username'));
			 return view();
        }
	}
	 public function addaddress()
    {
        if (Session::get('username') != null) {
			 $data = [ 'sheng' => $_POST['sheng'],'shi' => $_POST['shi'],'xian' => $_POST['xian']];
            $flag = Db::table('address')->insert($data);
            if ($flag >= 1) {
                $this->success('添加成功', url('manager/address'));
            }
        }
    }
	public function publish(){
			if (Session::get('username') != null) {
			$list = Db::table('publish')->select();
			 $this->assign('list', $list);
			 $this->assign('username', Session::get('username'));
			 return view();
        }
	}
	 public function addpublish()
    {
        if (Session::get('username') != null) {
			 $data = [ 'pubname' => $_POST['pubname'],'address' => $_POST['address'],'contact' => $_POST['contact']];
            $flag = Db::table('publish')->insert($data);
            if ($flag >= 1) {
                $this->success('添加成功', url('manager/publish'));
            }
        }
    }
    public function user(){

        if (Session::get('username') != null) {
            $list = Db::table('users')->select();
            $this->assign('list', $list);
            $this->assign('username', Session::get('username'));
            return view();
        }
    }
    public function adduser(){

        if (Session::get('username') != null) {
            $data = [ 'userno' => $_POST['userno'],'password' => $_POST['password'],'power' => $_POST['power']];
            $flag = Db::table('users')->insert($data);
            if ($flag >= 1) {
                $this->success('添加成功', url('manager/user'));
            }
        }
    }
    public function updateuser(){
        if (Session::get('username') != null) {
            $data = Db::table('users')->where('userno',  $_POST['id'])->select();
            return json($data);
        }
    }
    public function logout()
    {
        if (Session::get('username') != null) {
            Session::delete('username');
            $this->success('注销成功', url('login/index'));
        }
    }
	
}
