-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 19, 2024 at 12:30 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `evaluation_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `academic_list`
--

CREATE TABLE `academic_list` (
  `id` int(30) NOT NULL,
  `year` text NOT NULL,
  `semester` int(30) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 0 COMMENT '0=Pending,1=Start,2=Closed'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `academic_list`
--

INSERT INTO `academic_list` (`id`, `year`, `semester`, `is_default`, `status`) VALUES
(1, '2019-2020', 1, 1, 2),
(2, '2019-2020', 2, 0, 1),
(3, '2020-2021', 1, 0, 2),
(4, '2023-2024', 1, 0, 2),
(5, '2022-2023', 1, 0, 2),
(10, '2023-2024', 2, 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `class_list`
--

CREATE TABLE `class_list` (
  `id` int(30) NOT NULL,
  `curriculum` text NOT NULL,
  `level` text NOT NULL,
  `section` text NOT NULL,
  `class_code` varchar(10) NOT NULL,
  `faculty_id` varchar(100) NOT NULL,
  `subject_id` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `class_list`
--

INSERT INTO `class_list` (`id`, `curriculum`, `level`, `section`, `class_code`, `faculty_id`, `subject_id`) VALUES
(10, 'BSCRIM', '2', 'D', 'VKfNuQaW', '2', '1,3'),
(13, 'BSBA', '4', 'A', 'Z8vwg93A', '17,2,16,18', '9,1,4,3,2,7,8'),
(17, 'BSIT', '4', 'C', 'gN1xmbC7', '2', '1,2,9'),
(19, 'BEED', '2', 'D', 'zd24DTNK', '14,17,2', '5,6,9,1,4,3,2'),
(20, 'BSCRIM', '2', 'W', 'P78SkV6C', '17,12,2', '9,1,4,3,2');

-- --------------------------------------------------------

--
-- Table structure for table `criteria_list`
--

CREATE TABLE `criteria_list` (
  `id` int(30) NOT NULL,
  `criteria` text NOT NULL,
  `order_by` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `criteria_list`
--

INSERT INTO `criteria_list` (`id`, `criteria`, `order_by`) VALUES
(5, 'Category 1: Teaching Effectiveness', 0),
(7, 'Criterion 2: Professionalism and Classroom Management', 1);

-- --------------------------------------------------------

--
-- Table structure for table `evaluation_answers`
--

CREATE TABLE `evaluation_answers` (
  `evaluation_id` int(30) NOT NULL,
  `question_id` int(30) NOT NULL,
  `rate` int(20) NOT NULL,
  `feedback` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `evaluation_answers`
--

INSERT INTO `evaluation_answers` (`evaluation_id`, `question_id`, `rate`, `feedback`) VALUES
(1, 1, 5, ''),
(1, 2, 5, ''),
(1, 3, 5, ''),
(1, 4, 5, ''),
(1, 5, 5, ''),
(1, 6, 5, ''),
(1, 7, 5, ''),
(1, 8, 5, ''),
(1, 9, 5, ''),
(1, 10, 5, ''),
(1, 11, 5, ''),
(1, 12, 5, ''),
(1, 13, 5, ''),
(1, 14, 5, ''),
(1, 15, 5, ''),
(1, 16, 5, ''),
(1, 17, 5, ''),
(1, 18, 5, ''),
(1, 19, 5, ''),
(1, 20, 5, ''),
(2, 21, 5, ''),
(2, 22, 5, ''),
(2, 23, 5, ''),
(2, 24, 5, ''),
(2, 25, 5, ''),
(2, 26, 5, ''),
(2, 27, 5, ''),
(2, 28, 5, ''),
(2, 29, 5, ''),
(2, 30, 5, ''),
(2, 31, 5, ''),
(2, 32, 5, ''),
(2, 33, 5, ''),
(2, 34, 5, ''),
(2, 35, 5, ''),
(2, 36, 5, ''),
(2, 37, 5, ''),
(2, 38, 5, ''),
(2, 39, 5, ''),
(2, 40, 5, '');

-- --------------------------------------------------------

--
-- Table structure for table `evaluation_list`
--

CREATE TABLE `evaluation_list` (
  `evaluation_id` int(30) NOT NULL,
  `academic_id` int(30) NOT NULL,
  `class_id` int(30) NOT NULL,
  `student_id` int(30) NOT NULL,
  `subject_id` int(30) NOT NULL,
  `faculty_id` int(30) NOT NULL,
  `restriction_id` int(30) NOT NULL,
  `status` varchar(10) NOT NULL,
  `date_taken` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `evaluation_list`
--

INSERT INTO `evaluation_list` (`evaluation_id`, `academic_id`, `class_id`, `student_id`, `subject_id`, `faculty_id`, `restriction_id`, `status`, `date_taken`) VALUES
(1, 3, 17, 177, 8, 18, 65, 'active', '2024-11-18 22:03:48'),
(2, 2, 17, 177, 2, 2, 73, 'active', '2024-11-18 22:30:32');

-- --------------------------------------------------------

--
-- Table structure for table `faculty_list`
--

CREATE TABLE `faculty_list` (
  `id` int(30) NOT NULL,
  `school_id` varchar(100) NOT NULL,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `avatar` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `position` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faculty_list`
