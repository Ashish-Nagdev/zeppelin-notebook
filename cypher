MATCH (ee:Patient) WHERE ee.type = "PatientNode"
CREATE (a:Patient { PatientOid: "ABC123", name: "ABC", PhysicianNPI: "Physician123", VisitType: "ICU", BirthDate: "09/04/1932 09:52:00", Hemoglobin_A1C: 7.3, Respiration: 18,BMI: 25.56,SBP: 95,DBP: 145,HeartRate: 89,Temperature: 36.7, eGfr: 42, hdl: 45, ldl: 145, triglycerides: 255 }),
(b:Patient { PatientOid: "AB4123", name: "John", PhysicianNPI: "Physician453", VisitType: "ICU", BirthDate: "04/05/1945 06:21:22", Hemoglobin_A1C: 8.6, Respiration: 22,BMI: 28.56,SBP: 105,DBP: 155,HeartRate: 92,Temperature: 48.7, eGfr: 54, hdl: 42, ldl: 140, triglycerides: 250 }),
(c:Patient { PatientOid: "Ash23", name: "Ashish", PhysicianNPI: "Physician999", VisitType: "ICU", BirthDate: "04/11/1991 23:34:56", Hemoglobin_A1C: 11.0, Respiration: 28,BMI: 34.56,SBP: 125,DBP: 175,HeartRate: 112,Temperature: 78.7, eGfr: 64, hdl: 52, ldl: 144, triglycerides: 260 }),
(d:Patient { PatientOid: "XY0891", name: "XYZ", PhysicianNPI: "Physician93", VisitType: "ICU", BirthDate: "03/06/1947 03:19:27", Hemoglobin_A1C: 10.6, Respiration: 23,BMI: 24.56,SBP: 95,DBP: 145,HeartRate: 82,Temperature: 42.7, eGfr: 40, hdl: 41, ldl: 144, triglycerides: 252 }),
(e:Patient { PatientOid: "AAA823", name: "AAA", PhysicianNPI: "Physician453", VisitType: "ICU", BirthDate: "09/04/1925 08:37:22", Hemoglobin_A1C: 5.6, Respiration: 22,BMI: 34.56,SBP: 110,DBP: 165,HeartRate: 95,Temperature: 49.7, eGfr: 96, hdl: 46, ldl: 146, triglycerides: 256 }),
(f:Patient { PatientOid: "BB9723", name: "BBB", PhysicianNPI: "Physician453", VisitType: "ICU", BirthDate: "09/04/1936 08:51:06", Hemoglobin_A1C: 6.6, Respiration: 26,BMI: 28.56,SBP: 108,DBP: 158,HeartRate: 98,Temperature: 48.8, eGfr: 18, hdl: 48, ldl: 148, triglycerides: 258 }),
(g:Patient { PatientOid: "ABCC44", name: "CCC", PhysicianNPI: "Physician49", VisitType: "ICU", BirthDate: "09/04/1939 09:29:29", Hemoglobin_A1C: 9.9, Respiration: 29,BMI: 29.56,SBP: 109,DBP: 159,HeartRate: 99,Temperature: 49.9, eGfr: 12, hdl: 49, ldl: 149, triglycerides: 259 }),
(h:Patient { PatientOid: "DD479", name: "DDD", PhysicianNPI: "Physician33", VisitType: "ICU", BirthDate: "03/03/1933 03:23:32", Hemoglobin_A1C: 8.3, Respiration: 23,BMI: 28.36,SBP: 103,DBP: 145,HeartRate: 93,Temperature: 43.7, eGfr: 23, hdl: 43, ldl: 143, triglycerides: 230 }),
(i:Patient { PatientOid: "EE23", name: "EEE", PhysicianNPI: "Physician453", VisitType: "ICU", BirthDate: "02/24/1925 06:22:22", Hemoglobin_A1C: 8.2, Respiration: 22,BMI: 28.26,SBP: 102,DBP: 152,HeartRate: 92,Temperature: 48.2, eGfr: 22, hdl: 42, ldl: 130, triglycerides: 237 }),
(j:Patient { PatientOid: "FF123", name: "FFF", PhysicianNPI: "Physician467", VisitType: "ICU", BirthDate: "07/06/1935 06:07:27", Hemoglobin_A1C: 11.6, Respiration: 27,BMI: 26.76,SBP: 115,DBP: 165,HeartRate: 97,Temperature: 47.7, eGfr: 35, hdl: 46, ldl: 146, triglycerides: 256 }),

CREATE(z: CKD { diagnosis: "Chronic kidney disease, stage 1", icd10: "N18.1", eGFR: "90-150"})
CREATE(y: CKD { diagnosis: "Chronic kidney disease, stage 2 (mild)", icd10: "N18.2", eGFR: "60-89"})
CREATE(x: CKD { diagnosis: "Chronic kidney disease, stage 3A (moderate)", icd10: "N18.3A", eGFR: "45-59"})
CREATE(w: CKD { diagnosis: "Chronic kidney disease, stage 3B (moderate)", icd10: "N18.3B", eGFR: "30-44"})
CREATE(v: CKD { diagnosis: "Chronic kidney disease, stage 4 (severe)", icd10: "N18.4", eGFR: "15-29"})
CREATE(u: CKD { diagnosis: "Chronic kidney disease, stage 5 Excludes1: chronic kidney disease, stage 5 requiring chronic dialysis (N18.6) ", icd10: "N18.5", eGFR: "0-14"})


