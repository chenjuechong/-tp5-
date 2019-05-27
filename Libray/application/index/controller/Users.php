<?php
/**
 * Created by PhpStorm.
 * User: God
 * Date: 2018/9/19
 * Time: 22:40
 */

namespace app\index\controller;

use think\Controller;
use think\Db;
use think\helper\Time;
use think\Request;
use think\Session;

class Users extends Controller{
    public function index(){
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
    public function bookdetail(){
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
    public function searchbook(){
        if (Session::get('username') != null){
            $data=Db::table('booktype BookType,bookinformation BookInformation,ctsort CTSort,writer Writer,writing Writing')
                ->where('BookType.BookTypeNo=BookInformation.BookTypeNo and BookInformation.SortNo=CTSort.SortNo and BookInformation.LibNo=Writing.LibNo
                 and Writer.WriNo=Writing.WriNo')
                ->field('BookInformation.BookName,BookType.BookTypeName,CTSort.SortCreate,Writer.WriName')
                ->select();
            $BookType=Db::table('booktype')->select();
            $Publish=Db::table('publish')->select();
            $CTSort=Db::table('ctSort')->select();
            $this->assign('Publish', $Publish);
            $this->assign('BookType', $BookType);
            $this->assign('CTSort', $CTSort);
            $this->assign('list', $data);
            $this->assign('username', Session::get('username'));
            return view();
        }
    }
    public function self(){
        if (Session::get('username') != null) {
            $userno=Session::get('username');
            $reader=Db::table('reader reader,working working,readertype readerType')
                ->where('userno',$userno)
                ->where('reader.readerTypeNo=readerType.readerTypeNo and reader.workNo=working.workNo')
                ->select();
            $readertype=Db::table('readertype')->select();
            $working=Db::table('working')->select();
            $this->assign('reader', $reader);
            $this->assign('working', $working);
            $this->assign('readertype', $readertype);
            $this->assign('username', Session::get('username'));
            return view();
        }
    }
    public function updatereader(){
        if (Session::get('username') != null) {
            $data = [ 'Rno' => $_POST['Rno'],'Rname' => $_POST['Rname'], 'readertypeno' =>$_POST['readertypeno'],'workno' =>$_POST['workno'],'email' =>$_POST['email'],'userno'=>Session::get('username')];
            $flag = Db::table('reader')->update($data);
            if($flag>=1)
                $this->success('修改成功', url('users/self'));
        }
    }
    public function borrowbook(){
        $libno=$_GET['libno'];
        if (Session::get('username') != null) {
            $books=Db::table('book Book,library library,kucun kuCun,bookinformation BookInformation')
                ->where('kuCun.libNo=Book.libNo and kuCun.libraryNo=library.LibraryNo and BookInformation.libNo=Book.libNo and library.libraryNo=Book.libraryNo')
                ->field('Book.BookId,BookInformation.BookName,BookInformation.libNo,Book.statues,Book.brokenText,library.LibraryName')
                ->where('BookInformation.LibNo',$libno)
                ->select();
            $this->assign('books', $books);
            $this->assign('username', Session::get('username'));
            return view();
        }
    }
    public function doborrow(){
        $bookid=$_GET['bookid'];
        if (Session::get('username') != null) {
            $this->assign('username', Session::get('username'));
            $readers=Db::table('reader')->where('userno',Session::get('username'))->select();
            foreach ($readers as $reader){
                $readertypeno=$reader['readertypeno'];
                $Rno=$reader['Rno'];
                $books=Db::table('book Book,bookinformation BookInformation')
                    ->where('BookInformation.libNo=Book.libNo')
                    ->where('Book.BookId',$bookid)->select();
                foreach ($books as $book){
                    $booktypeno=$book['booktypeno'];
                    $lend=Db::table('booklendtype')
                        ->where('bookTypeNo',$booktypeno)
                        ->where('readerTypeNo',$readertypeno)
                        ->select();
                    foreach ($lend as $value){
                        $now=date("Y-m-d");
                        $days=$value['lenddays'];
                        $result=date('Y-m-d', strtotime("+$days day"));
                        Db::startTrans();
                        try{
                            $data=[ 'Rno' => $Rno,'BookId' =>$bookid, 'userno'=>Session::get('username'),'lenddays'=>$value['lenddays'],
                            'nowDate'=>$now ,'Sreturntime'=> $result, 'sta'=> '未还'] ;
                            $flag = Db::table('borrowbook')->insert($data);
                            $book=Db::table('book Book, borrowbook BorrowBook,bookinformation BookInformation')
                                ->where('Book.BookId = BorrowBook.BookId and BookInformation.libNo=Book.libNo ')
                                ->where('BorrowBook.userno',Session::get('username'))
                                ->where('BorrowBook.BookId',$bookid)
                                ->select();
                            foreach ($book as $b) {
                                $d = ['Rno' => $Rno, 'BookId' => $bookid, 'userno' => Session::get('username'), 'stat' => '暂无罚款', 'borrowId' =>$b['borrowId'],
                                    'finermoney'=>0 ] ;
                            }
                            $ff=Db::table('book')->where('BookId', $bookid)->update(['statues' => '借出']);
                            $f=Db::table('finerecord')->insert($d);
                        } catch (\Exception $e) {
                            // 回滚事务
                            Db::rollback();
                        }
                        if( $flag>=1 && $f>=1 && $ff>=1)
                            $this->success('借阅成功', url('index'));

                    }

                }
            }

        }
    }
    public function returnbook(){
        if (Session::get('username') != null) {
            $sta="未还";
            $book=Db::table('book Book, borrowbook BorrowBook,bookinformation BookInformation')
                ->where('Book.BookId = BorrowBook.BookId and BookInformation.libNo=Book.libNo ')
                ->where('BorrowBook.userno',Session::get('username'))
                ->where('BorrowBook.sta',$sta)
                ->select();
            $this->assign('books',$book);
            $this->assign('username', Session::get('username'));
            return view();
        }
    }
    public function doreturn(){
        $bookid=$_GET['bookid'];
        $bbid=$_GET['bbid'];
        if (Session::get('username') != null) {
            $this->assign('username', Session::get('username'));
            $borrowbooks=Db::table('borrowbook')
                ->where('userno',Session::get('username'))
                ->where('BookId',$bookid)
                ->where('borrowId',$bbid)
                ->select();
            foreach ($borrowbooks as $borrowbook){
                $now=date("Y-m-d");
                Db::startTrans();
                try{
                    Db::table('book')->where('BookId', $bookid)->update(['statues' => '空闲']);
                    Db::table('borrowbook')
                        ->where('userno',Session::get('username'))
                        ->where('BookId',$bookid)
                        ->where('borrowId',$bbid)
                        ->update(['sta' => '已归还','Treturntime'=>$now]);
                } catch (\Exception $e) {
                    // 回滚事务
                    Db::rollback();
                }
                $st=$borrowbook['Sreturntime'];
                if($st>=$now){
                    $this->success('还书成功', url('returnbook'));
                }
                else{
                    Db::table('finerecord')
                        ->where('userno',Session::get('username'))
                        ->where('BookId',$bookid)
                        ->where('borrowId',$bbid)
                        ->update(['stat' => '请交罚款','finermoney'=>1.00]);
                    $this->success('未按时还书，请提交罚款', url('finerecord'));
                }

            }
        }

    }
    public function borrowrecord(){
        if (Session::get('username') != null) {
            $book=Db::table('book Book, borrowbook BorrowBook,bookinformation BookInformation')
                ->where('Book.BookId = BorrowBook.BookId and BookInformation.libNo=Book.libNo ')
                ->where('BorrowBook.userno',Session::get('username'))
                ->select();
            $this->assign('books',$book);
            $this->assign('username', Session::get('username'));
            return view();
        }
    }
    public function finerecord(){
        if (Session::get('username') != null) {
            $book=Db::table('book Book,bookinformation BookInformation ,finerecord FineRecord  ,borrowbook BorrowBook')
                ->where('Book.BookId = FineRecord.BookId and BookInformation.libNo=Book.libNo and BorrowBook.BookId=Book.BookId ')
                ->where('FineRecord.userno',Session::get('username'))
                ->select();
            $this->assign('books',$book);
            $this->assign('username', Session::get('username'));
            return view();
        }
    }
    public function reborrow(){
        $bookid=$_GET['bookid'];
        $bbid=$_GET['bbid'];
        if (Session::get('username') != null) {
            $this->assign('username', Session::get('username'));
            $borrowbooks=Db::table('borrowbook')
                ->where('userno',Session::get('username'))
                ->where('BookId',$bookid)
                ->where('borrowId',$bbid)
                ->select();
           foreach ($borrowbooks as $borrowbook) {
               $date=$borrowbook['Sreturntime'];
               $i=strtotime ($date);
               $d=date($i);
               $result=date('Y-m-d H:i:s', strtotime("+30 day",$d));
               Db::startTrans();
               try{
                   $i=Db::table('borrowbook')
                       ->where('userno',Session::get('username'))
                       ->where('BookId',$bookid)
                       ->where('borrowId',$bbid)
                       ->update(['Sreturntime' => $result]);
               } catch (\Exception $e) {
                   // 回滚事务
                   Db::rollback();
               }
               if($i>=1)
               $this->success('续借成功', url('returnbook'));

           }
        }
    }
    public function logout(){
        if(Session::get('username')!=null) {
            Session::delete('username');
            $this->success('注销成功', url('login/index'));
        }
    }


}
