SELECT sum(quantity) AS Result FROM shop.dbo.order_details
    WHERE
        order_id IN (SELECT ID FROM shop.dbo.orders WHERE completion_date >= '2022-01-30 20:02:23')
          and product_id IN (SELECT ID FROM shop.dbo.products WHERE category_id = 1)
