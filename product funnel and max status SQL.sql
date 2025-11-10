-- this sql code query pulls for each order the current status and the max status reached within the order completion funnel.
-- the output dataset was put into Power BI to make the attached dashboard.


CREATE ROLE funnel_user LOGIN PASSWORD 'ChangeThisNow!';
CREATE SCHEMA IF NOT EXISTS funnel AUTHORIZATION funnel_user;
ALTER DATABASE funnel_analytics SET search_path = funnel, public;
SELECT current_database() AS db, current_schema() AS schema;


-- Orders table 
CREATE TABLE orders (
  orderid       INTEGER PRIMARY KEY,
  companyid     TEXT NOT NULL,
  orderdate     DATE NOT NULL,
  currentstatus TEXT NOT NULL
);

-- Order status transitions 
CREATE TABLE order_status_log (
  orderid         INTEGER NOT NULL,
  companyid       TEXT NOT NULL,
  previousstatus  TEXT NOT NULL,
  newstatus       TEXT NOT NULL,
  statustimestamp TIMESTAMP NOT NULL
);

-- indexes for faster querying
CREATE INDEX idx_osl_orderid ON order_status_log(orderid);
CREATE INDEX idx_osl_time    ON order_status_log(statustimestamp);
CREATE INDEX idx_ord_company ON orders(companyid);

SELECT COUNT(*) FROM orders;

SELECT COUNT(*) FROM order_status_log;

truncate table order_status_log; 
SELECT COUNT(*) FROM order_status_log;


WITH status_levels AS (
  SELECT
    o.orderid,
    o.companyid,
    o.orderdate,
    osl.previousstatus,
    osl.newstatus,
    osl.statustimestamp,
    CASE
      WHEN osl.newstatus = 'Created'         THEN 0
      WHEN osl.newstatus = 'Interacted'      THEN 1
      WHEN osl.newstatus = 'LoginAttempted'  THEN 2
      WHEN osl.newstatus = 'LoginSuccess'    THEN 3
      WHEN osl.newstatus = 'Completed'       THEN 4
      ELSE NULL
    END AS status_level
  FROM orders o
  LEFT JOIN order_status_log osl
    ON o.orderid = osl.orderid
)
SELECT
  s.orderid,
  MIN(s.orderdate) AS order_date,
  MAX(s.status_level) AS max_status_level,
  MAX(s.newstatus) FILTER (
      WHERE s.statustimestamp = (
          SELECT MAX(s2.statustimestamp)
          FROM status_levels s2
          WHERE s2.orderid = s.orderid
      )
  ) AS current_status,
  s.companyid
FROM status_levels s
GROUP BY s.orderid, s.companyid
ORDER BY s.orderid
LIMIT 20;


select current_user, now()


