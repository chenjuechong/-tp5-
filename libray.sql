-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2019-01-15 11:37:26
-- 服务器版本： 5.7.24-0ubuntu0.16.04.1
-- PHP Version: 7.0.32-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `libray`
--

-- --------------------------------------------------------

--
-- 表的结构 `address`
--

CREATE TABLE `address` (
  `sheng` varchar(50) CHARACTER SET utf8 NOT NULL,
  `shi` varchar(50) CHARACTER SET utf8 NOT NULL,
  `xian` varchar(50) CHARACTER SET utf8 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `address`
--

INSERT INTO `address` (`sheng`, `shi`, `xian`) VALUES
('河北省', '唐山市', '丰润区');

-- --------------------------------------------------------

--
-- 表的结构 `book`
--

CREATE TABLE `book` (
  `BookId` int(50) NOT NULL,
  `libraryno` char(4) DEFAULT NULL,
  `libno` int(50) DEFAULT NULL,
  `statues` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `brokentext` varchar(200) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `book`
--

INSERT INTO `book` (`BookId`, `libraryno`, `libno`, `statues`, `brokentext`) VALUES
(4, 'L001', 1, '空闲', NULL),
(3, 'L001', 1, '空闲', NULL),
(5, 'L003', 1, '空闲', NULL),
(6, 'L003', 1, '借出', NULL),
(7, 'L003', 1, '空闲', NULL),
(9, 'L001', 1, '空闲', NULL),
(10, 'L003', 1, '空闲', NULL),
(11, 'L003', 1, '空闲', NULL),
(12, 'L001', 1, '空闲', NULL),
(26, 'L002', 2, '空闲', NULL),
(25, 'L002', 2, '空闲', NULL),
(24, 'L002', 2, '空闲', NULL),
(23, 'L002', 2, '空闲', NULL),
(22, 'L002', 2, '空闲', NULL),
(21, 'L001', 19, '借出', NULL),
(27, 'L002', 2, '空闲', NULL),
(28, 'L001', 2, '空闲', NULL),
(29, 'L001', 2, '空闲', NULL),
(30, 'L001', 2, '空闲', NULL),
(31, 'L001', 2, '空闲', NULL),
(32, 'L001', 2, '空闲', NULL),
(33, 'L001', 2, '空闲', NULL),
(34, 'L002', 1, '空闲', NULL),
(35, 'L002', 1, '空闲', NULL),
(36, 'L002', 1, '空闲', NULL),
(37, 'L002', 1, '空闲', NULL),
(38, 'L002', 1, '空闲', NULL),
(39, 'L002', 1, '空闲', NULL),
(40, 'L002', 1, '空闲', NULL),
(41, 'L002', 1, '空闲', NULL),
(42, 'L002', 1, '空闲', NULL),
(43, 'L002', 1, '空闲', NULL),
(44, 'L002', 1, '空闲', NULL),
(45, 'L002', 1, '空闲', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `bookinformation`
--

CREATE TABLE `bookinformation` (
  `bookname` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `wordnum` bigint(20) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `libno` int(50) NOT NULL,
  `sortNo` char(4) DEFAULT NULL,
  `booktypeno` char(2) DEFAULT NULL,
  `pubno` char(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `bookinformation`
--

INSERT INTO `bookinformation` (`bookname`, `wordnum`, `price`, `libno`, `sortNo`, `booktypeno`, `pubno`) VALUES
('朝花夕拾', 30000, 15.6, 1, 'AAAA', 'B1', '1'),
('狂人日记', 25000, 69, 2, 'AAAB', 'B1', '1'),
('钢铁', 123, 32, 3, 'AAAB', 'B1', '1'),
('蛙', 11111, 45.6, 4, 'AAAA', 'B2', '1'),
('中华小当家', 2000, 90, 19, 'AAAA', 'B2', '1'),
('邓小平传记', 3000, 20, 20, 'AAAE', 'B1', '1'),
('邓小平传记', 3000, 20, 21, 'AAAE', 'B1', '1'),
('邓小平传记', 33000, 20, 22, 'AAAE', 'B1', '1'),
('邓小平传记', 33000, 20, 23, 'AAAB', 'B2', '1'),
('邓小平传记', 33000, 20, 24, 'AAAB', 'B2', '1'),
('邓小平传记', 30000, 20, 25, 'BBBB', 'B4', '1'),
('白夜行', 26000, 30, 26, 'BBBE', 'B2', '2'),
('三味书屋', 3000, 20, 27, 'AAAB', 'B2', '2'),
('三味书屋', 33000, 20, 28, 'AAAB', 'B1', '2');

-- --------------------------------------------------------

--
-- 表的结构 `booklendtype`
--

CREATE TABLE `booklendtype` (
  `booktypeno` char(2) NOT NULL,
  `readertypeno` char(4) NOT NULL,
  `lendnum` smallint(6) DEFAULT NULL,
  `lenddays` smallint(6) DEFAULT NULL,
  `relendtimes` smallint(6) DEFAULT NULL,
  `relenddays` smallint(6) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED;

--
-- 转存表中的数据 `booklendtype`
--

INSERT INTO `booklendtype` (`booktypeno`, `readertypeno`, `lendnum`, `lenddays`, `relendtimes`, `relenddays`) VALUES
('B1', '1', 12, 90, 1, 30),
('B1', '2', 7, 60, 1, 30),
('B1', '3', 12, 60, 1, 30),
('B1', '4', 10, 60, 1, 30),
('B1', '5', 5, 30, 1, 15),
('B1', '6', 5, 30, 1, 15),
('B2', '1', 3, 60, 1, 30),
('B2', '2', 3, 60, 1, 30),
('B2', '3', 1, 30, 1, 30),
('B2', '4', 3, 60, 1, 30),
('B2', '5', 2, 60, 1, 30),
('B2', '6', 1, 30, 1, 15);

-- --------------------------------------------------------

--
-- 表的结构 `booktype`
--

CREATE TABLE `booktype` (
  `booktypename` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `booktypeno` char(2) CHARACTER SET utf8 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `booktype`
--

INSERT INTO `booktype` (`booktypename`, `booktypeno`) VALUES
('中文图书', 'B1'),
('外文图书', 'B2'),
('情感小说', 'B3'),
('人文小说', 'B4');

-- --------------------------------------------------------

--
-- 表的结构 `borrowbook`
--

CREATE TABLE `borrowbook` (
  `BookId` int(4) NOT NULL,
  `userno` char(4) NOT NULL,
  `Rno` int(4) NOT NULL,
  `lenddays` smallint(6) DEFAULT NULL,
  `Sreturntime` datetime DEFAULT NULL,
  `Treturntime` datetime DEFAULT NULL,
  `ifnextborrow` tinyint(1) DEFAULT NULL,
  `sta` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `borrowId` int(11) NOT NULL,
  `nowDate` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED;

--
-- 转存表中的数据 `borrowbook`
--

INSERT INTO `borrowbook` (`BookId`, `userno`, `Rno`, `lenddays`, `Sreturntime`, `Treturntime`, `ifnextborrow`, `sta`, `borrowId`, `nowDate`) VALUES
(6, '1111', 1, 60, '2019-01-06 13:56:27', '2019-01-14 00:00:00', NULL, '已归还', 1, '2019-01-14 13:56:40'),
(5, '1111', 1, 60, '2019-01-13 13:46:09', '2019-01-14 00:00:00', NULL, '已归还', 1, '2019-01-14 13:46:23'),
(27, '1111', 1, 60, '2019-04-14 00:00:00', '2019-01-14 00:00:00', NULL, '已归还', 1, '2019-01-14 00:00:00'),
(22, '1111', 1, 60, '2019-03-14 00:00:00', '2019-01-13 00:00:00', NULL, '已归还', 1, '2019-01-13 00:00:00'),
(4, '1111', 1, 60, '2019-06-12 00:00:00', '2019-01-14 00:00:00', NULL, '已归还', 1, '2019-01-13 00:00:00'),
(6, 'chen', 2, 60, '2019-03-15 00:00:00', NULL, NULL, '未还', 1, '2019-01-14 00:00:00'),
(21, '1111', 1, 60, '2019-03-15 00:00:00', NULL, NULL, '未还', 1, '2019-01-14 00:00:00'),
(26, '1111', 1, 60, '2019-04-15 00:00:00', '2019-01-15 00:00:00', NULL, '已归还', 1, '2019-01-15 00:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `ctsort`
--

CREATE TABLE `ctsort` (
  `sortNo` char(4) NOT NULL,
  `sortCreate` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `FsortNo` char(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `ctsort`
--

INSERT INTO `ctsort` (`sortNo`, `sortCreate`, `FsortNo`) VALUES
('AAAA', '马克思，恩格斯著作', '1111'),
('AAAB', '列宁著作', '2222'),
('AAAC', '斯大林著作', '3333'),
('AAAD', '毛泽东著作', '4444'),
('AAAE', '邓小平著作著作', '4444'),
('BBBA', '哲学理论', '0000'),
('BBBB', '中国哲学', '1111'),
('BBBC', '非洲哲学', '2222'),
('BBBD', '世界哲学', '2222'),
('BBBE', '亚洲哲学', '2222'),
('BBBF', '欧洲哲学', '2222'),
('BBBG', '每周哲学', '2222');

-- --------------------------------------------------------

--
-- 表的结构 `finerecord`
--

CREATE TABLE `finerecord` (
  `fineno` int(50) NOT NULL,
  `userno` char(4) DEFAULT NULL,
  `Rno` int(50) NOT NULL,
  `finetime` datetime DEFAULT NULL,
  `finermoney` float(8,2) DEFAULT NULL,
  `BookId` int(50) NOT NULL,
  `stat` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `borrowId` int(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED;

--
-- 转存表中的数据 `finerecord`
--

INSERT INTO `finerecord` (`fineno`, `userno`, `Rno`, `finetime`, `finermoney`, `BookId`, `stat`, `borrowId`) VALUES
(12, '1111', 1, NULL, NULL, 5, '暂无罚款', 0),
(12, '1111', 1, NULL, 0.00, 27, '暂无罚款', 0),
(11, '1111', 1, NULL, 0.00, 22, '暂无罚款', 0),
(10, '1111', 1, NULL, 0.00, 4, '暂无罚款', 0),
(13, '1111', 1, NULL, 1.00, 6, '请交罚款', 1),
(14, 'chen', 2, NULL, 0.00, 6, '暂无罚款', 1),
(15, '1111', 1, NULL, 0.00, 21, '暂无罚款', 1),
(16, '1111', 1, NULL, 0.00, 26, '暂无罚款', 1);

-- --------------------------------------------------------

--
-- 表的结构 `kucun`
--

CREATE TABLE `kucun` (
  `libno` char(4) NOT NULL,
  `libraryno` char(4) NOT NULL,
  `booknum` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED;

--
-- 转存表中的数据 `kucun`
--

INSERT INTO `kucun` (`libno`, `libraryno`, `booknum`) VALUES
('1', 'L001', 2),
('1', 'L003', 5),
('19', 'L001', 1),
('2', 'L002', 6),
('2', 'L001', 6),
('1', 'L002', 12);

-- --------------------------------------------------------

--
-- 表的结构 `library`
--

CREATE TABLE `library` (
  `libraryno` char(4) NOT NULL,
  `libraryname` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `description` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `library`
--

INSERT INTO `library` (`libraryno`, `libraryname`, `description`, `phone`) VALUES
('L001', 'A图书馆', '侧重于经济管理，综合类', '1111111'),
('L002', 'B图书馆', '侧重于理工，计算机类', '2222222'),
('L003', 'C图书馆', '侧重于法学,外语,体育,艺术,音乐等方面', '3333333');

-- --------------------------------------------------------

--
-- 表的结构 `manager`
--

CREATE TABLE `manager` (
  `userno` char(4) NOT NULL,
  `managerno` char(4) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `managername` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `publish`
--

CREATE TABLE `publish` (
  `pubno` int(50) NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `pubname` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `contact` varchar(255) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `publish`
--

INSERT INTO `publish` (`pubno`, `address`, `pubname`, `contact`) VALUES
(1, '福建省厦门市集美区', '上海人民出版社', '123456'),
(2, '浙江省温州市', '浙江出版社', '1897461234'),
(3, '北京市', '北京出版社', '18942314512');

-- --------------------------------------------------------

--
-- 表的结构 `reader`
--

CREATE TABLE `reader` (
  `userno` char(4) NOT NULL,
  `Rno` int(4) NOT NULL,
  `readertypeno` char(4) DEFAULT NULL,
  `workno` char(4) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `Rname` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `type` char(2) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `stat` varchar(11) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `reader`
--

INSERT INTO `reader` (`userno`, `Rno`, `readertypeno`, `workno`, `password`, `Rname`, `type`, `email`, `stat`) VALUES
('1111', 1, '4', '2', '123', '宋俊2', NULL, '2509004241@qq.com', '空闲'),
('chen', 2, '3', NULL, '123', '陈珏崇', '2', NULL, '空闲');

-- --------------------------------------------------------

--
-- 表的结构 `readertype`
--

CREATE TABLE `readertype` (
  `readertypename` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `readertypeno` int(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `readertype`
--

INSERT INTO `readertype` (`readertypename`, `readertypeno`) VALUES
('教师', 1),
('研究人员', 2),
('离退休人员', 3),
('博士研究生', 4),
('硕士研究生', 5),
('本专科学生', 6),
(NULL, 7);

-- --------------------------------------------------------

--
-- 表的结构 `users`
--

CREATE TABLE `users` (
  `userno` char(4) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `power` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `users`
--

INSERT INTO `users` (`userno`, `password`, `power`) VALUES
('M000', '123', 1),
('1111', '123', 0),
('r009', '1234', 1),
('chen', '123', 0);

-- --------------------------------------------------------

--
-- 表的结构 `working`
--

CREATE TABLE `working` (
  `workno` int(4) NOT NULL,
  `workname` varchar(20) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `working`
--

INSERT INTO `working` (`workno`, `workname`) VALUES
(1, '校长室'),
(2, '团委办公室'),
(3, '文艺部'),
(4, '辅导员办公室'),
(6, '文艺部'),
(7, ' ');

-- --------------------------------------------------------

--
-- 表的结构 `writer`
--

CREATE TABLE `writer` (
  `WriNo` int(50) NOT NULL,
  `WriName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Contacting` varchar(255) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `writer`
--

INSERT INTO `writer` (`WriNo`, `WriName`, `Contacting`) VALUES
(1, '鲁迅', '3125891'),
(2, '莫言', '3846664'),
(3, '余华', '5469862'),
(4, '奥斯特洛夫斯基', '7568942'),
(5, '高尔基', '1895982314');

-- --------------------------------------------------------

--
-- 表的结构 `writing`
--

CREATE TABLE `writing` (
  `libno` char(4) NOT NULL,
  `WriNo` char(4) NOT NULL,
  `role` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `writing`
--

INSERT INTO `writing` (`libno`, `WriNo`, `role`) VALUES
('1', '1', '0'),
('2', '2', '0'),
('3', '3', '0'),
('4', '4', '0'),
('19', '2', '0'),
('28', '1', '0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`BookId`) USING BTREE;

--
-- Indexes for table `bookinformation`
--
ALTER TABLE `bookinformation`
  ADD PRIMARY KEY (`libno`) USING BTREE;

--
-- Indexes for table `booklendtype`
--
ALTER TABLE `booklendtype`
  ADD PRIMARY KEY (`booktypeno`,`readertypeno`) USING BTREE;

--
-- Indexes for table `booktype`
--
ALTER TABLE `booktype`
  ADD PRIMARY KEY (`booktypeno`) USING BTREE;

--
-- Indexes for table `borrowbook`
--
ALTER TABLE `borrowbook`
  ADD PRIMARY KEY (`BookId`,`userno`,`Rno`,`borrowId`) USING BTREE;

--
-- Indexes for table `ctsort`
--
ALTER TABLE `ctsort`
  ADD PRIMARY KEY (`sortNo`) USING BTREE;

--
-- Indexes for table `finerecord`
--
ALTER TABLE `finerecord`
  ADD PRIMARY KEY (`fineno`,`Rno`,`BookId`,`borrowId`) USING BTREE;

--
-- Indexes for table `kucun`
--
ALTER TABLE `kucun`
  ADD PRIMARY KEY (`libno`,`libraryno`) USING BTREE;

--
-- Indexes for table `library`
--
ALTER TABLE `library`
  ADD PRIMARY KEY (`libraryno`) USING BTREE;

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`userno`,`managerno`) USING BTREE;

--
-- Indexes for table `publish`
--
ALTER TABLE `publish`
  ADD PRIMARY KEY (`pubno`) USING BTREE;

--
-- Indexes for table `reader`
--
ALTER TABLE `reader`
  ADD PRIMARY KEY (`userno`,`Rno`) USING BTREE;

--
-- Indexes for table `readertype`
--
ALTER TABLE `readertype`
  ADD PRIMARY KEY (`readertypeno`) USING BTREE;

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userno`) USING BTREE;

--
-- Indexes for table `working`
--
ALTER TABLE `working`
  ADD PRIMARY KEY (`workno`) USING BTREE;

--
-- Indexes for table `writer`
--
ALTER TABLE `writer`
  ADD PRIMARY KEY (`WriNo`) USING BTREE;

--
-- Indexes for table `writing`
--
ALTER TABLE `writing`
  ADD PRIMARY KEY (`libno`,`WriNo`) USING BTREE;

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `book`
--
ALTER TABLE `book`
  MODIFY `BookId` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- 使用表AUTO_INCREMENT `bookinformation`
--
ALTER TABLE `bookinformation`
  MODIFY `libno` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- 使用表AUTO_INCREMENT `borrowbook`
--
ALTER TABLE `borrowbook`
  MODIFY `borrowId` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `finerecord`
--
ALTER TABLE `finerecord`
  MODIFY `fineno` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- 使用表AUTO_INCREMENT `publish`
--
ALTER TABLE `publish`
  MODIFY `pubno` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `reader`
--
ALTER TABLE `reader`
  MODIFY `Rno` int(4) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `readertype`
--
ALTER TABLE `readertype`
  MODIFY `readertypeno` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- 使用表AUTO_INCREMENT `working`
--
ALTER TABLE `working`
  MODIFY `workno` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- 使用表AUTO_INCREMENT `writer`
--
ALTER TABLE `writer`
  MODIFY `WriNo` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
