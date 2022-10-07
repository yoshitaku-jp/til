SELECT
  dt,
  SUM(purchase_amount) AS total_amount,
  CASE
    WHEN 7 = COUNT(7) OVER (
      ORDER BY
        dt ROWS BETWEEN 6 PRECEDING
        AND CURRENT ROW
    ) THEN AVG(SUM(purchase_amount)) OVER (
      ORDER BY
        dt ROWS BETWEEN 6 PRECEDING
        AND CURRENT ROW
    )
  END AS avg_seven_day
FROM
  purchase_log
GROUP BY
  dt
ORDER BY
  dt
