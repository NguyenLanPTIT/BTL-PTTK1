
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: shopping-cart
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `orderid` varchar(45) NOT NULL,
  `prodid` varchar(45) NOT NULL,
  `quantity` int DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `shipped` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`orderid`,`prodid`),
  KEY `fk_product_order` (`prodid`),
  CONSTRAINT `fk_product_order` FOREIGN KEY (`prodid`) REFERENCES `product` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES ('TR10001','181',1,125999.00,0);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `pid` varchar(45) NOT NULL,
  `pname` varchar(100) DEFAULT NULL,
  `ptype` varchar(20) DEFAULT NULL,
  `pinfo` varchar(500) DEFAULT NULL,
  `pprice` decimal(12,2) DEFAULT NULL,
  `pquantity` int DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('177','Black Women\'s Gown','clothes','The Black Women\'s Gown is an elegant and timeless evening gown. With a sleek black design, it\'s perfect for formal events and special occasions, exuding sophistication and style.',129.99,59,'https://cdn.dummyjson.com/products/images/womens-dresses/Black%20Women\'s%20Gown/thumbnail.png'),('178','Corset Leather With Skirt','clothes','The Corset Leather With Skirt is a bold and edgy ensemble that combines a stylish corset with a matching skirt. Ideal for fashion-forward individuals, it makes a statement at any event.',89.99,59,'https://cdn.dummyjson.com/products/images/womens-dresses/Corset%20Leather%20With%20Skirt/thumbnail.png'),('179','Corset With Black Skirt','clothes','The Corset With Black Skirt is a chic and versatile outfit that pairs a fashionable corset with a classic black skirt. It offers a trendy and coordinated look for various occasions.',79.99,67,'https://cdn.dummyjson.com/products/images/womens-dresses/Corset%20With%20Black%20Skirt/thumbnail.png'),('180','Dress Pea','clothes','The Dress Pea is a stylish and comfortable dress with a pea pattern. Perfect for casual outings, it adds a playful and fun element to your wardrobe, making it a great choice for day-to-day wear.',49.99,29,'https://cdn.dummyjson.com/products/images/womens-dresses/Dress%20Pea/thumbnail.png'),('181','Marni Red & Black Suit','clothes','The Marni Red & Black Suit is a sophisticated and fashion-forward suit ensemble. With a combination of red and black tones, it showcases a modern design for a bold and confident look.',179.99,15,'https://cdn.dummyjson.com/products/images/womens-dresses/Marni%20Red%20&%20Black%20Suit/thumbnail.png'),('200','Harry Potter and the Sorcerers Stone','book','On his birthday, Harry Potter stone that prolongs the life of its owner.',129.99,59,'https://raw.githubusercontent.com/fedeperin/potterapi/main/public/images/covers/1.png'),('201','Harry Potter and the chamber of secrets','book','Harry Potter and the sophomores investigate a m the castle.',89.99,59,'https://raw.githubusercontent.com/fedeperin/potterapi/main/public/images/covers/2.png'),('202','Harry Potter and the Prisoner of Azkaban','book','Harrys third year of studies at Hogwarts is of Lord Voldemort and who will try to take revenge on Harry Potter.',79.99,67,'https://raw.githubusercontent.com/fedeperin/potterapi/main/public/images/covers/3.png'),('203','Harry Potter and the Goblet of Fire','book','Hogwarts prepares for the e. To everyones surprise, Harry Potter is chosen to participate in the competition, in which he must fight dragons, enter the water and face his greatest fears.',49.99,29,'https://raw.githubusercontent.com/fedeperin/potterapi/main/public/images/covers/4.png'),('204','Harry Potter and the Order of the Phoenix','book','In his fifth year ommunity do not know the truth about his encounter with Lord Voldemort. Cornelius Fudge, Minister of Magic, appoints Dolores Umbridge as Defense Against the Dark Arts teacher because he believes that Professor Dumbledore plans to take over his job. But his teachings are inadequate, so Harry prepares the students to defend the school against evil.',179.99,15,'https://raw.githubusercontent.com/fedeperin/potterapi/main/public/images/covers/5.png'),('48','Bamboo Spatula','electronic','The Bamboo Spatula is a versatile kitch flipping, stirring, and serving various dishes.',7.99,0,'https://cdn.dummyjson.com/products/images/kitchen-accessories/Bamboo%20Spatula/thumbnail.png'),('49','Black Aluminium Cup','electronic','The Black Aluminium Cup is a stylish and durable cup suitable for both hot and cold beverages. Its sleek black design adds a modern touch to your drinkware collection.',5.99,42,'https://cdn.dummyjson.com/products/images/kitchen-accessories/Black%20Aluminium%20Cup/thumbnail.png'),('50','Black Whisk','electronic','The Black Whisk is a kitchen essential for whi it a practical and stylish tool.',9.99,17,'https://cdn.dummyjson.com/products/images/kitchen-accessories/Black%20Whisk/thumbnail.png'),('71','Silver Pot With Glass Cap','electronic','The Silver Pot with Glass Cr cooking progress.',39.99,37,'https://cdn.dummyjson.com/products/images/kitchen-accessories/Silver%20Pot%20With%20Glass%20Cap/thumbnail.png'),('72','Slotted Turner','electronic','The Slotted Turner is a kws excess liquid to drain, making it ideal for frying and sautéing.',8.99,36,'https://cdn.dummyjson.com/products/images/kitchen-accessories/Slotted%20Turner/thumbnail.png'),('73','Spice Rack','electronic','The Spice Rack is a convenient orithin reach and neatly arranged with this stylish spice rack.',19.99,24,'https://cdn.dummyjson.com/products/images/kitchen-accessories/Spice%20Rack/thumbnail.png'),('P20240425082211','Nike Air Jordan 1 Red And Black','Shoes','The Nike Air Jordan 1 in Red and Black is an iconic basketball sneaker known for its stylish design and high-performance features, making it a favorite among sneaker enthusiasts and athletes.',149.99,15,'https://cdn.dummyjson.com/products/images/mens-shoes/Nike%20Air%20Jordan%201%20Red%20And%20Black/thumbnail.png'),('P20240425082212','Nike Baseball Cleats','Shoes','Nike Baseball Cleats are designed for maximum traction and performance on the baseball field. They provide stability and support for players during games and practices.',79.99,14,'https://cdn.dummyjson.com/products/images/mens-shoes/Nike%20Baseball%20Cleats/thumbnail.png'),('P20240425082213','Puma Future Rider Trainers','Shoes','The Puma Future Rider Trainers offer a blend of retro style and modern comfort. Perfect for casual wear, these trainers provide a fashionable and comfortable option for everyday use.',89.99,10,'https://cdn.dummyjson.com/products/images/mens-shoes/Puma%20Future%20Rider%20Trainers/thumbnail.png'),('P20240425082214','Sports Sneakers Off White & Red','Shoes','The Sports Sneakers in Off White and Red combine style and functionality, making them a fashionable choice for sports enthusiasts. The red and off-white color combination adds a bold and energetic touch.',119.99,73,'https://cdn.dummyjson.com/products/images/mens-shoes/Sports%20Sneakers%20Off%20White%20&%20Red/thumbnail.png'),('P20240425082215','Sports Sneakers Off White Red','Shoes','Another variant of the Sports Sneakers in Off White Red, featuring a unique design. These sneakers offer style and comfort for casual occasions.',109.99,75,'https://cdn.dummyjson.com/products/images/mens-shoes/Sports%20Sneakers%20Off%20White%20Red/thumbnail.png'),('P202411290001','Apple MacBook Pro 14 Inch Space Grey','laptop','The MacBook Pro 14 Inch in Space Grey is a powerful and sleek laptop, featuring Apple\'s M1 Pro chip for exceptional performance and a stunning Retina display.',1999.99,39,'https://cdn.dummyjson.com/products/images/laptops/Apple%20MacBook%20Pro%2014%20Inch%20Space%20Grey/thumbnail.png'),('P202411290002','Asus Zenbook Pro Dual Screen Laptop','laptop','The Asus Zenbook Pro Dual Screen Laptop is a high-performance device with dual screens, providing productivity and versatility for creative professionals.',1799.99,38,'https://cdn.dummyjson.com/products/images/laptops/Asus%20Zenbook%20Pro%20Dual%20Screen%20Laptop/thumbnail.png'),('P202411290003','Huawei Matebook X Pro','laptop','The Huawei Matebook X Pro is a slim and stylish laptop with a high-resolution touchscreen display, offering a premium experience for users on the go.',1399.99,34,'https://cdn.dummyjson.com/products/images/laptops/Huawei%20Matebook%20X%20Pro/thumbnail.png'),('P202411290004','Lenovo Yoga 920','laptop','The Lenovo Yoga 920 is a 2-in-1 convertible laptop with a flexible hinge, allowing you to use it as a laptop or tablet, offering versatility and portability.',1099.99,71,'https://cdn.dummyjson.com/products/images/laptops/Lenovo%20Yoga%20920/thumbnail.png'),('P202411290005','New DELL XPS 13 9300 Laptop','laptop','The New DELL XPS 13 9300 Laptop is a compact and powerful device, featuring a virtually borderless InfinityEdge display and high-end performance for various tasks.',1499.99,18,'https://cdn.dummyjson.com/products/images/laptops/New%20DELL%20XPS%2013%209300%20Laptop/thumbnail.png'),('P20241129001207','Oppo Find X6 Pro','Mobiles','Oppo Find X6 Pro boasts a cutting-edge camera system, Snapdragon 8 Gen 2, and a large AMOLED screen.',1099.99,45,'https://cdn.dummyjson.com/products/images/smartphones/iPhone%205s/1.png'),('P20241129001208','Vivo X90 Pro','Mobiles','Vivo X90 Pro features advanced camera capabilities, flagship-level performance, and sleek design.',999.99,50,'https://cdn.dummyjson.com/products/images/smartphones/iPhone%206/1.png'),('P20241129001209','Realme GT 2 Pro','Mobiles','Realme GT 2 Pro is powered by Snapdragon 8 Gen 1, featuring a large 120Hz AMOLED display and 65W fast charging.',749.99,70,'https://cdn.dummyjson.com/products/images/smartphones/iPhone%2013%20Pro/1.png'),('P20241129001210','Asus ROG Phone 7','Mobiles','Asus ROG Phone 7 offers an immersive gaming experience with a high refresh rate and excellent battery life.',899.99,40,'https://cdn.dummyjson.com/products/images/smartphones/iPhone%20X/1.png'),('P20241129001211','Sony Xperia 1 IV','Mobiles','Sony Xperia 1 IV is designed for creators with a 4K OLED display and pro-level camera features.',1299.99,30,'https://cdn.dummyjson.com/products/images/smartphones/Oppo%20F19%20Pro%20Plus/1.png');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `transid` varchar(45) NOT NULL,
  `username` varchar(60) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`transid`),
  KEY `fk_user_transaction` (`username`),
  CONSTRAINT `fk_user_transaction` FOREIGN KEY (`username`) REFERENCES `user` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES ('TR10001','guest@gmail.com','2023-04-23 09:26:56',125999.00),('TR10002','guest@gmail.com','2023-04-24 10:45:30',59999.00),('TR10003','admin@gmail.com','2023-05-01 14:15:20',79999.00);
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `email` varchar(60) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `mobile` bigint DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `pincode` int DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `role` enum('customer','admin','staff') NOT NULL DEFAULT 'customer',
  `position` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('admin@gmail.com','Admin User',9876543459,'ABC Colony, Newtown, West Bengal',786890,'admin','customer',NULL),('guest@gmail.com','Guest User',9876543234,'K.P Road, Gaya, Bihar - India',879767,'guest','customer',NULL),('lan@gmail.com','NV Sale',123456789,'ha noi',123456789,'lan','staff','sales'),('phuc@gmail.com','NV KHO',123456789,'ha noi',123456789,'phuc','staff','warehouse');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_demand`
--

DROP TABLE IF EXISTS `user_demand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_demand` (
  `username` varchar(60) NOT NULL,
  `prodid` varchar(45) NOT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`username`,`prodid`),
  KEY `fk_user_demand_product` (`prodid`),
  CONSTRAINT `fk_user_demand_product` FOREIGN KEY (`prodid`) REFERENCES `product` (`pid`),
  CONSTRAINT `fk_user_demand_user` FOREIGN KEY (`username`) REFERENCES `user` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_demand`
--

LOCK TABLES `user_demand` WRITE;
/*!40000 ALTER TABLE `user_demand` DISABLE KEYS */;
INSERT INTO `user_demand` VALUES ('admin@gmail.com','179',1),('guest@gmail.com','180',2),('guest@gmail.com','181',3);
/*!40000 ALTER TABLE `user_demand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usercart`
--

DROP TABLE IF EXISTS `usercart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usercart` (
  `username` varchar(60) DEFAULT NULL,
  `prodid` varchar(45) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  KEY `fk_usercart_user` (`username`),
  KEY `fk_usercart_product` (`prodid`),
  CONSTRAINT `fk_usercart_product` FOREIGN KEY (`prodid`) REFERENCES `product` (`pid`),
  CONSTRAINT `fk_usercart_user` FOREIGN KEY (`username`) REFERENCES `user` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usercart`
--

LOCK TABLES `usercart` WRITE;
/*!40000 ALTER TABLE `usercart` DISABLE KEYS */;
INSERT INTO `usercart` VALUES ('guest@gmail.com','181',4),('guest@gmail.com','180',1),('admin@gmail.com','179',1);
/*!40000 ALTER TABLE `usercart` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-30 22:16:14
