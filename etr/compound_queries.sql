# query 1
# visszatér azon oktatók azonosítójával, akik doktori végzettségűek és tartanak kurzust
# létszám szerint kurzus létszám szerint csökkenő sorrendben csoportosítva
SELECT oktato.oktato_etr_id
FROM oktato
         INNER JOIN kurzus ON oktato.oktato_etr_id = kurzus.oktato_etr_id
WHERE oktato.titulus = 'Dr.'
GROUP BY kurzus.letszam
ORDER BY kurzus.letszam DESC;

# query 2
# visszatér azon oktatók párosaival, akiknek azonos a keresztnevük névsorrendbe rendezve
SELECT A.oktato_etr_id AS oktato_etr_idA, B.oktato_etr_id AS oktato_etr_idB, A.keresztnev
FROM oktato A,
     oktato B
WHERE A.oktato_etr_id <> B.oktato_etr_id
  AND A.keresztnev = B.keresztnev
GROUP BY A.keresztnev
ORDER BY A.keresztnev;

# query 3
# visszatér azon termek rekordjaival, melyeknek férőhelye nagyobb,
# mint egy véletlenszerűen választott gépteremé teremszám szerint csoportosítva és
# férőhely szerint növekvő sorrendben
SELECT B.teremszam AS terem_teremszam, B.cim AS terem_cim, B.ferohely AS terem_ferohely
FROM gepterem A,
     terem B
WHERE B.ferohely >
      (SELECT ferohel
       FROM gepterem
       ORDER BY RAND()
       LIMIT 1)
GROUP BY B.teremszam
ORDER BY B.ferohely
    ASC
