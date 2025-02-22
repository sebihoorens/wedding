SELECT
  id::text,
  first_name, last_name, email,
  address_street, address_number,
  address_city, address_zip,
  address_province, address_country,
  diet, songs, notes, NULL as child,
  updated_at
FROM guests
WHERE attending

UNION ALL

SELECT
  guest_id || '-' || plus_ones.id AS id,
  plus_ones.first_name, plus_ones.last_name, NULL AS email,
  NULL as address_street, NULL as address_number,
  NULL as address_city, NULL as address_zip,
  NULL as address_province, NULL as address_country,
  plus_ones.diet, NULL as songs, NULL as notes, plus_ones.child,
  plus_ones.updated_at
FROM plus_ones
JOIN guests ON plus_ones.guest_id = guests.id
WHERE guests.attending