--

INSERT INTO `faculty_list` (`id`, `school_id`, `firstname`, `lastname`, `email`, `password`, `avatar`, `date_created`, `position`) VALUES
(2, '111942434', 'John', 'Ernest', 'ernest@gmail.com', '200820e3227815ed1756a6b531e7e0d2', '1729778340_GX3qegkWUAATr1p.jpg', '2024-08-14 20:19:27', 'Instructor'),
(12, '12345', 'John', 'Doe', 'john@example.com', '200820e3227815ed1756a6b531e7e0d2', 'no-image-available.png', '2024-10-21 12:45:25', 'Instructor'),
(13, '12346', 'Jane', 'Smith', 'jane@example.com', '200820e3227815ed1756a6b531e7e0d2', '1729778340_th.jfif', '2024-10-21 12:45:25', 'Instructor'),
(14, '11946424', 'John Ericson', 'Brigildo', 'JohnBrigildo@gmail.com', '7a9a93b4414feaaa7ff38413d452e68f', '\'\\\'\\\\\\\'\\\\\\\\\\\\\\\'no-image-available.png\\\\\\\\\\\\\\\'\\\\\\\'\\\'\'', '2024-11-11 14:09:26', 'Instructor'),
(15, '11946423', 'Genevieve ', 'Geralla', 'Genevieve@gmail.com', '5b0f4118df11e7364a6210dea9621696', '\'\\\'\\\\\\\'\\\\\\\\\\\\\\\'no-image-available.png\\\\\\\\\\\\\\\'\\\\\\\'\\\'\'', '2024-11-11 14:09:26', 'Instructor'),
(16, '11946422', 'Hitchean', 'Lisondra', 'HitcheanLisondra@gmail.com', 'b0661fef9563fbb0c330bd3b7e85e768', '\'\\\'\\\\\\\'\\\\\\\\\\\\\\\'no-image-available.png\\\\\\\\\\\\\\\'\\\\\\\'\\\'\'', '2024-11-11 14:09:26', 'Program chair'),
(17, '11946421', 'John Rey', 'Cilin', 'JohnCilin@gmail.com', '56284c8f81d2be9fac103e4a4f52eb9f', '\'\\\'\\\\\\\'\\\\\\\\\\\\\\\'no-image-available.png\\\\\\\\\\\\\\\'\\\\\\\'\\\'\'', '2024-11-11 14:09:26', 'Instructor'),
(18, '11946420', 'Ryan', 'Quiroga', 'RyQuiroga@gmail.com', 'c857c1f4c3fdca8808971eb4ce2dbdde', '\'\\\'\\\\\\\'\\\\\\\\\\\\\\\'no-image-available.png\\\\\\\\\\\\\\\'\\\\\\\'\\\'\'', '2024-11-11 14:09:26', 'Instructor');

-- --------------------------------------------------------

--
-- Table structure for table `question_list`
--

