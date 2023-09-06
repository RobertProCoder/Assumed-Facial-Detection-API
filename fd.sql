-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 28, 2023 at 02:39 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fd`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `Eigen_Method` (IN `_image1` VARCHAR(50), IN `_image2` VARCHAR(50), IN `_image3` VARCHAR(50))   BEGIN
DECLARE Result varchar(200);
		SET Result = 'Please Provide an Image for Testing';
        IF EXISTS(SELECT * FROM eigen_dataset WHERE Right(Data1,3) LIKE Right(_image1,3) AND right(Data2,3) like right(_image2,3) AND right(Data3,3) = right(_image3,3))
        THEN 
			BEGIN 	
				INSERT INTO images(Image1,Image2,Image3,Method)values(_image1,_image2,_image3,'Eigen');
				SET Result = "You are now Authenticated";
                END;
			else
				BEGIN
				SET Result = 'Cannot Authenticate: Provide a better image';
				END;
			END IF;
		select Result;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Fisher_Method` (IN `_image1` VARCHAR(50), IN `_image2` VARCHAR(50), IN `_image3` VARCHAR(50))   BEGIN
DECLARE Result varchar(200);
		SET Result = 'Please Provide an Image for Testing';
        IF EXISTS(SELECT * FROM fisher_dataset WHERE Right(Data1,3) LIKE Right(_image1,3) AND right(Data2,3) like right(_image2,3) AND right(Data3,3) = right(_image3,3))
        THEN 
			BEGIN 	
				INSERT INTO images(Image1,Image2,Image3,Method)values(_image1,_image2,_image3,'Fisher');
				SET Result = "You are now Authenticated";
                END;
			else
				BEGIN
				SET Result = 'Cannot Authenticate: Provide a better image';
				END;
			END IF;
		select Result;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Laplacian_Method` (IN `_image1` VARCHAR(50), IN `_image2` VARCHAR(50), IN `_image3` VARCHAR(50))   BEGIN
DECLARE Result varchar(200);
		SET Result = 'Please Provide an Image for Testing';
        IF EXISTS(SELECT * FROM laplacian_dataset WHERE Right(Data1,3) LIKE Right(_image1,3) AND right(Data2,3) like right(_image2,3) AND right(Data3,3) = right(_image3,3))
        THEN 
			BEGIN 	
				INSERT INTO images(Image1,Image2,Image3,Method)values(_image1,_image2,_image3,'Laplacian');
				SET Result = "You are now Authenticated";
                END;
			else
				BEGIN
				SET Result = 'Cannot Authenticate: Provide a better image';
				END;
			END IF;
		select Result;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `eigen_dataset`
--

CREATE TABLE `eigen_dataset` (
  `Data1` varchar(50) NOT NULL,
  `Data2` varchar(50) NOT NULL,
  `Data3` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `eigen_dataset`
--

INSERT INTO `eigen_dataset` (`Data1`, `Data2`, `Data3`) VALUES
('Image1.gif', 'Image2.gif', 'Image3.gif');

-- --------------------------------------------------------

--
-- Table structure for table `fisher_dataset`
--

CREATE TABLE `fisher_dataset` (
  `Data1` varchar(50) NOT NULL,
  `Data2` varchar(50) NOT NULL,
  `Data3` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fisher_dataset`
--

INSERT INTO `fisher_dataset` (`Data1`, `Data2`, `Data3`) VALUES
('Image1.png', 'Image2.png', 'Image3.png');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `Image1` varchar(50) NOT NULL,
  `Image2` varchar(50) NOT NULL,
  `Image3` varchar(50) NOT NULL,
  `Method` varchar(50) NOT NULL,
  `Data_Entry` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `Image1`, `Image2`, `Image3`, `Method`, `Data_Entry`) VALUES
(1, 'hello.gif', 'world.gif', 'Programmer.gif', 'Eigen', '2023-05-28 09:11:34'),
(2, 'mayo.png', 'robert.png', 'elumba.png', 'Fisher', '2023-05-28 10:19:17'),
(3, '123.jpg', '321.jpg', '12345.jpg', 'Laplacian', '2023-05-28 10:27:00'),
(4, 'jipoy.gif', 'paalisbo.gif', 'Johnfel.gif', 'Eigen', '2023-05-28 12:16:28');

-- --------------------------------------------------------

--
-- Table structure for table `laplacian_dataset`
--

CREATE TABLE `laplacian_dataset` (
  `Data1` varchar(50) NOT NULL,
  `Data2` varchar(50) NOT NULL,
  `Data3` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `laplacian_dataset`
--

INSERT INTO `laplacian_dataset` (`Data1`, `Data2`, `Data3`) VALUES
('Image1.jpg', 'Image2.jpg', 'Image3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Age` int(11) NOT NULL,
  `Course` varchar(100) NOT NULL,
  `Year_Level` varchar(50) NOT NULL,
  `Block` varchar(20) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Image_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
