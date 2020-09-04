-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 11, 2019 at 05:17 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlineshop`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getcat` (IN `cid` INT)  SELECT * FROM categories WHERE cat_id=cid$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_info`
--

CREATE TABLE `admin_info` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(300) NOT NULL,
  `admin_password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_info`
--

INSERT INTO `admin_info` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'admin', 'admin@gmail.com', '25f9e794323b453885f5181f1b624d0b');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'HP'),
(2, 'Dsce'),
(3, 'Chandras'),
(4, 'Lenovo'),
(5, 'LG'),
(6, 'Classmate');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(6, 26, '::1', 4, 1),
(9, 10, '::1', 7, 1),
(10, 11, '::1', 7, 1),
(11, 45, '::1', 7, 1),
(44, 5, '::1', 3, 0),
(46, 2, '::1', 3, 0),
(51, 1, '::1', 8, 1),
(52, 5, '::1', 9, 1),
(53, 2, '::1', 14, 1),
(54, 3, '::1', 14, 1),
(55, 5, '::1', 14, 1),
(56, 1, '::1', 9, 1),
(57, 2, '::1', 9, 1),
(71, 61, '127.0.0.1', -1, 1),
(156, 70, '::1', 1, 1),
(157, 71, '::1', 1, 1),
(164, 1, '::1', -1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Laptops'),
(2, 'notebooks'),
(3, 'BAGS'),
(4, 'record'),
(5, 'BlueBooks'),
(6, 'stationary'),
(7, 'accessories');

-- --------------------------------------------------------

--
-- Table structure for table `email_info`
--

CREATE TABLE `email_info` (
  `email_id` int(100) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `email_info`
--

INSERT INTO `email_info` (`email_id`, `email`) VALUES
(3, 'admin@gmail.com'),
(4, 'bhargav123@gmail.com'),
(5, 'bhargav@gmail.com'),
(6, 'amin@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `qty`, `trx_id`, `p_status`) VALUES
(1, 12, 7, 1, '07M47684BS5725041', 'Completed'),
(2, 14, 2, 1, '07M47684BS5725041', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `orders_info`
--

CREATE TABLE `orders_info` (
  `order_id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` int(10) NOT NULL,
  `cardname` varchar(255) NOT NULL,
  `cardnumber` varchar(20) NOT NULL,
  `expdate` varchar(255) NOT NULL,
  `prod_count` int(15) DEFAULT NULL,
  `total_amt` int(15) DEFAULT NULL,
  `cvv` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders_info`
--

