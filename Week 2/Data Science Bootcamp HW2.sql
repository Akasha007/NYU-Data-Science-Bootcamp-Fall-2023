# Name: Akasha Tigalappanavara
# NYU ID: N13698386
# Net id: at5854

# 1. Pull total number of orders that were completed on 18th March 2023

# Answer:

SELECT 
    COUNT(DISTINCT Order_id) AS total_orders
FROM
    SALES
WHERE
    Date = '03-18-2023';
 
#2. Pull total number of orders that were completed on 18th March 2023 with the first name ‘John’ and last name ‘Doe’

# Answer:
SELECT 
    COUNT(DISTINCT s.Order_id) AS total_orders
FROM
    SALES s
        JOIN
    CUSTOMERS c ON s.customer_id = c.customer_id
WHERE
    s.Date = '03-18-2023'
        AND c.First_name = 'John'
        AND c.Last_name = 'Doe';

#3. Pull total number of customers that purchased in January 2023 and the average amount spend per customer

# Answer:
SELECT 
    COUNT(DISTINCT s.Customer_id) AS total_orders,
    AVG(Revenue) AS avg_revenue_per_customer
FROM
    SALES s
        JOIN
    CUSTOMERS c ON s.customer_id = c.customer_id
WHERE
    s.Date LIKE '%-%-2023';

#4. Pull the departments that generated less than $600 in 2022
# Answer:

SELECT 
    department, SUM(Revenue) AS total_revenue
FROM
    SALES
        JOIN
    ITEMS ON SALES.Item_id = ITEMS.Item_id
GROUP BY department
HAVING SUM(Revenue) < 600;

#5. What is the most and least revenue we have generated by an order
# Answer:

SELECT 
    MIN(Revenue) AS least_revenue, MAX(Revenue) AS most_revenue
FROM
    SALES;
    
#6. What were the orders that were purchased in our most lucrative order
# Answer:

SELECT 
    Item_name, Quantity, Price, Revenue
FROM
    SALES
        JOIN
    ITEMS ON SALES.Item_id = ITEMS.Item_id
WHERE
    Order_id = (SELECT 
            Order_id
        FROM
            SALES
        ORDER BY Revenue DESC
        LIMIT 1);