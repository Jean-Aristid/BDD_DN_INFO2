/*Question 1*/

SELECT dept_name
FROM department
WHERE budget = (SELECT MAX(budget) FROM department); 


/*Question 2*/

SELECT name, salary
FROM teacher
WHERE salary > (SELECT AVG(salary) FROM teacher)
ORDER BY salary DESC;


/*Question 3*/

SELECT te.ID AS id_enseignant, t.name AS enseignant, tk.ID AS id_etudiant, s.name AS etudiant,
COUNT(*) AS nb_cours
FROM teaches te
JOIN takes tk ON te.course_id = tk.course_id
AND te.sec_id = tk.sec_id
AND te.semester = tk.semester
AND te.year = tk.year
JOIN teacher t ON te.ID = t.ID
JOIN student s ON tk.ID = s.ID
GROUP BY te.ID, t.name, tk.ID, s.name
HAVING COUNT(*) > 2;



/*Question 4*/


SELECT * 
FROM ( 
    SELECT te.ID AS id_enseignant, t.name AS enseignant, tk.ID AS id_etudiant, s.name AS etudiant,
    COUNT(*) AS nb_cours
    FROM teaches te
    JOIN takes tk ON te.course_id = tk.course_id
    AND te.sec_id = tk.sec_id
    AND te.semester = tk.semester
    AND te.year = tk.year
    JOIN teacher t ON te.ID = t.ID
    JOIN student s ON tk.ID = s.ID
    GROUP BY te.ID, t.name, tk.ID, s.name
) sub 
WHERE sub.nb_cours > 2 ; 



/*Question 5 */

SELECT s.ID, s.name
FROM student s
WHERE s.ID NOT IN (
    SELECT ID FROM takes WHERE year < 2010
); 


/*Question 6 */

SELECT name
FROM teacher
WHERE name LIKE 'E%'; 


/*Question 7*/
SELECT name, salary
FROM teacher
WHERE salary = (
    SELECT MIN(salary)
    FROM (
        SELECT DISTINCT salary
        FROM teacher
        ORDER BY salary DESC
        FETCH NEXT 4 ROWS ONLY
    ) 
);

/*Question 8*/

SELECT name, salary
FROM (
    SELECT name, salary
    FROM teacher
    ORDER BY salary ASC
    FETCH NEXT 3 ROWS ONLY
)
ORDER BY salary DESC ;



/* Question 9 */

SELECT name
FROM student
WHERE ID IN (
    SELECT ID FROM takes
    WHERE semester = 'Fall' AND year = 2009
);



/* Question 10 */

SELECT name 
FROM student
WHERE ID = SOME ( 
    SELECT ID FROM takes
    WHERE semester = 'Fall' AND year = 2009
); 



/*Question 11 */
SELECT DISTINCT s.name
FROM student s
NATURAL INNER JOIN takes tk
WHERE tk.semester = 'Fall' AND tk.year = 2009;




/*Question 12*/

SELECT name
FROM student s
WHERE EXISTS (
    SELECT 1 FROM takes tk
    WHERE tk.ID = s.ID
    AND tk.semester = 'Fall'
    AND tk.year = 2009
) ; 



/*Question 13 */

SELECT DISTINCT s1.name AS etudiant_1, s2.name AS etudiant_2
FROM takes t1
JOIN takes t2 ON t1.course_id = t2.course_id
AND t1.sec_id = t2.sec_id
AND t1.semester = t2.semester
AND t1.year = t2.year
AND t1.ID < t2.ID

JOIN student s1 ON t1.ID = s1.ID
JOIN student s2 ON t2.ID = s2.ID
;

/*Question 14*/

SELECT t.name AS enseignant, COUNT(*) AS nb_etudiants
FROM teacher t
JOIN teaches te ON t.ID = te.ID
JOIN takes tk ON te.course_id = tk.course_id
AND te.sec_id = tk.sec_id
AND te.semester = tk.semester
AND te.year = tk.year
GROUP BY t.ID, t.name
ORDER BY nb_etudiants DESC;



/*Question 15 */
SELECT t.name AS enseignant, COUNT(tk.ID) AS nb_etudiants
FROM teacher t
LEFT JOIN teaches te ON t.ID = te.ID
LEFT JOIN takes tk ON te.course_id = tk.course_id
AND te.sec_id = tk.sec_id
AND te.semester = tk.semester
AND te.year = tk.year
GROUP BY t.ID, t.name
ORDER BY nb_etudiants DESC;


/*Question 16 */

SELECT t.name AS enseignant, COUNT(*) AS nb_A
FROM teacher t 
JOIN teaches te ON t.ID = te.ID
JOIN takes tk ON te.course_id = tk.course_id
AND te.sec_id = tk.sec_id
AND te.semester = tk.semester
AND te.year = tk.year
WHERE tk.grade = 'A'
GROUP BY t.ID, t.name;




/*QUestion 17 */

SELECT t.name AS enseignant, s.name AS etudiant,COUNT(*) AS nb_cours
FROM teacher t
JOIN teaches te ON t.ID = te.ID
JOIN takes tk ON te.course_id = tk.course_id
AND te.sec_id = tk.sec_id
AND te.semester = tk.semester
AND te.year = tk.year
JOIN student s ON tk.ID = s.ID
GROUP BY t.ID, t.name, s.ID, s.name;



/*Question 18*/

SELECT t.name AS enseignant, s.name AS etudiant, COUNT(*) AS nb_cours
FROM teacher t
JOIN teaches te ON t.ID = te.ID
JOIN takes tk ON te.course_id = tk.course_id
AND te.sec_id = tk.sec_id
AND te.semester = tk.semester
AND te.year = tk.year
JOIN student s ON tk.ID = s.ID
GROUP BY t.ID, t.name, s.ID, s.name
HAVING COUNT(*) >= 2; 



























