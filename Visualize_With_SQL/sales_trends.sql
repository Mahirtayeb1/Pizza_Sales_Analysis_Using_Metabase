SELECT
  CAST(
    extract(
      day
      from
        "Orders"."date"
    ) AS integer
  ) AS "Orders__date",
  SUM("Pizzas"."price") AS "sum"
FROM
  "public"."order_details"
 
LEFT JOIN (
    SELECT
      "public"."pizzas"."id" AS "id",
      "public"."pizzas"."pizza_type_id" AS "pizza_type_id",
      "public"."pizzas"."size" AS "size",
      "public"."pizzas"."price" AS "price"
    FROM
      "public"."pizzas"
  ) AS "Pizzas" ON "public"."order_details"."pizza_id" = "Pizzas"."id"
  LEFT JOIN (
    SELECT
      "public"."pizza_types"."id" AS "id",
      "public"."pizza_types"."name" AS "name",
      "public"."pizza_types"."category" AS "category",
      "public"."pizza_types"."ingredients" AS "ingredients"
    FROM
      "public"."pizza_types"
  ) AS "Pizza Types" ON "Pizzas"."pizza_type_id" = "Pizza Types"."id"
  LEFT JOIN (
    SELECT
      "public"."orders"."id" AS "id",
      "public"."orders"."date" AS "date",
      "public"."orders"."time" AS "time"
    FROM
      "public"."orders"
  ) AS "Orders" ON "public"."order_details"."order_id" = "Orders"."id"
GROUP BY
  CAST(
    extract(
      day
      from
        "Orders"."date"
    ) AS integer
  )
ORDER BY
  CAST(
    extract(
      day
      from
        "Orders"."date"
    ) AS integer
  ) ASC