-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 23, 2017 at 10:38 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `commentsection`
--

-- --------------------------------------------------------

--
-- Table structure for table `allcourses`
--

CREATE TABLE `allcourses` (
  `courseCode` varchar(15) NOT NULL,
  `courseTitle` varchar(128) NOT NULL,
  `ects` int(11) NOT NULL DEFAULT '5',
  `year` int(4) NOT NULL,
  `semester` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Computer Science Four Year Program';

--
-- Dumping data for table `allcourses`
--

INSERT INTO `allcourses` (`courseCode`, `courseTitle`, `ects`, `year`, `semester`) VALUES
('CoSc1011', 'Introduction to Computer Science', 6, 1, 1),
('CoSc1012', 'Fundamentals of Programming I', 5, 1, 1),
('CoSc1013', 'Fundamentals of Programming II', 5, 1, 2),
('CoSc2021', 'Object Oriented Programming', 6, 2, 1),
('CoSc2022', 'Data Structures and Algorithms', 6, 2, 1),
('CoSc2023', 'Advanced Programming', 6, 3, 1),
('CoSc2031', 'Computer Organization and Architecture', 5, 2, 1),
('CoSc2032', 'Operating Systems', 6, 2, 2),
('CoSc2033', 'Microporcessor and Assembly Language', 5, 2, 2),
('CoSc2041', 'Computer Networking and Data Communication', 6, 2, 2),
('CoSc2042', 'Wireless Communication and Mobile Computing', 5, 3, 2),
('CoSc2043', 'Network and System Administration', 5, 3, 2),
('CoSc3051', 'Fundamentals of Database', 6, 2, 2),
('CoSc3052', 'Advanced Database Systems', 6, 3, 1),
('CoSc3061', 'Formal Language and Automat Theory', 5, 3, 2),
('CoSc3062', 'Compiler Design', 6, 4, 1),
('CoSc3071', 'Fundamentals of Software Engineering', 5, 3, 1),
('CoSc3072', 'Object Oriented Software Engineering', 5, 3, 2),
('CoSc3081', 'Introduction ot Artificial Intelligence', 6, 3, 2),
('CoSc3091', 'Internet Programming', 7, 3, 1),
('CoSc3101', 'Computer Graphics', 5, 4, 1),
('CoSc3102', 'Human Computer Interaction', 5, 4, 2),
('CoSc4111', 'Analysis of Algorithms', 5, 4, 1),
('CoSc4112', 'Complexity Theory', 5, 4, 2),
('CoSc4121', 'Technical Report Writing in Computer Science', 4, 4, 1),
('CoSc4122', 'Final Project', 6, 4, 1),
('CoSc4123', 'Final Project II', 6, 4, 2),
('CoSc4141', 'Selected topics in Computer Science', 5, 4, 1),
('CoSc4151', 'Elective I(one course)/Windows Programming', 5, 3, 1),
('CoSc4152', 'Elective II(one course)/Multimedia', 5, 4, 2),
('CoSc4161', 'Introduction to Distributed Systems', 5, 4, 2),
('CoSc4171', 'Computer Security', 5, 4, 2),
('CvEt1031', 'Civics and Ethical Educati6n', 5, 1, 1),
('ECEG1351', 'Operating Systemsity6and Electronic Devices', 5, 1, 1),
('ECEG1352', 'Digital Electronics', 5, 1, 2),
('EnLan1021', 'Communicative English Skills', 5, 1, 1),
('EnLan1022', 'Basic Writing Skills', 5, 1, 2),
('Math1012', 'Linear Algebra', 5, 1, 1),
('Math2021', 'Calculs I', 7, 1, 2),
('Math2231', 'Discrete mathematics and Combinatorics', 5, 2, 1),
('MAth3221', 'Applied Numerical Analysis', 5, 1, 2),
('Mgmt3101', 'Enterpreneurship and Small Business Managment', 5, 2, 1),
('Phil1032', 'Introduction to Logic(Reasoning Skill)', 5, 1, 2),
('Stat2181', 'Introduction to Statics', 5, 2, 1),
('Stat2182', 'Introduction to Probability', 5, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `cid` int(11) NOT NULL,
  `uid` varchar(128) NOT NULL,
  `date` datetime NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`cid`, `uid`, `date`, `message`) VALUES
(6, 'anonymous', '2017-05-10 13:47:52', 'There is no class on Thursday May 11 2017 ! '),
(7, 'anonymous', '2017-05-10 13:52:25', 'African 811 is looking for students who are good at web development for the Intern ship. Please register your names if you are interested to Hayemanot at the Computer Science Department.'),
(8, 'anonymous', '2017-05-10 14:10:45', 'Hi');

-- --------------------------------------------------------

--
-- Table structure for table `courseChat`
--

CREATE TABLE `courseChat` (
  `courseChatID` int(11) NOT NULL,
  `courseRegistredID` int(11) NOT NULL,
  `year` int(4) NOT NULL,
  `message` text NOT NULL,
  `courseCode` varchar(15) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courseChat`
--

INSERT INTO `courseChat` (`courseChatID`, `courseRegistredID`, `year`, `message`, `courseCode`, `date`) VALUES
(1, 1, 2007, 'Lorem\r\nipsum dolor sit amet, consectetur adipisicing elit. Veritatis commodi ratione\r\ndicta laborum consequatur eaque ea voluptate iure cupiditate aperiam sapiente\r\nperspiciatis architecto qui obcaecati, perferendis distinctio non facere\r\nhic?', 'CoSc3072', '2017-05-20 18:55:29'),
(2, 2, 2006, 'Lorem\r\nipsum dolor sit amet, consectetur adipisicing elit. Totam, ipsa vel doloribus\r\naliquam? Explicabo aut veniam voluptatum et nostrum dolore, autem reiciendis a\r\nassumenda. Odio blanditiis eligendi, mollitia labore\r\nconsequuntur.', 'CoSc4171', '2017-05-20 18:55:29'),
(3, 3, 2008, 'Lorem\r\nipsum dolor sit amet, consectetur adipisicing elit. Consequatur dicta minus\r\ntempore cum repellendus nihil dolores consectetur libero inventore obcaecati\r\nmaiores, debitis sunt, ea ipsum non magnam animi saepe, beatae.', 'CoSc3051', '2017-05-20 18:55:29'),
(4, 4, 2009, 'Lorem ipsum dolor sit amet,\r\nconsectetur adipisicing elit. Libero cum laborum non, labore repellendus\r\nmolestiae aperiam officia, animi inventore consequuntur reprehenderit\r\nlaboriosam adipisci vitae dicta, eligendi. Recusandae atque excepturi,\r\nat.', 'CoSc1013', '2017-05-20 18:55:30'),
(5, 5, 2007, 'Lorem ipsum doret alar fegea dlent dmenad waes orisp oosrei tndwet ', 'CoSc3072', '2017-05-20 20:56:29');

-- --------------------------------------------------------

--
-- Table structure for table `courseGroupAdmins`
--

CREATE TABLE `courseGroupAdmins` (
  `courseCode` varchar(15) NOT NULL,
  `courseAdminID` int(11) NOT NULL,
  `instructorID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courseGroupAdmins`
--

INSERT INTO `courseGroupAdmins` (`courseCode`, `courseAdminID`, `instructorID`) VALUES
('Cosc3072', 1, 1010),
('CoSc4171', 2, 1020),
('CoSc1013', 3, 1030),
('CoSc3051', 4, 1040);

-- --------------------------------------------------------

--
-- Table structure for table `courseRegistred`
--

CREATE TABLE `courseRegistred` (
  `courseRegistredID` int(11) NOT NULL,
  `studentId` varchar(11) NOT NULL,
  `courseCode` varchar(15) NOT NULL,
  `seme` int(1) NOT NULL,
  `courseAdminID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courseRegistred`
--

INSERT INTO `courseRegistred` (`courseRegistredID`, `studentId`, `courseCode`, `seme`, `courseAdminID`) VALUES
(1, 'NSR/1234/07', 'CoSc3072', 2, 1),
(2, 'NSR/4321/06', 'CoSc4171', 2, 2),
(3, 'NSR/3241/08', 'CoSc3051', 2, 4),
(4, 'NSR/2134/09', 'CoSc1013', 2, 3),
(5, 'NSR/9876/07', 'CoSc3072', 2, 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `courseTaking`
--
CREATE TABLE `courseTaking` (
`courseTitle` varchar(128)
,`fullName` varchar(50)
,`studentId` varchar(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `instructors`
--

CREATE TABLE `instructors` (
  `instructorID` int(11) NOT NULL,
  `instructorName` varchar(50) NOT NULL,
  `passkey` varchar(128) NOT NULL,
  `courseCode` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `instructors`
--

INSERT INTO `instructors` (`instructorID`, `instructorName`, `passkey`, `courseCode`) VALUES
(1010, 'AYALEW BELETE', 'ayalwe.belete', 'Cosc3072'),
(1020, 'LEYKUN BELAYE', 'leykun.belaye', 'CoSc4171'),
(1030, 'GASHAWE TESGAYE', 'gashawe.tesgaye', 'CoSc1013'),
(1040, 'BETTY KEFYALEW', 'betty.kefyalew', 'CoSc3051');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `nid` int(10) UNSIGNED NOT NULL,
  `uid` int(11) UNSIGNED NOT NULL,
  `date` datetime NOT NULL,
  `message` text NOT NULL,
  `tag` varchar(8) NOT NULL DEFAULT 'All'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`nid`, `uid`, `date`, `message`, `tag`) VALUES
(4, 1, '2017-05-10 14:28:13', 'Final exam period is from June 12 - 23 2017. You schedule has been posted on the library notification board and check according to your department.', 'all'),
(11, 2, '2017-05-11 14:22:49', 'Now it works!\r\n', 'first'),
(12, 1, '2017-05-13 13:50:14', 'Changed to 3rd Year! EDITED BY PGCO\r\nNew updated post notification!\r\nUpdate added!!\r\nEdited on May 14\r\n', 'third'),
(16, 2, '2017-05-14 03:46:07', 'POSTED BY ADMIN\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'second'),
(17, 2, '2017-05-14 04:44:41', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'all'),
(22, 2, '2017-05-14 05:03:11', 'Final exam period is from June 12 - 23 2017. You schedule has been posted on the library notification board and check according to your department.', 'third'),
(23, 2, '2017-05-14 05:28:29', 'UPDATED BY PROGRAM COORDINATOR.\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ', 'second'),
(24, 1, '2017-05-14 06:01:08', 'Object oriented software engineering EXAM 2\r\nPlace B2\r\nTime 10:00 AM\r\n', 'second'),
(29, 2, '2017-05-15 03:37:27', 'POSTED BY PROGRAM COORDINATOR\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'third'),
(30, 2, '2017-05-15 03:37:27', 'POSTED BY PROGRAM COORDINATOR\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'third'),
(31, 2, '2017-05-15 03:40:37', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'third'),
(32, 2, '2017-05-15 03:42:59', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'fourth'),
(34, 2, '2017-05-16 05:46:03', 'Posted from tablet via web browser', 'fourth'),
(35, 2, '2017-05-20 10:43:55', 'Test multiple user login', 'third'),
(36, 1, '2017-05-20 01:13:59', 'Time check', 'third'),
(37, 1, '2017-05-20 01:13:59', 'Time check', 'third'),
(38, 1, '2017-05-20 01:13:59', 'Time check', 'third'),
(39, 1, '2017-05-20 01:13:59', 'Time check', 'third'),
(40, 1, '2017-05-20 01:13:59', 'Time check', 'third'),
(41, 1, '2017-05-20 01:13:59', 'Time check', 'third'),
(42, 1, '2017-05-20 01:13:59', 'Time check', 'third'),
(43, 1, '2017-05-20 01:13:59', 'Time check', 'third'),
(44, 1, '2017-05-20 01:13:59', 'Time check', 'third'),
(45, 1, '2017-05-20 01:13:59', 'Time check', 'third'),
(46, 1, '2017-05-20 01:13:59', 'Time check', 'third'),
(47, 1, '2017-05-20 01:13:59', 'Time check', 'third'),
(48, 1, '2017-05-20 01:13:59', 'Time check', 'third'),
(49, 1, '2017-05-20 01:13:59', 'Time check', 'third'),
(50, 1, '2017-05-20 01:13:59', 'Time check', 'third'),
(51, 1, '2017-05-20 01:13:59', 'Time check', 'third'),
(52, 1, '2017-05-20 01:13:59', 'Time check', 'third'),
(53, 1, '2017-05-20 01:24:17', 'Checking timestamp', 'all');

-- --------------------------------------------------------

--
-- Stand-in structure for view `registredStudents`
--
CREATE TABLE `registredStudents` (
`fullname` varchar(50)
,`courseTitle` varchar(128)
,`instructorName` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `studentId` varchar(11) NOT NULL,
  `fullName` varchar(50) NOT NULL,
  `passkey` varchar(128) NOT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `yearOfEntry` int(4) NOT NULL,
  `year` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`studentId`, `fullName`, `passkey`, `gender`, `yearOfEntry`, `year`) VALUES
('NSR/1234/07', 'ABEBE KEBEDE CHANNEY', 'abebe.kebede', 'Male', 2007, 3),
('NSR/2134/09', 'EPHREME BELETE ZELALEME', 'ephreme.belete', 'Male', 2009, 1),
('NSR/3241/08', 'CHALTU DOGA ABENET', 'chaltu.doga', 'Female', 2008, 2),
('NSR/4321/06', 'BEREKET DENDENA EPHREME', 'bereket.dendena', 'Male', 2006, 4),
('NSR/9876/07', 'GEZU BEZU BEZEBEZU', 'gezu.bezu', 'Male', 2007, 3);

-- --------------------------------------------------------

--
-- Stand-in structure for view `studentComment`
--
CREATE TABLE `studentComment` (
`fullname` varchar(50)
,`courseTitle` varchar(128)
,`message` text
,`date` datetime
,`year` int(4)
);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) UNSIGNED NOT NULL,
  `fullname` varchar(128) NOT NULL,
  `usrname` varchar(128) NOT NULL,
  `passkey` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `fullname`, `usrname`, `passkey`) VALUES
(1, 'Department Chair', 'DC', 'admin'),
(2, 'Program Coordinator', 'PGCO', '123');

-- --------------------------------------------------------

--
-- Structure for view `courseTaking`
--
DROP TABLE IF EXISTS `courseTaking`;

CREATE ALGORITHM=MERGE DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `courseTaking`  AS  select `allcourses`.`courseTitle` AS `courseTitle`,`student`.`fullName` AS `fullName`,`student`.`studentId` AS `studentId` from ((`courseRegistred` join `allcourses`) join `student`) where ((`courseRegistred`.`courseCode` = `allcourses`.`courseCode`) and (`courseRegistred`.`studentId` = `student`.`studentId`)) ;

-- --------------------------------------------------------

--
-- Structure for view `registredStudents`
--
DROP TABLE IF EXISTS `registredStudents`;

CREATE ALGORITHM=MERGE DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `registredStudents`  AS  select `student`.`fullName` AS `fullname`,`allcourses`.`courseTitle` AS `courseTitle`,`instructors`.`instructorName` AS `instructorName` from ((((`student` join `allcourses`) join `courseRegistred`) join `courseGroupAdmins`) join `instructors`) where ((`student`.`studentId` = `courseRegistred`.`studentId`) and (`courseRegistred`.`courseCode` = `allcourses`.`courseCode`) and (`courseGroupAdmins`.`courseAdminID` = `courseRegistred`.`courseAdminID`) and (`courseGroupAdmins`.`courseCode` = `allcourses`.`courseCode`) and (`instructors`.`courseCode` = `allcourses`.`courseCode`)) ;

-- --------------------------------------------------------

--
-- Structure for view `studentComment`
--
DROP TABLE IF EXISTS `studentComment`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `studentComment`  AS  select `student`.`fullName` AS `fullname`,`allcourses`.`courseTitle` AS `courseTitle`,`courseChat`.`message` AS `message`,`courseChat`.`date` AS `date`,`courseChat`.`year` AS `year` from (((`courseChat` join `courseRegistred`) join `allcourses`) join `student`) where ((`courseRegistred`.`courseCode` = `allcourses`.`courseCode`) and (`courseChat`.`courseRegistredID` = `courseRegistred`.`courseRegistredID`) and (`courseRegistred`.`studentId` = `student`.`studentId`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `allcourses`
--
ALTER TABLE `allcourses`
  ADD PRIMARY KEY (`courseCode`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`cid`),
  ADD UNIQUE KEY `cid` (`cid`);

--
-- Indexes for table `courseChat`
--
ALTER TABLE `courseChat`
  ADD PRIMARY KEY (`courseChatID`),
  ADD KEY `FK_CrsRegID` (`courseRegistredID`),
  ADD KEY `courseCode` (`courseCode`);

--
-- Indexes for table `courseGroupAdmins`
--
ALTER TABLE `courseGroupAdmins`
  ADD PRIMARY KEY (`courseAdminID`),
  ADD KEY `FK_CrsCode` (`courseCode`),
  ADD KEY `FK_InsID` (`instructorID`);

--
-- Indexes for table `courseRegistred`
--
ALTER TABLE `courseRegistred`
  ADD PRIMARY KEY (`courseRegistredID`),
  ADD KEY `courseCode` (`courseCode`),
  ADD KEY `studentId` (`studentId`),
  ADD KEY `FK_CrAdminID` (`courseAdminID`);

--
-- Indexes for table `instructors`
--
ALTER TABLE `instructors`
  ADD PRIMARY KEY (`instructorID`),
  ADD KEY `courseCode` (`courseCode`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`nid`),
  ADD KEY `FK_UsrID` (`uid`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`studentId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `courseChat`
--
ALTER TABLE `courseChat`
  MODIFY `courseChatID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `courseGroupAdmins`
--
ALTER TABLE `courseGroupAdmins`
  MODIFY `courseAdminID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `courseRegistred`
--
ALTER TABLE `courseRegistred`
  MODIFY `courseRegistredID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `nid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `courseChat`
--
ALTER TABLE `courseChat`
  ADD CONSTRAINT `FK_CrsRegID` FOREIGN KEY (`courseRegistredID`) REFERENCES `courseRegistred` (`courseRegistredID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `courseChat_ibfk_2` FOREIGN KEY (`courseCode`) REFERENCES `allcourses` (`courseCode`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `courseGroupAdmins`
--
ALTER TABLE `courseGroupAdmins`
  ADD CONSTRAINT `FK_CrsCode` FOREIGN KEY (`courseCode`) REFERENCES `allcourses` (`courseCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_InsID` FOREIGN KEY (`instructorID`) REFERENCES `instructors` (`instructorID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `courseRegistred`
--
ALTER TABLE `courseRegistred`
  ADD CONSTRAINT `FK_CrAdminID` FOREIGN KEY (`courseAdminID`) REFERENCES `courseGroupAdmins` (`courseAdminID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `courseRegistred_ibfk_1` FOREIGN KEY (`courseCode`) REFERENCES `allcourses` (`courseCode`),
  ADD CONSTRAINT `courseRegistred_ibfk_2` FOREIGN KEY (`studentId`) REFERENCES `student` (`studentId`);

--
-- Constraints for table `instructors`
--
ALTER TABLE `instructors`
  ADD CONSTRAINT `instructors_ibfk_1` FOREIGN KEY (`courseCode`) REFERENCES `allcourses` (`courseCode`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `FK_UsrID` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