CREATE(y: ChronicKidneyDiseaseStage4 { icd10: "N18.4", eGFR: "30-44"})
CREATE(x: ChronicKidneyDiseaseStage5 { icd10: "N18.5", eGFR: "15-29"})

CREATE(s1: Hypertension {diagnosis: "Essential (primary) Stage 1 hypertension", icd: "I10-1", SBP: "140-159", DBP: "90-99" })
CREATE(s2: Hypertension {diagnosis: "Essential (Secondary) Stage 2 hypertension", icd: "I10-2", SBP: "160-179", DBP: "100-109" })
CREATE(s3: Hypertension {diagnosis: "Pre Hypertension", icd: "R03.0", SBP: "120-139", DBP: "<80" })
CREATE(s4: Hypertension {diagnosis: "Hypertension Urgency", icd: "I16", SBP: ">180", DBP: ">105" })


MATCH (p:Patient) 
WHERE (140 < p.SBP < 159 AND 90 < p.DBP < 99)
MATCH (c:Hypertension) 
WHERE c.icd = "I10-1" 
CREATE (p)-[:diagnosedwith]->(c)

MATCH (p:Patient) 
WHERE (160 < p.SBP < 179 AND 100 < p.DBP < 109)
MATCH (c:Hypertension) 
WHERE c.icd = "I10-2" 
CREATE (p)-[:diagnosedwith]->(c)

MATCH (p:Patient) 
WHERE (120 < p.SBP < 139 AND p.DBP < 80 )
MATCH (c:Hypertension) 
WHERE c.icd = "R03.0" 
CREATE (p)-[:diagnosedwith]->(c)


MATCH (p:Patient) 
WHERE (p.SBP > 180 AND p.DBP < 80 )
MATCH (c:Hypertension) 
WHERE c.icd = "R03.0" 
CREATE (p)-[:diagnosedwith]->(c)


 if ((sbp >= 140 && sbp <= 159) || (dbp >= 90 && dbp <= 99)) {
      "I10-1"
    } else if ((sbp >= 160 && sbp <= 179) || (dbp >= 100 && dbp <= 199)) {
      "I10-2"
    } else if ((sbp >= 120 && sbp <= 139) || (dbp >= 80 && dbp <= 89)) {
      "R03.0"
    } else if ((sbp < 120) || (dbp < 80)) {
      ""
    } else if (sbp > 180 && dbp > 105) {
      "I160(I16.0)"
    }
    else "I160(I16.0)"


CREATE(ss: Type2DiabetesMellitiusWithHyperglycemia {icd: "E11.65", Hemoglobin_A1C: "6.5+" })
(ee)-[:KNOWS {since: 2001}]->(js),(ee)-[:KNOWS {rating: 5}]->(ir),
(js)-[:KNOWS]->(ir),(js)-[:KNOWS]->(rvb),
(ir)-[:KNOWS]->(js),(ir)-[:KNOWS]->(ally),
(rvb)-[:KNOWS]->(ally)



CREATE(s1: Hypertension {icd: "R73.03", Hemoglobin_A1C: "5.4-6.4" })
CREATE(s2: Diabetes {icd: "R73.03", Hemoglobin_A1C: "5.4-6.4" })
CREATE(s2: Diabetes {icd: "R73.03", Hemoglobin_A1C: "5.4-6.4" })
CREATE(s2: Diabetes {icd: "R73.03", Hemoglobin_A1C: "5.4-6.4" })
CREATE(s2: Diabetes {icd: "R73.03", Hemoglobin_A1C: "5.4-6.4" })








MATCH (ee:Patient) WHERE ee.eGfr < 90 AND ee.eGfr > 45



((0, 14), (15, 29), (30, 59), (60, 89), (90, 150))


START n=node(*) RETURN n;
It's very obvious, and it will return all the existing nodes in the database.

EDIT : the following displays the nodes and the relationships :

	START n=node(*) MATCH (n)-[r]->(m) RETURN n,r,m;


MATCH (p:Patient) 
WHERE 0 < p.eGfr < 15 RETURN p
MATCH (c:CKD) 
WHERE c.eGFR = "0-14" 
CREATE (p)-[:HAS]->(c)


MATCH (p:Patient) 
WHERE 15 < p.eGfr < 29 
MATCH (c:CKD) 
WHERE c.eGFR = "15-29" 
CREATE (p)-[:HAS]->(c)


MATCH (p:Patient) 
WHERE 30 < p.eGfr < 44 
MATCH (c:CKD) 
WHERE c.eGFR = "30-44" 
CREATE (p)-[:HAS]->(c)

MATCH (p:Patient) 
WHERE 45 < p.eGfr < 59 
MATCH (c:CKD) 
WHERE c.eGFR = "45-59" 
CREATE (p)-[:HAS]->(c)

MATCH (p:Patient) 
WHERE 60 < p.eGfr < 89 
MATCH (c:CKD) 
WHERE c.eGFR = "60-89" 
CREATE (p)-[:HAS]->(c)

MATCH (p:Patient) 
WHERE 90 < p.eGfr < 150 
MATCH (c:CKD) 
WHERE c.eGFR = "90-150" 
CREATE (p)-[:HAS]->(c)


MATCH (n: Diabetes) WHERE n.icd="I10-1"
DELETE n	

MATCH (n: Diabetes) WHERE n.icd="I10-2"
DELETE n

MATCH (n: Diabetes) WHERE n.icd="I16"
DELETE n

MATCH (n: Diabetes) WHERE n.icd="R03.3"
DELETE n
