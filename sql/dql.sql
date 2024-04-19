-- Q1a
SELECT c.CustomerID, c.Name, c.Phone, c.Address
FROM customer c
INNER JOIN customerinstance ci ON c.CustomerID = ci.CustomerID
INNER JOIN booking b ON ci.OrderID = b.OrderID
INNER JOIN shipping s ON b.BookingID = s.BookingID
WHERE s.ShippingID = '123456' and s.CompanyName = 'USPS';


-- Q1b
SELECT productname, quantity
FROM product AS pd
JOIN cart as ct on pd.productid = ct.productid
JOIN customerinstance as ci on ct.cartid = ci.cartid
JOIN booking AS b ON ci.orderid = b.orderid
JOIN shipping AS s ON b.bookingid = s.bookingid 
WHERE s.shippingid = '123456' AND s.companyname = 'USPS';


-- Q1c
UPDATE storeprod sp
JOIN (
    SELECT sp.StoreID, sp.ProductID, SUM(ct.Quantity) AS TotalQuantity
    FROM storeprod sp
    JOIN cart ct ON sp.StoreID = ct.StoreID AND sp.ProductID = ct.ProductID
    JOIN customerinstance ci ON ct.CartID = ci.CartID
    JOIN booking bo ON ci.OrderID = bo.OrderID
    JOIN shipping sh ON bo.BookingID = sh.BookingID
    WHERE sh.ShippingID = '123456' AND sh.CompanyName = 'USPS'
    GROUP BY sp.StoreID, sp.ProductID
) AS shipped ON sp.StoreID = shipped.StoreID AND sp.ProductID = shipped.ProductID
SET sp.Quantity = sp.Quantity - shipped.TotalQuantity;

INSERT INTO shipping (ShippingID, BookingID, CompanyName, Location, DeliveryDate, Deadline)
SELECT 'SHIP002', BookingID, CompanyName, "Bay Arizona", DeliveryDate, Deadline
FROM shipping
WHERE ShippingID = '123456' AND CompanyName = 'USPS';

select * from shipping;


-- Q2)
SELECT c.CustomerID, c.Name, SUM(p.Price) AS TotalPurchase
FROM customer c
JOIN customerinstance ci ON c.CustomerID = ci.CustomerID
JOIN cart ct ON ci.CartID = ct.CartID
JOIN storeprod sp ON ct.StoreID = sp.StoreID AND ct.ProductID = sp.ProductID
JOIN product p ON sp.ProductID = p.ProductID
JOIN booking b ON ci.OrderID = b.OrderID
WHERE b.BookingDate >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
GROUP BY c.CustomerID
ORDER BY TotalPurchase DESC
LIMIT 1;


-- Q3)
SELECT p.ProductID, p.ProductName, SUM(p.Price * ct.Quantity) AS TotalSalesAmount
FROM product p
JOIN storeprod sp ON p.ProductID = sp.ProductID
JOIN cart ct ON sp.StoreID = ct.StoreID AND sp.ProductID = ct.ProductID
JOIN customerinstance ci ON ct.CartID = ci.CartID
JOIN booking b ON ci.OrderID = b.OrderID
WHERE b.BookingDate >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
GROUP BY p.ProductID, p.ProductName
ORDER BY TotalSalesAmount DESC
LIMIT 2;

-- Q4)
SELECT p.ProductID, p.ProductName, SUM(ct.Quantity) AS TotalUnitSales
FROM product p
JOIN storeprod sp ON p.ProductID = sp.ProductID
JOIN cart ct ON sp.StoreID = ct.StoreID AND sp.ProductID = ct.ProductID
JOIN customerinstance ci ON ct.CartID = ci.CartID
JOIN booking b ON ci.OrderID = b.OrderID
WHERE b.BookingDate >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
GROUP BY p.ProductID, p.ProductName
ORDER BY TotalUnitSales DESC
LIMIT 2;

-- Q5)
SELECT p.ProductID, p.ProductName
FROM product p
WHERE NOT EXISTS (
    SELECT 1
    FROM store s
    LEFT JOIN storeprod sp ON s.StoreID = sp.StoreID AND sp.ProductID = p.ProductID
    WHERE s.Address LIKE '%California%'
    AND sp.Quantity > 0
);

-- Q6)
SELECT bookingid from shipping as s
WHERE s.DeliveryDate > s.Deadline;


-- Q7)
SELECT c.CustomerID, c.Name, SUM(p.Price * ct.Quantity) AS TotalAmount
FROM customer c
JOIN customerinstance ci ON c.CustomerID = ci.CustomerID
JOIN cart ct ON ci.CartID = ct.CartID
JOIN storeprod sp ON ct.StoreID = sp.StoreID AND ct.ProductID = sp.ProductID
JOIN product p ON sp.ProductID = p.ProductID
JOIN booking b ON ci.OrderID = b.OrderID
WHERE b.BookingDate >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
GROUP BY c.CustomerID, c.Name;