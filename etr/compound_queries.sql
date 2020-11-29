# query 1
# visszatér azon oktatók azonosítójával, akik doktori végzettségűek és tartanak kurzust
# létszám szerint: kurzus létszám szerint csökkenő sorrendben csoportosítva

#localhost/etrdb/oktato/		http://localhost/phpmyadmin/tbl_sql.php?db=etrdb&table=terem
# Showing rows 0 -  9 (10 total, Query took 0.0012 seconds.)

SELECT oktato.oktato_etr_id
FROM oktato
         INNER JOIN kurzus ON oktato.oktato_etr_id = kurzus.oktato_etr_id
WHERE oktato.titulus = 'Dr.'
GROUP BY kurzus.letszam
ORDER BY kurzus.letszam DESC;

/*eredmény
oktato_etr_id
obrPGn
lZSF2v
zCFrSz
Vy5tbT
O9QLxv
ICGP4I
tjgS4B
hNOZTP
AhkNq9
9CWnKr
*/

# query 2
# visszatér azon oktatók párosaival, akiknek azonos a keresztnevük névsorrendbe rendezve

#localhost/etrdb/oktato/		http://localhost/phpmyadmin/tbl_sql.php?db=etrdb&table=oktato
# Showing rows 0 -  9 (10 total, Query took 0.0022 seconds.) [keresztnev: AMY... - TRACY...]

SELECT A.oktato_etr_id AS oktato_etr_idA, B.oktato_etr_id AS oktato_etr_idB, A.keresztnev
FROM oktato A,
     oktato B
WHERE A.oktato_etr_id <> B.oktato_etr_id
  AND A.keresztnev = B.keresztnev
GROUP BY A.keresztnev
ORDER BY A.keresztnev;

/* eredmény
oktato_etr_idA	oktato_etr_idB	keresztnev
WZYfPQ	CNt2wo	Amy
GHOM1w	7ero2n	David
MLMsD9	m6ps6B	James
zJy1Bf	9QqbCD	Jean
X5wIxB	wensml	John
xsqBKI	kYbt9Z	Karen
sylUNq	bGPc8G	Linda
vLoMhw	Djvk16	Mary
croQGW	69CvrZ	Robert
R47VEh	Is2WB8	Tracy
*/

# query 3
# visszatér azon termek rekordjaival, melyeknek férőhelye nagyobb,
# mint egy véletlenszerűen választott gépteremé teremszám szerint csoportosítva és
# férőhely szerint növekvő sorrendben

#localhost/etrdb/terem/		http://localhost/phpmyadmin/tbl_sql.php?db=etrdb&table=oktato
# Showing rows 0 - 51 (52 total, Query took 0.0040 seconds.)

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
    ASC;

/* eredmény (csak egy eset, egyértelműen RAND() miatt változni fog
terem_teremszam	terem_cim	terem_ferohely
IY1rwj	16779 Mike Lakes Suite 718 Hollyland, WY 37024	27
6FNStz	697 Rodriguez Drive Apt. 644 Port Shelley, NM 2038...	31
LciVT7	930 Smith Meadows South Gabrielle, MI 22753	32
skToVQ	4472 Thomas Freeway West Stacey, SC 53820	33
OhmILN	72259 Sean Heights Apt. 421 Port Sean, TN 87343	33
2imbid	78785 Anthony Harbor West Amberton, ME 52748	35
m4mcrf	1822 Miles Points Apt. 503 Beckerberg, DE 09409	37
95ipN9	3758 Shawn Underpass Suite 656 New Scotthaven, OK ...	39
cEWr3Z	29203 Terri Mountain Suite 699 Williamtown, MN 441...	44
r19HwD	793 Margaret Lane New Lindsey, MS 87610	45
ejJ4Wb	020 Zachary Point Apt. 552 Port Josetown, ND 92890	48
IJy1x7	47763 Matthew Oval Suite 784 Tanyahaven, IL 95341	49
1SHFkf	166 Cunningham Pike Apt. 575 Port Shaun, LA 38014	50
pdxZ8B	5100 Scott Gateway Suite 232 Adrianchester, ND 771...	52
kcKdGR	5221 Douglas Hill Apt. 580 Wilsonberg, ID 71668	57
9SJKGT	0646 Lynch Oval Hintonland, VA 42964	65
iosjcr	0677 Laura Field Apt. 474 Bradland, NV 95808	70
6HW5m1	73621 Sullivan Forks West Loritown, ND 47213	71
FxXwH3	62662 Brittney Burgs West Jessemouth, MI 43429	75
MM88xe	35317 John Mountain Carpenterland, WI 86792	78
MzNmSR	4999 Velasquez Locks East Kimberly, NH 35520	94
6LIR9h	794 Daniel Circle North Debbieburgh, ID 26815	96
3aWfPf	686 Kelli Trail Petersside, CO 71443	103
jSLDtd	35077 Steven Center Suite 013 Pricefort, IL 27493	104
YeR2ij	3775 Ochoa Drives Paceshire, AR 83400	106
jbJKeb	32715 Edwards Mills Suite 026 East David, HI 55177	110
nuojcq	03319 Mcconnell Roads Suite 163 New Cameron, WY 48...	112
tMyTpE	2603 Aaron Mall Jamesburgh, FL 20057	115
dKyE5Y	344 Nicholas Extensions Bakershire, IA 21369	116
Jvj66O	0944 Tara Brooks South Lori, AZ 32072	117
HrSYbV	8772 Angie Light Port Deborah, OK 49604	123
BFprrR	3231 Cuevas Throughway Lake Kevin, NM 53640	127
iYtUyO	Unit 7294 Box 3575 DPO AP 64777	158
fcSZSF	724 Ballard Union Melissabury, AZ 34704	171
MwVvoa	283 Owens Lakes Andrewhaven, TN 49554	174
W9CNsJ	928 Ayala Falls Jasonstad, GA 98262	180
UamzWQ	9981 Kerr Mission Calhounmouth, VT 10029	187
2ZZqeS	USNV Jones FPO AE 93216	194
wmkTfk	85471 James Loop North Davidborough, VT 05856	197
c16DmG	39097 Perez Turnpike Paulview, VT 24481	198
Pb54fQ	37995 Smith Points Suite 268 Port Ashley, IN 09947	203
d8wlMD	8296 Julie Roads Apt. 504 Sheilaport, AK 12029	204
FGS2b7	4348 James Crossing Apt. 366 Dicksonburgh, MN 7622...	205
s975Th	841 Lee Forest Port Stephen, AK 79095	235
T3Wgi9	31094 Arroyo Knoll Blackside, FL 94970	236
fl2uTH	9049 Harrison Plaza South Kimberly, AR 73198	245
C9o6bi	Unit 4860 Box 9197 DPO AA 25936	269
I5GfUF	4035 Andrew Brooks Mccarthyville, UT 81161	285
Q29Qvh	9105 Whitney Gateway Phelpsborough, IA 92405	294
bTDf9F	056 Mason Trail Garciashire, NM 61810	303
pK7kck	912 Lester Green West Gary, PA 42054	311
Exu6gu	6536 Williams Haven Medinaview, NM 72940	344
*/