CREATE TABLE `question_list` (
  `id` int(30) NOT NULL,
  `academic_id` int(30) NOT NULL,
  `question` text NOT NULL,
  `order_by` int(30) NOT NULL,
  `criteria_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `question_list`
--

INSERT INTO `question_list` (`id`, `academic_id`, `question`, `order_by`, `criteria_id`) VALUES
(1, 3, 'The instructor demonstrates a strong knowledge of the subject matter.', 0, 5),
(2, 3, 'The instructor explains course material clearly and effectively.', 1, 5),
(3, 3, 'How effectively does the faculty member encourage student participation?', 2, 5),
(4, 3, 'The instructor encourages questions and critical thinking during class.', 3, 5),
(5, 3, 'The instructor provides timely and constructive feedback on assignments and exams.', 4, 5),
(6, 3, 'The instructor organizes lectures and materials in a logical, understandable way.', 5, 5),
(7, 3, 'The instructor is effective in engaging students and keeping their attention.', 6, 5),
(8, 3, 'The instructor sets clear expectations for assignments, tests, and grading.', 7, 5),
(9, 3, 'The instructor applies fair and consistent grading practices.', 8, 5),
(10, 3, 'Does the faculty member demonstrate enthusiasm for the subject?\n', 9, 5),
(11, 3, 'Does the faculty member handle conflicts or disagreements in a constructive manner?', 10, 7),
(12, 3, 'Does the faculty member maintain a respectful and inclusive environment?', 11, 7),
(13, 3, 'The instructor manages class time efficiently and starts and ends sessions on time.', 12, 7),
(14, 3, 'The instructor shows enthusiasm and passion for the subject and teaching.', 13, 7),
(15, 3, 'The instructor responds to student emails or messages within a reasonable time frame.', 14, 7),
(16, 3, 'The instructor respects diverse opinions and encourages inclusive participation.', 15, 7),
(17, 3, 'The instructor provides academic support, encouraging students to meet their potential.', 16, 7),
(18, 3, 'The instructor is open to feedback and willing to make adjustments to enhance learning.', 17, 7),
(19, 3, 'The instructor upholds high standards of academic integrity.', 18, 7),
(20, 3, 'How effectively does the faculty member manage disruptions in the classroom?', 19, 7),
(21, 2, 'The instructor demonstrates a strong knowledge of the subject matter.', 0, 5),
(22, 2, 'The instructor explains course material clearly and effectively.', 1, 5),
(23, 2, 'How effectively does the faculty member encourage student participation?', 2, 5),
(24, 2, 'The instructor encourages questions and critical thinking during class.', 3, 5),
(25, 2, 'The instructor provides timely and constructive feedback on assignments and exams.', 4, 5),
(26, 2, 'The instructor organizes lectures and materials in a logical, understandable way.', 5, 5),
(27, 2, 'The instructor is effective in engaging students and keeping their attention.', 6, 5),
(28, 2, 'The instructor sets clear expectations for assignments, tests, and grading.', 7, 5),
(29, 2, 'The instructor applies fair and consistent grading practices.', 8, 5),
(30, 2, 'Does the instructor member demonstrate enthusiasm for the subject?\r\n', 9, 5),
(31, 2, 'Does the instructor handle conflicts or disagreements in a constructive manner?', 10, 7),
(32, 2, 'Does the instructor maintain a respectful and inclusive environment?', 11, 7),
(33, 2, 'The instructor manages class time efficiently and starts and ends sessions on time.', 12, 7),
(34, 2, 'The instructor shows enthusiasm and passion for the subject and teaching.', 13, 7),
(35, 2, 'The instructor responds to student emails or messages within a reasonable time frame.', 14, 7),
(36, 2, 'The instructor respects diverse opinions and encourages inclusive participation.', 15, 7),
(37, 2, 'The instructor provides academic support, encouraging students to meet their potential.', 16, 7),
(38, 2, 'The instructor is open to feedback and willing to make adjustments to enhance learning.', 17, 7),
(39, 2, 'The instructor upholds high standards of academic integrity.', 18, 7),
(40, 2, 'How effectively does the faculty member manage disruptions in the classroom?', 19, 7);

-- --------------------------------------------------------

--
-- Table structure for table `restriction_list`
--

CREATE TABLE `restriction_list` (
  `id` int(30) NOT NULL,
  `academic_id` int(30) NOT NULL,
  `faculty_id` int(30) NOT NULL,
  `class_id` int(30) NOT NULL,
  `subject_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `restriction_list`
--

INSERT INTO `restriction_list` (`id`, `academic_id`, `faculty_id`, `class_id`, `subject_id`) VALUES
(47, 3, 1, 6, 3),
(48, 3, 1, 3, 3),
(49, 3, 1, 6, 2),
(50, 3, 1, 3, 2),
(55, 3, 3, 7, 0),
(56, 3, 2, 13, 4),
(57, 3, 2, 13, 3),
(58, 3, 2, 13, 1),
(61, 3, 12, 14, 5),
(65, 3, 18, 17, 8),
(66, 3, 17, 17, 9),
(67, 3, 15, 17, 6),
(68, 3, 14, 17, 5),
(69, 3, 16, 17, 7),
(70, 3, 2, 19, 3),
(71, 3, 2, 19, 4),
(73, 2, 2, 17, 2),
(74, 2, 14, 19, 5);

-- --------------------------------------------------------

--
-- Table structure for table `student_list`
--

CREATE TABLE `student_list` (
  `id` int(30) NOT NULL,
  `school_id` varchar(100) NOT NULL,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `class_id` int(30) NOT NULL,
  `avatar` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_list`
--

INSERT INTO `student_list` (`id`, `school_id`, `firstname`, `lastname`, `email`, `password`, `class_id`, `avatar`, `date_created`, `status`) VALUES
(162, '1118990', ' Ariel', 'Abellana ', 'Abellana@gmail.com', 'd12245ff37cad48c28506ddc383a1f95', 17, 'no-image-available.png', '2024-11-12 21:14:26', 'active'),
(163, '1118989', 'Baby John', 'Acidillo ', 'bbyJ@gmail.com', '4b40879a4e51a13e4caad0c0e8568605', 17, 'no-image-available.png', '2024-11-12 21:14:26', 'active'),
(164, '1118988', 'Christel Mae', 'Abellana ', 'Ariellana@gmail.com', 'd12245ff37cad48c28506ddc383a1f95', 17, 'no-image-available.png', '2024-11-12 21:14:26', 'active'),
(165, '1118987', 'Christine', 'Bendanillo', 'istineBenda@gmail.com', '40fc3e3dd906a2fee064a67e732f1f56', 17, 'no-image-available.png', '2024-11-12 21:14:26', 'active'),
(166, '1118986', 'Rodel', 'Celis', 'Celis@gmail.com', '4e539a31e99472ee31dd928fe2b5b43d', 17, 'no-image-available.png', '2024-11-12 21:14:26', 'active'),
(167, '1118985', 'Sarah', 'Caminos', 'SarahP@gmail.com', '7fec9db48d3aa3b840b71a294171eb4d', 17, 'no-image-available.png', '2024-11-12 21:14:26', 'active'),
(168, '1118984', 'Christian', 'Canono', 'Canono21@gmail.com', '5af6b59f9f9fa9f20a9523f55f6ad2b1', 17, 'no-image-available.png', '2024-11-12 21:14:26', 'active'),
(169, '1118983', 'Sweet Venice', 'Casia', 'Casia21@gmail.com', '6a2570eb695b4678b77e2d07a50d0996', 17, 'no-image-available.png', '2024-11-12 21:14:26', 'active'),
(170, '1118982', 'Caryll Jean', 'Deiparine', 'Deiparine21@gmail.com', '54bf73c5bee6bb09fe101b03209623a0', 17, 'no-image-available.png', '2024-11-12 21:14:26', 'active'),
(171, '1118981', 'Angel', 'Gabutero', 'Gabutero21@gmail.com', '5e15fa5b787fb86a681db740e825050b', 17, 'no-image-available.png', '2024-11-12 21:14:26', 'active'),
(172, '1118980', 'Ryle Aeron', 'Delicano', 'Delicano21@gmail.com', '0d7c1ac69512ac6d44ee20b8fd201f3f', 17, 'no-image-available.png', '2024-11-12 21:14:26', 'active'),
(173, '1118979', 'Darla Kayla', 'Ipon', 'Ipon21@gmail.com', 'aa35d492374eeff6aca2eba2d60b867e', 17, 'no-image-available.png', '2024-11-12 21:14:26', 'active'),
(174, '1118978', 'Kyle', 'Isidoro', 'Isidoro21@gmail.com', '7233e3e786bf5dd82b464d235c8b1c53', 17, 'no-image-available.png', '2024-11-12 21:14:26', 'active'),
(175, '1118977', 'Justine', 'Labora', 'Labora21@gmail.com', 'a7b6c221627dbba5f172c724347908bb', 17, 'no-image-available.png', '2024-11-12 21:14:26', 'active'),
(176, '1118976', 'Maria Ana ', 'Lapiz', 'Lapiz21@gmail.com', '65f20d37e89213b9af16e195eab20baf', 17, 'no-image-available.png', '2024-11-12 21:14:26', 'active'),
(177, '1118975', 'Ryan ky', 'Laroa', 'Laroa21@gmail.com', '5f5fa5ef882c4b5e859174bf778a053d', 17, 'no-image-available.png', '2024-11-12 21:14:26', 'active'),
(178, '1118974', 'Cosam John', 'Macua', 'Macua21@gmail.com', '66eeedf31b7faba1cafa9d7cd9ec8b39', 17, 'no-image-available.png', '2024-11-12 21:14:26', 'active'),
(179, '1118973', 'Junmark', 'Omambac', 'Omambac21@gmail.com', 'bd62a361e411471176d310f4a58ed951', 17, 'no-image-available.png', '2024-11-12 21:14:26', 'active'),
(180, '1118972', 'Matt Lovell', 'Ortega', 'Ortega21@gmail.com', '6e59674c42d92fa0d083b3642e048833', 17, 'no-image-available.png', '2024-11-12 21:14:26', 'active'),
(181, '1118971', 'Vhaugn Vincent', 'Padigos', 'Padigos21@gmail.com', '65c0afb642fb3a3a0dd7d59a5fec125b', 17, 'no-image-available.png', '2024-11-12 21:14:26', 'active'),
(182, '1118970', 'Jeralyn', 'Puerto', 'Puerto21@gmail.com', 'e520dbba188984d143a20f05166156c5', 17, 'no-image-available.png', '2024-11-12 21:14:26', 'active'),
(183, '1118969', 'Gian Heinrich ', 'Recaña', 'Recaña21@gmail.com', 'df31ec622e1db87930a86fe2a495df25', 17, 'no-image-available.png', '2024-11-12 21:14:26', 'active'),
(184, '1118968', 'Bernadette', 'Requinto', 'Requinto21@gmail.com', '6c56c8f7aa28eb9b9a84b8e80d09f696', 17, 'no-image-available.png', '2024-11-12 21:14:26', 'active'),
(185, '1118967', 'Edgardo', 'Siton', 'Siton21@gmail.com', '18fe94952c5a7c176f9af08dd9e4e9d9', 17, 'no-image-available.png', '2024-11-12 21:14:26', 'active'),
(186, '1118966', 'Judy', 'Tapere', 'Tapere21@gmail.com', 'a9743726ddefaecec077bb61144f201b', 17, 'no-image-available.png', '2024-11-12 21:14:26', 'active'),
(187, '1118965', 'Sherwin', 'Torrejas', 'Torrejas21@gmail.com', '4cb40edd622d815a77f3ea6d9056dd7f', 17, 'no-image-available.png', '2024-11-12 21:14:26', 'active'),
(188, '1118964', 'Jose Nathaniel', 'Ubas', 'Ubas21@gmail.com', 'c24a310d12620340fa3d5632b876f5be', 17, 'no-image-available.png', '2024-11-12 21:14:26', 'active'),
(189, '1118963', 'Aeron', 'Villafuerte', 'Villafuerte21@gmail.com', '1c42da6c924532d6bc90362ab984a74a', 17, 'no-image-available.png', '2024-11-12 21:14:26', 'active'),
(190, '1118962', 'Arthur', 'Villareal', 'Villareal21@gmail.com', '2e3e52564eec2066a11265d032a7235b', 17, 'no-image-available.png', '2024-11-12 21:14:26', 'active'),
(194, '1114324', 'christian', 'Bastida', 'chan@gmail.com', '9f7b4eebeaba56f7e6d89277f50af00c', 19, 'no-image-available.png', '2024-11-15 21:45:27', 'active'),
(195, '1112324', 'jonny', 'rob', 'rob@gmail.com', '760061f6bfde75c29af12f252d4d3345', 19, 'no-image-available.png', '2024-11-18 15:15:58', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `subject_list`
--

CREATE TABLE `subject_list` (
  `id` int(30) NOT NULL,
  `code` varchar(50) NOT NULL,
  `subject` text NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subject_list`
--

INSERT INTO `subject_list` (`id`, `code`, `subject`, `description`) VALUES
(1, 'SCC-PF201-IT2A', 'OBJECT-ORIENTED PROGRAMMING 1', 'OBJECT-ORIENTED PROGRAMMING 1'),
(2, 'ENG-101', 'English', 'English'),
(3, 'CC-102', 'COMPUTER PROGRAMMING 1', 'COMPUTER PROGRAMMING 1'),
(4, 'MATH-204', 'GENMATH', 'GENMATH'),
(5, 'CAP-401', 'CAPSTONE PROJECT 2', 'CAPSTONE PROJECT 2'),
(6, 'IT-402', 'FREE ELECTIVE', 'FREE ELECTIVE'),
(7, 'SP-403', 'SOCIAL AND PROFESSIONAL ISSUES', 'SOCIAL AND PROFESSIONAL ISSUES'),
(8, 'IT-404', 'SEMINAR IN IT TRENDS/UPDATES', 'SEMINAR IN IT TRENDS/UPDATES-ELECTIVE\r\n'),
(9, 'SA-405', 'SYSTEM ADMINISTRATOR AND MAINTENANCE', 'SYSTEM ADMINISTRATOR AND MAINTENANCE');

-- --------------------------------------------------------

--
-- Table structure for table `subject_teacher`
--

CREATE TABLE `subject_teacher` (
  `id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `faculty_id` int(11) NOT NULL,
  `academic_year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subject_teacher`
--

INSERT INTO `subject_teacher` (`id`, `subject_id`, `faculty_id`, `academic_year`) VALUES
(24, 1, 12, 3),
(25, 1, 2, 3),
(35, 4, 12, 3),
(40, 3, 12, 3),
(51, 8, 18, 3),
(52, 7, 16, 3),
(53, 9, 17, 3),
(54, 5, 14, 3),
(55, 6, 15, 3),
(56, 2, 2, 2),
(57, 5, 14, 2),
(58, 6, 14, 2),
(59, 9, 17, 2),
(60, 9, 12, 2),
(61, 9, 12, 3),
(62, 9, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(10) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `Address` varchar(20) NOT NULL,
  `cover` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `Address`, `cover`) VALUES
(1, 'Faculty Evaluation System', 'info@sampl', '09994714498', 'Cuanos,Minglanilla,C', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `avatar` text NOT NULL ,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password`, `avatar`, `date_created`) VALUES
(1, 'Administrator', '', 'admin@admin.com', '0192023a7bbd73250516f069df18b500', '1607135820_avatar.jpg', '2020-11-26 10:57:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academic_list`
--
ALTER TABLE `academic_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `class_list`
--
ALTER TABLE `class_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `criteria_list`
--
ALTER TABLE `criteria_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `evaluation_answers`
--
ALTER TABLE `evaluation_answers`
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `evaluation_list`
--
ALTER TABLE `evaluation_list`
  ADD PRIMARY KEY (`evaluation_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `faculty_id` (`faculty_id`),
  ADD KEY `restriction_id` (`restriction_id`);

--
-- Indexes for table `faculty_list`
--
ALTER TABLE `faculty_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question_list`
--
ALTER TABLE `question_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `criteria_id` (`criteria_id`);

--
-- Indexes for table `restriction_list`
--
ALTER TABLE `restriction_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_list`
--
ALTER TABLE `student_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `subject_list`
--
ALTER TABLE `subject_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subject_teacher`
--
ALTER TABLE `subject_teacher`
  ADD PRIMARY KEY (`id`),
  ADD KEY `academic_year` (`academic_year`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `fk_faculty` (`faculty_id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `academic_list`
--
ALTER TABLE `academic_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `class_list`
--
ALTER TABLE `class_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `student_list`
--
ALTER TABLE `student_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=196;

--
-- AUTO_INCREMENT for table `subject_teacher`
--
ALTER TABLE `subject_teacher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `evaluation_answers`
--
ALTER TABLE `evaluation_answers`
  ADD CONSTRAINT `evaluation_answers_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `question_list` (`id`);

--
-- Constraints for table `evaluation_list`
--
ALTER TABLE `evaluation_list`
  ADD CONSTRAINT `evaluation_list_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student_list` (`id`),
  ADD CONSTRAINT `evaluation_list_ibfk_2` FOREIGN KEY (`faculty_id`) REFERENCES `faculty_list` (`id`),
  ADD CONSTRAINT `evaluation_list_ibfk_3` FOREIGN KEY (`restriction_id`) REFERENCES `restriction_list` (`id`);

--
-- Constraints for table `question_list`
--
ALTER TABLE `question_list`
  ADD CONSTRAINT `question_list_ibfk_1` FOREIGN KEY (`criteria_id`) REFERENCES `criteria_list` (`id`);

--
-- Constraints for table `student_list`
--
ALTER TABLE `student_list`
  ADD CONSTRAINT `student_list_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `class_list` (`id`);

--
-- Constraints for table `subject_teacher`
--
ALTER TABLE `subject_teacher`
  ADD CONSTRAINT `subject_teacher_ibfk_1` FOREIGN KEY (`faculty_id`) REFERENCES `faculty_list` (`id`),
  ADD CONSTRAINT `subject_teacher_ibfk_2` FOREIGN KEY (`academic_year`) REFERENCES `academic_list` (`id`),
  ADD CONSTRAINT `subject_teacher_ibfk_3` FOREIGN KEY (`subject_id`) REFERENCES `subject_list` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
