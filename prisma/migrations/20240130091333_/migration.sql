-- CreateTable
CREATE TABLE `Customer` (
    `CustomerID` INTEGER NOT NULL AUTO_INCREMENT,
    `FirstName` VARCHAR(191) NOT NULL,
    `LastName` VARCHAR(191) NOT NULL,
    `Email` VARCHAR(191) NOT NULL,
    `Password` VARCHAR(191) NOT NULL,
    `Address` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`CustomerID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Product` (
    `ProductID` INTEGER NOT NULL AUTO_INCREMENT,
    `Name` VARCHAR(191) NOT NULL,
    `Brand` VARCHAR(191) NOT NULL,
    `Category` VARCHAR(191) NOT NULL,
    `Price` DOUBLE NOT NULL,
    `StockQuantity` INTEGER NOT NULL,

    PRIMARY KEY (`ProductID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Orderitem` (
    `Orderitemid` INTEGER NOT NULL AUTO_INCREMENT,
    `Orderid` INTEGER NOT NULL,
    `ProductID` INTEGER NOT NULL,
    `Quantity` INTEGER NOT NULL,
    `OrderDate` DATETIME(3) NOT NULL,

    PRIMARY KEY (`Orderitemid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Order` (
    `OrderID` INTEGER NOT NULL AUTO_INCREMENT,
    `CustomerID` INTEGER NOT NULL,
    `ProductID` INTEGER NOT NULL,
    `TotalAmount` DOUBLE NOT NULL,
    `paymentMethod` VARCHAR(191) NOT NULL,
    `OrderDate` DATETIME(3) NOT NULL,

    PRIMARY KEY (`OrderID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Address` (
    `address_id` INTEGER NOT NULL AUTO_INCREMENT,
    `customer_id` INTEGER NOT NULL,
    `street` VARCHAR(191) NOT NULL,
    `city` VARCHAR(191) NOT NULL,
    `state` VARCHAR(191) NOT NULL,
    `zip_code` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`address_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Payment` (
    `PaymentID` INTEGER NOT NULL AUTO_INCREMENT,
    `OrderID` INTEGER NOT NULL,
    `PaymentDate` DATETIME(3) NOT NULL,
    `PaymentAmount` DOUBLE NOT NULL,
    `PaymentMethod` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`PaymentID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Orderitem` ADD CONSTRAINT `Orderitem_Orderid_fkey` FOREIGN KEY (`Orderid`) REFERENCES `Order`(`OrderID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Orderitem` ADD CONSTRAINT `Orderitem_ProductID_fkey` FOREIGN KEY (`ProductID`) REFERENCES `Product`(`ProductID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Order` ADD CONSTRAINT `Order_CustomerID_fkey` FOREIGN KEY (`CustomerID`) REFERENCES `Customer`(`CustomerID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Address` ADD CONSTRAINT `Address_customer_id_fkey` FOREIGN KEY (`customer_id`) REFERENCES `Customer`(`CustomerID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Payment` ADD CONSTRAINT `Payment_OrderID_fkey` FOREIGN KEY (`OrderID`) REFERENCES `Order`(`OrderID`) ON DELETE RESTRICT ON UPDATE CASCADE;
