-- MySQL Workbench Synchronization

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER TABLE `Store_transactions`.`transactions` 
DROP FOREIGN KEY `product_id`,
DROP FOREIGN KEY `store_id`;

ALTER TABLE `Store_transactions`.`customers` 
ADD UNIQUE INDEX `idx_customers_first_name_last_name` (`first_name` ASC, `last_name` ASC) VISIBLE,
DROP INDEX `UNIQUE` ;
;

ALTER TABLE `Store_transactions`.`sales_reps` 
ADD UNIQUE INDEX `idx_sales_reps_first_name_last_name` (`first_name` ASC, `last_name` ASC) VISIBLE,
DROP INDEX `UNIQUE` ;
;

ALTER TABLE `Store_transactions`.`transactions` 
DROP FOREIGN KEY `customer_id`,
DROP FOREIGN KEY `sales_rep_id`;

ALTER TABLE `Store_transactions`.`transactions` ADD CONSTRAINT `customer_id`
  FOREIGN KEY (`customer_id`)
  REFERENCES `Store_transactions`.`customers` (`customer_id`),
ADD CONSTRAINT `product_id`
  FOREIGN KEY (`product_id`)
  REFERENCES `Store_transactions`.`products` (`product_id`),
ADD CONSTRAINT `sales_rep_id`
  FOREIGN KEY (`sales_rep_id`)
  REFERENCES `Store_transactions`.`sales_reps` (`sales_rep_id`),
ADD CONSTRAINT `store_id`
  FOREIGN KEY (`store_id`)
  REFERENCES `Store_transactions`.`stores` (`store_id`);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
