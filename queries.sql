USE bias_fairness_db;

-- QUERY 1: Approval rate by gender
-- SELECT d.gender,
--        ROUND(AVG(decs.predicted_outcome) * 100, 2) AS approval_percent
-- FROM decisions decs
-- JOIN demographics d USING(user_id)
-- GROUP BY d.gender;

-- QUERY 2
-- SELECT d.race,
--        ROUND(AVG(decs.predicted_outcome) * 100, 2) AS approval_percent
-- FROM decisions decs
-- JOIN demographics d USING(user_id)
-- GROUP BY d.race;

-- QUERY 3
-- SELECT d.education,
--        ROUND(AVG(decs.predicted_outcome) * 100, 2) AS approval_percent
-- FROM decisions decs
-- JOIN demographics d USING(user_id)
-- GROUP BY d.education;

-- QUERY 4: Average credit score by race
-- SELECT d.race,
--        ROUND(AVG(s.credit_score), 2) AS avg_credit_score
-- FROM scores s
-- JOIN demographics d USING(user_id)
-- GROUP BY d.race;

-- QUERY 5: Total decisions per algorithm
-- SELECT algorithm_name,
--        COUNT(*) AS total_decisions
-- FROM decisions
-- GROUP BY algorithm_name;

-- QUERY 6
-- SELECT d.gender,
--        SUM(decs.predicted_outcome = 1 AND o.actual_outcome = 0) AS false_positives,
--        COUNT(*) AS total,
--        ROUND(SUM(decs.predicted_outcome = 1 AND o.actual_outcome = 0) / COUNT(*) * 100, 2) AS fpr_percent
-- FROM decisions decs
-- JOIN outcomes o USING(decision_id)
-- JOIN demographics d USING(user_id)
-- GROUP BY d.gender;

-- QUERY 7
-- SELECT d.race,
--        ROUND(SUM(decs.predicted_outcome = 1 AND o.actual_outcome = 1) /
--              SUM(o.actual_outcome = 1) * 100, 2) AS tpr_percent
-- FROM decisions decs
-- JOIN outcomes o USING(decision_id)
-- JOIN demographics d USING(user_id)
-- GROUP BY d.race;

-- QUERY 8
-- SELECT d.race,
--        ROUND(AVG(decs.predicted_outcome) * 100, 2) AS approval_percent
-- FROM decisions decs
-- JOIN demographics d USING(user_id)
-- GROUP BY d.race
-- HAVING approval_percent < 40;

-- QUERY 9
-- SELECT decs.algorithm_name,
--        ROUND(SUM(o.is_correct) / COUNT(*) * 100, 2) AS accuracy_percent
-- FROM decisions decs
-- JOIN outcomes o USING(decision_id)
-- GROUP BY decs.algorithm_name;

-- QUERY 10
-- SELECT name, age FROM users
-- WHERE user_id IN (
--   SELECT decs.user_id FROM decisions decs
--   JOIN outcomes o USING(decision_id)
--   WHERE decs.predicted_outcome = 0 AND o.actual_outcome = 1
-- )
-- LIMIT 20;

-- QUERY 11
-- SELECT name FROM users
-- WHERE user_id IN (
--   SELECT user_id FROM scores
--   WHERE credit_score > (SELECT AVG(credit_score) FROM scores)
-- )
-- AND user_id IN (
--   SELECT user_id FROM decisions WHERE predicted_outcome = 0
-- )
-- LIMIT 30;

-- QUERY 12
-- SELECT DATE_FORMAT(decision_date, '%Y-%m') AS month,
--        COUNT(*) AS total_decisions
-- FROM decisions
-- GROUP BY month
-- ORDER BY month;

-- QUERY 13
-- SELECT d.region,
--        ROUND(SUM(decs.predicted_outcome = 0) / COUNT(*) * 100, 2) AS rejection_percent
-- FROM decisions decs
-- JOIN demographics d USING(user_id)
-- GROUP BY d.region;

-- QUERY 14
-- SELECT algorithm_name,
--        ROUND(AVG(confidence_score), 2) AS avg_confidence
-- FROM decisions
-- GROUP BY algorithm_name;

-- QUERY 15
SELECT d.gender, d.race,
       COUNT(*) AS total,
       ROUND(AVG(decs.predicted_outcome) * 100, 2) AS approval_percent
FROM decisions decs
JOIN demographics d USING(user_id)
GROUP BY d.gender, d.race
ORDER BY approval_percent ASC;