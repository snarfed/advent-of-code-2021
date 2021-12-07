CREATE TABLE crab (pos INT);

-- mysql advent -e "INSERT INTO crab VALUES (`sed 's/,/),(/g' day-7.input`);"

SELECT seq.v, SUM(ABS(seq.v - pos) * (ABS(seq.v - pos) + 1) / 2) fuel
FROM seq
LEFT JOIN crab ON true
GROUP BY seq.v
ORDER BY fuel DESC;