INSERT INTO `orders_info` (`order_id`, `user_id`, `f_name`, `email`, `address`, `city`, `state`, `zip`, `cardname`, `cardnumber`, `expdate`, `prod_count`, `total_amt`, `cvv`) VALUES
(1, 12, 'bhargav', 'bhargav123@gmail.com', 'Bangalore, kumarswami_layout, Karnataka', 'Bangalore', 'Karnataka', 560074, 'pokjhgfcxc', '4321 2345 6788 7654', '12/90', 3, 77000, 1234),
(2, 26, 'bhargav j y k', 'bhargava@gmail.com', 'as', 'as', 'as', 111111, 'sda', '6911844651651894', '12/22', 1, 5000, 11);

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `order_pro_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(15) DEFAULT NULL,
  `amt` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`order_pro_id`, `order_id`, `product_id`, `qty`, `amt`) VALUES
(73, 1, 1, 1, 5000),
(74, 1, 4, 2, 64000),
(75, 1, 8, 1, 40000),
(91, 2, 1, 1, 5000);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(100) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_desc`, `product_image`, `product_keywords`) VALUES
(1, 1, 2, 'Lenovo vx1 ', 45000, 'lenovo', 'lap1.png', 'Laptop'),
(2, 1, 3, 'Lenovo vx2', 50000, 'lenovo', 'lap2.png', 'Laptop'),
(3, 1, 3, 'Lenovo vx3', 30000, 'lenovo', 'lap20.jpg', 'Laptop'),
(4, 1, 3, 'Lenovo vx4', 32000, 'lenovo', 'lap3.png', 'Laptop'),
(5, 1, 2, 'Lenovo vx5', 40000, 'lenovo', 'lap4.png', 'Laptop'),
(6, 1, 1, 'Lenovo vx6', 35000, 'lenovo', 'lap5.png', 'Laptop'),
(7, 1, 1, 'Laptop Pavillion', 50000, 'pavillion', 'lap6.png', 'Laptop Hp Pavillion'),
(8, 1, 4, 'Laptop Pavillion vx1', 40000, 'pavillion', 'lap7.jpg', 'Laptop'),
(9, 1, 3, 'Laptop Pavillion vx2', 42000, 'pavillion', 'lap8.png', 'Laptop'),
(10, 2, 6, 'NoteBook', 250, 'NoteBook', 'note1.png', 'NoteBook'),
(11, 2, 6, 'NoteBook', 100, 'NoteBook', 'note2.png', 'NoteBook'),
(12, 2, 6, 'NoteBook', 150, 'NoteBook', 'note3.png', 'NoteBook'),
(13, 2, 6, 'NoteBook', 50, 'NoteBook', 'note4.png', 'NoteBook'),
(14, 2, 6, 'NoteBook', 85, 'NoteBook', 'note5.png', 'NoteBook'),
(15, 2, 6, 'NoteBook', 150, 'NoteBook', 'note6.png', 'NoteBook'),
(16, 3, 6, 'BAG', 2500, 'BAG', 'bag1.jpg', 'nilon bag'),
(17, 3, 6, 'BAG', 1100, 'BAG', 'bag2.jpg', 'nilon bag'),
(19, 3, 6, 'BAG', 3000, 'BAG', 'bag3.jpg', 'nilon bag'),
(20, 3, 6, 'BAG', 1600, 'BAG', 'bag4.jpg', 'nilon bag'),
(21, 3, 6, 'BAG', 1800, 'BAG', 'bag5.webp', 'nilon bag'),
(22, 4, 6, 'Record Book', 50, 'Record Book', 'rec1.jpg', 'lab record'),
(23, 4, 6, 'Record Book', 45, 'Record Book', 'rec2.jpg', 'lab record'),
(24, 4, 6, 'Record Book', 60, 'Record Book', 'rec3.jpg', 'lab record'),
(25, 4, 6, 'Record Book', 50, 'Record Book', 'rec4.png', 'lab record'),
(27, 4, 6, 'Record Book', 69, 'Record Book', 'rec5.jpg', 'lab record'),
(32, 5, 0, 'Blue Book', 25, 'Blue book ', 'bbk.jpg', 'Assigment book'),
(33, 6, 2, 'Pen', 5, 'Pen', 'pen1.jpg', 'cello'),
(34, 6, 4, 'Pen', 10, 'Pen', 'pen2.jpg', 'cello'),
(35, 6, 0, 'Pen', 15, 'Pen', 'pen3.jpg', 'cello'),
(36, 6, 5, 'Pen', 15, 'Pen', 'pen4.jpg', 'cello'),
(37, 6, 5, 'Pen', 20, 'Pen', 'pen5.jpg', 'cello'),
(38, 6, 4, 'Pen', 10, 'Pen', 'pen6.jpg', 'cello'),
(39, 6, 5, 'Pen', 25, 'Pen', 'pen7.jpg', 'cello'),
(40, 2, 6, 'NoteBook', 300, 'NoteBook', 'note7.png', 'NoteBook'),
(45, 1, 2, 'Laptop Pavillion vx3', 100000, 'pavillion', 'lap9.png', 'Laptop'),
(46, 1, 2, 'Laptop Pavillion vx4', 70000, 'pavillion', 'lap10.png', 'Laptop'),
(47, 4, 6, 'Record Book', 65, 'Record Book', 'rec6.jpg', 'lab record'),
(48, 1, 7, 'Laptop Pavillion vx2', 57000, 'pavillion', 'lap11.png', 'Laptop'),
(49, 1, 7, 'Laptop Pavillion vx2', 55000, 'pavillion', 'lap12.png', 'Laptop'),
(50, 3, 6, 'BAG', 5000, 'BAG', 'bag6.jpg', 'nilon bag'),
(51, 3, 6, 'BAG', 2700, 'BAG', 'bag7.jpeg', 'nilon bag'),
(52, 3, 6, 'BAG', 4500, 'BAG', 'bag8.png', 'nilon bag'),
(53, 3, 6, 'BAG', 2200, 'BAG', 'bag9.jpg', 'nilon bag'),
(54, 3, 6, 'BAG', 2900, 'BAG', 'bag10.jpg', 'nilon bag'),
(55, 3, 6, 'BAG', 2600, 'BAG', 'bag11.webp', 'nilon bag'),
(56, 3, 6, 'BAG', 2900, 'BAG', 'bag12.jpg', 'nilon bag'),
(57, 3, 6, 'BAG', 2600, 'BAG', 'bag13.jpg', 'nilon bag'),
(58, 3, 6, 'BAG', 3500, 'BAG', 'bag14.jpeg', 'nilon bag'),
(59, 3, 6, 'BAG', 900, 'BAG', 'bag15.jpg', 'nilon bag'),
(60, 3, 6, 'BAG', 1500, 'BAG', 'bag16.jpg', 'nilon bag'),
(61, 3, 6, 'BAG', 1500, 'BAG', 'bag17.jpg', 'nilon bag'),
(62, 3, 6, 'BAG', 2999, 'BAG', 'bag18.webp', 'nilon bag'),
(63, 3, 6, 'BAG', 2550, 'BAG', 'bag19.jpg', 'nilon bag'),
(64, 3, 6, 'BAG', 1460, 'BAG', 'bag20.jpg', 'nilon bag'),
(65, 3, 6, 'BAG', 1700, 'BAG', 'bag21.jpg', 'nilon bag'),
(66, 3, 6, 'BAG', 2480, 'BAG', 'bag22.jpg', 'nilon bag'),
(67, 3, 6, 'BAG', 1500, 'BAG', 'bag23.jpg', 'nilon bag'),
(68, 3, 6, 'BAG', 1550, 'BAG', 'bag24.jpg', 'nilon bag'),
(69, 3, 6, 'BAG', 3000, 'BAG', 'bag25.jpg', 'nilon bag'),
(70, 3, 6, 'BAG', 3000, 'BAG', 'bag26.jpg', 'nilon bag'),
(71, 1, 2, 'Laptop Pavillion vx2', 60000, 'pavillion', 'lap13.png', 'Laptop'),
(72, 7, 2, 'sony Headphones', 3500, 'sony Headphones', 'product02.png', 'sony Headphones electronics gadgets'),
(73, 7, 2, 'samsung Headphones', 3500, 'samsung Headphones', 'product05.png', 'samsung Headphones electronics gadgets'),
(74, 1, 1, 'Laptop Pavillion vx2', 70000, 'pavillion', 'lap14.png', 'HP i5 laptop electronics'),
(75, 1, 1, 'Laptop Pavillion vx2', 77000, 'pavillion', 'lap15.jpg', 'HP i7 laptop 8gb ram electronics'),
(76, 1, 5, 'Laptop Pavillion vx2', 80000, 'pavillion', 'lap16.png', 'Laptop'),
(77, 1, 4, 'Laptop Pavillion vx2', 70000, 'MSV laptop 16gb ram', 'lap17.png', 'MSV laptop 16gb ram NVIDEA Graphics electronics'),
(78, 1, 5, 'Laptop Pavillion vx2', 75000, 'dell laptop 8gb ram intel integerated Graphics', 'lap18.png', 'dell laptop 8gb ram intel integerated Graphics electronics'),
(79, 7, 2, 'camera with 3D pixels', 2569, 'camera with 3D pixels', 'product09.png', 'camera with 3D pixels camera electronics gadgets'),
(80, 1, 1, 'Laptop Pavillion vx2', 77000, 'pavillion', 'lap19.png', 'Laptop'),
(81, 4, 6, 'Record Book', 30, 'Record Book', 'rec7.jpg', 'lab record');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'Bhargav', 'J Y K', 'Bhargav@gmail.com', 'Bhargav', '9448121558', '123456789', 'sdcjns,djc'),
(16, 'venky', 'vs', 'venkey@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(19, 'abhishek', 'bs', 'abhishekbs@gmail.com', 'asdcsdcc', '9871236534', 'bangalore', 'hassan'),
(21, 'prajval', 'mcta', 'prajvalmcta@gmail.com', '1234545662', '202-555-01', 'bangalore', 'kumbalagodu'),
(22, 'puneeth', 'v', 'hemu@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(23, 'hemanth', 'reddy', 'hemanth@gmail.com', 'Puneeth@123', '9876543234', 'Bangalore', 'Kumbalagodu'),
(25, 'otheruser', 'user', 'otheruser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu'),
(26, 'bhargav', 'j y k', 'bhargava@gmail.com', 'Yogesh123', '9999999999', 'as', 'as');

--
-- Triggers `user_info`
--
DELIMITER $$
CREATE TRIGGER `after_user_info_insert` AFTER INSERT ON `user_info` FOR EACH ROW BEGIN 
INSERT INTO user_info_backup VALUES(new.user_id,new.first_name,new.last_name,new.email,new.password,new.mobile,new.address1,new.address2);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_info_backup`
--

CREATE TABLE `user_info_backup` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info_backup`
--

INSERT INTO `user_info_backup` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'puneeth', 'Reddy', 'puneethreddy951@gmail.com', '123456789', '9448121558', '123456789', 'sdcjns,djc'),
(14, 'hemanthu', 'reddy', 'hemanthreddy951@gmail.com', '123456788', '6526436723', 's,dc wfjvnvn', 'b efhfhvvbr'),
(15, 'hemu', 'ajhgdg', 'keeru@gmail.com', '346778', '536487276', ',mdnbca', 'asdmhmhvbv'),
(16, 'venky', 'vs', 'venkey@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(19, 'abhishek', 'bs', 'abhishekbs@gmail.com', 'asdcsdcc', '9871236534', 'bangalore', 'hassan'),
(20, 'pramod', 'vh', 'pramod@gmail.com', '124335353', '9767645653', 'ksbdfcdf', 'sjrgrevgsib'),
(21, 'prajval', 'mcta', 'prajvalmcta@gmail.com', '1234545662', '202-555-01', 'bangalore', 'kumbalagodu'),
(22, 'puneeth', 'v', 'hemu@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(23, 'hemanth', 'reddy', 'hemanth@gmail.com', 'Puneeth@123', '9876543234', 'Bangalore', 'Kumbalagodu'),
(24, 'newuser', 'user', 'newuser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu'),
(25, 'otheruser', 'user', 'otheruser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu'),
(26, 'bhargav', 'j y k', 'bhargava@gmail.com', 'Yogesh123', '9999999999', 'as', 'as');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_info`
--
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `email_info`
--
ALTER TABLE `email_info`
  ADD PRIMARY KEY (`email_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`order_pro_id`),
  ADD KEY `order_products` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_info`
--
ALTER TABLE `admin_info`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `email_info`
--
ALTER TABLE `email_info`
  MODIFY `email_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders_info`
--
ALTER TABLE `orders_info`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `order_pro_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`);

--
-- Constraints for table `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products` FOREIGN KEY (`order_id`) REFERENCES `orders_info` (`order_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
