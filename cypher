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





------------------------------------------------------

CREATE (a:Patient { PatientOid: "ABC123", name: "ABC", PhysicianNPI: "Physician123", VisitType: "ICU", BirthDate: "09/04/1932 09:52:00", Hemoglobin_A1C: 7.3, Respiration: 18,BMI: 25.56,DBP: 95,SBP: 145,HeartRate: 89,Temperature: 36.7, eGfr: 42, hdl: 45, ldl: 145, triglycerides: 255 }),
(b:Patient { PatientOid: "AB4123", name: "John", PhysicianNPI: "Physician453", VisitType: "ICU", BirthDate: "04/05/1945 06:21:22", Hemoglobin_A1C: 8.6, Respiration: 22,BMI: 28.56,DBP: 85,SBP: 155,HeartRate: 92,Temperature: 48.7, eGfr: 54, hdl: 42, ldl: 140, triglycerides: 250 }),
(c:Patient { PatientOid: "Ash23", name: "Ashish", PhysicianNPI: "Physician999", VisitType: "ICU", BirthDate: "04/11/1991 23:34:56", Hemoglobin_A1C: 11.0, Respiration: 28,BMI: 34.56,DBP: 75,SBP: 185,HeartRate: 112,Temperature: 78.7, eGfr: 64, hdl: 52, ldl: 144, triglycerides: 260 }),
(d:Patient { PatientOid: "XY0891", name: "XYZ", PhysicianNPI: "Physician93", VisitType: "ICU", BirthDate: "03/06/1947 03:19:27", Hemoglobin_A1C: 10.6, Respiration: 23,BMI: 24.56,DBP: 95,SBP: 145,HeartRate: 82,Temperature: 42.7, eGfr: 40, hdl: 41, ldl: 144, triglycerides: 252 }),
(e:Patient { PatientOid: "AAA823", name: "AAA", PhysicianNPI: "Physician453", VisitType: "ICU", BirthDate: "09/04/1925 08:37:22", Hemoglobin_A1C: 5.6, Respiration: 22,BMI: 34.56,DBP: 80,SBP: 165,HeartRate: 95,Temperature: 49.7, eGfr: 96, hdl: 46, ldl: 146, triglycerides: 256 }),
(f:Patient { PatientOid: "BB9723", name: "BBB", PhysicianNPI: "Physician453", VisitType: "ICU", BirthDate: "09/04/1936 08:51:06", Hemoglobin_A1C: 6.6, Respiration: 26,BMI: 28.56,DBP: 88,SBP: 158,HeartRate: 98,Temperature: 48.8, eGfr: 18, hdl: 48, ldl: 148, triglycerides: 258 }),
(g:Patient { PatientOid: "ABCC44", name: "CCC", PhysicianNPI: "Physician49", VisitType: "ICU", BirthDate: "09/04/1939 09:29:29", Hemoglobin_A1C: 9.9, Respiration: 29,BMI: 29.56,DBP: 89,SBP: 159,HeartRate: 99,Temperature: 49.9, eGfr: 12, hdl: 49, ldl: 149, triglycerides: 259 }),
(h:Patient { PatientOid: "DD479", name: "DDD", PhysicianNPI: "Physician49", VisitType: "ICU", BirthDate: "03/03/1933 03:23:32", Hemoglobin_A1C: 8.3, Respiration: 23,BMI: 28.36,DBP: 113,SBP: 155,HeartRate: 93,Temperature: 43.7, eGfr: 23, hdl: 43, ldl: 143, triglycerides: 230 }),
(i:Patient { PatientOid: "EE23", name: "EEE", PhysicianNPI: "Physician453", VisitType: "ICU", BirthDate: "02/24/1925 06:22:22", Hemoglobin_A1C: 8.2, Respiration: 22,BMI: 28.26,DBP: 92,SBP: 152,HeartRate: 92,Temperature: 48.2, eGfr: 22, hdl: 42, ldl: 130, triglycerides: 237 }),
(j:Patient { PatientOid: "FF123", name: "FFF", PhysicianNPI: "Physician453", VisitType: "ICU", BirthDate: "07/06/1935 06:07:27", Hemoglobin_A1C: 11.6, Respiration: 27,BMI: 26.76,DBP: 85,SBP: 165,HeartRate: 97,Temperature: 47.7, eGfr: 35, hdl: 46, ldl: 146, triglycerides: 256 }),
(k:Patient { PatientOid: "KBC123", name: "Ritu", PhysicianNPI: "Physician999", VisitType: "ICU", BirthDate: "09/04/1922 09:12:00", Hemoglobin_A1C: 9.3, Respiration: 18,BMI: 45.56,DBP: 95,SBP: 165,HeartRate: 89,Temperature: 36.7, eGfr: 22, hdl: 45, ldl: 145, triglycerides: 255 }),
(l:Patient { PatientOid: "LB4123", name: "Niku", PhysicianNPI: "Physician123", VisitType: "ICU", BirthDate: "04/05/1955 11:21:22", Hemoglobin_A1C: 9.6, Respiration: 22,BMI: 18.56,DBP: 85,SBP: 155,HeartRate: 92,Temperature: 48.7, eGfr: 54, hdl: 42, ldl: 140, triglycerides: 250 }),
(m:Patient { PatientOid: "MB23", name: "Kaynaat", PhysicianNPI: "Physician93", VisitType: "ICU", BirthDate: "04/11/1971 23:34:56", Hemoglobin_A1C: 10.5, Respiration: 28,BMI: 34.56,DBP: 90,SBP: 155,HeartRate: 112,Temperature: 78.7, eGfr: 44, hdl: 52, ldl: 144, triglycerides: 260 }),
(n:Patient { PatientOid: "NY0891", name: "Richardson", PhysicianNPI: "Physician93", VisitType: "ICU", BirthDate: "03/06/1937 03:19:27", Hemoglobin_A1C: 11.6, Respiration: 23,BMI: 44.56,DBP: 75,SBP: 175,HeartRate: 82,Temperature: 42.7, eGfr: 20, hdl: 41, ldl: 144, triglycerides: 252 }),
(o:Patient { PatientOid: "AAO823", name: "David", PhysicianNPI: "Physician453", VisitType: "ICU", BirthDate: "09/04/1920 08:37:22", Hemoglobin_A1C: 11.4, Respiration: 22,BMI: 48.56,DBP: 70,SBP: 175,HeartRate: 95,Temperature: 49.7, eGfr: 16, hdl: 46, ldl: 146, triglycerides: 256 })


CREATE(z: Diagnosis { Class: "CKD", diagnosisType: "Chronic kidney disease, stage 1", icd10: "N18.1", test: "eGFR", range: "90-150"}),
(y: Diagnosis { Class: "CKD",diagnosisType: "Chronic kidney disease, stage 2 (mild)", icd10: "N18.2", test: "eGFR", range: "60-89"}),
(x: Diagnosis { Class: "CKD",diagnosisType: "Chronic kidney disease, stage 3B (moderate)", icd10: "N18.3", test: "eGFR", range: "45-59"}),
(w: Diagnosis { Class: "CKD",diagnosisType: "Chronic kidney disease, stage 3A (moderate)", icd10: "N18.3", test: "eGFR", range: "30-44"}),
(v: Diagnosis { Class: "CKD",diagnosisType: "Chronic kidney disease, stage 4 (severe)", icd10: "N18.4", test: "eGFR", range: "15-29"}),
(u: Diagnosis { Class: "CKD",diagnosisType: "Chronic kidney disease, stage 5 Excludes1: chronic kidney disease, stage 5 requiring chronic dialysis (N18.6) ", icd10: "N18.5", test: "eGFR", range: "0-14"})

CREATE(s1: Diagnosis { class: "Hypertension", diagnosisType: "Essential (primary) Stage 1 hypertension", icd10: "I10-1", test: "SBP,DBP", range: "SBP=140-159,DBP=90-99" }),
(s2: Diagnosis { class: "Hypertension", diagnosisType: "Essential (Secondary) Stage 2 hypertension", icd10: "I10-2", test: "SBP,DBP", range: "SBP=160-179,DBP=100-109" }),
(s3: Diagnosis { class: "Hypertension", diagnosisType: "Pre Hypertension", icd10: "R03.0", test: "SBP,DBP", range: "SBP=120-139,DBP<80" }),
(s4: Diagnosis { class: "Hypertension", diagnosisType: "Hypertension Urgency", icd10: "I16", test: "SBP,DBP", range: "SBP>180,DBP>105" })

CREATE(s1: Diagnosis {class: "Diabetes", diagnosisType:"pre-diabetes", icd10: "R73.03", test:"Hemoglobin_A1C", range:"Hemoglobin_A1C=5.4-6.4" }),
(s2: Diagnosis {class: "Diabetes", diagnosisType:"Type2 Diabetes", icd10: "E11.65", test:"Hemoglobin_A1C", range:"Hemoglobin_A1C=6.5-7.5" }),
(s3: Diagnosis {class: "Diabetes", diagnosisType:"Type2 Diabetes", icd10: "E11.65", test:"Hemoglobin_A1C", range:"Hemoglobin_A1C=7.5-9.0" }),
(s4: Diagnosis {class: "Diabetes", diagnosisType:"Type2 Diabetes", icd10: "E11.65", test:"Hemoglobin_A1C", range:"Hemoglobin_A1C>9.0" })


CREATE(s1: Diagnosis {class: "Obesity", diagnosisType:"underweight", icd10: "Z68.1", test:"BMI", range:"BMI<20.0" }),
CREATE(s1: Diagnosis {class: "Obesity", diagnosisType:"Normal ", icd10: "Z68.2", test:"BMI", range:"BMI=20.0-29.9" }),
CREATE(s1: Diagnosis {class: "Obesity", diagnosisType:"OverWeight", icd10: "Z68.3", test:"BMI", range:"BMI=30.0-39.0" }),
CREATE(s1: Diagnosis {class: "Obesity", diagnosisType:"Obese", icd10: "Z68.4", test:"BMI", range:"BMI>40.0" })


CREATE(py1: Physician {PhysicianNPI: "Physician123", Name: "Dr. Brown", Address: "174, street no.2, San Fransico", Speciality: "Cardiologist", Education: "MD"}),
(py1: Physician {PhysicianNPI: "Physician453", Name: "Dr. Todd", Address: "202, lane no.9,Greenwhich building, Las Vegas", Speciality: "Nephrologist", Education: "MD"}),
(py1: Physician {PhysicianNPI: "Physician999", Name: "Dr. Pennell", Address: "101, street no.2, Indiana", Speciality: "MediCare", Education: "MD"}),
(py1: Physician {PhysicianNPI: "Physician93", Name: "Dr. Kent", Address: "274, street no.7, NYC", Speciality: "Pulmonarist", Education: "MD"}),
(py1: Physician {PhysicianNPI: "Physician49", Name: "Dr. Healy", Address: "999, street no.9, St. Lawrence building, New Jersey", Speciality: "Cardiologist,Nephrologist", Education: "MD"})



CREATE(m1: Medication {MedicationClass: "Sulfouylunoa class", Medicine: "Glimepnide 1mg", icd10: "E11.65", range:"Hemoglobin_A1C=6.5-7.5"}),
(m2: Medication {MedicationClass: "Sulfouylunoa class", Medicine: "Glimepnide 2mg", icd10: "E11.65", range:"Hemoglobin_A1C=7.5-9.0"}),
(m3: Medication {MedicationClass: "Sulfouylunoa class", Medicine: "Glimepnide 4mg", icd10: "E11.65", range:"Hemoglobin_A1C>9.0"}),
(m4: Medication {MedicationClass: "Biguauides class", Medicine: "Metamorphix IR", icd10: "E11.65", range:"Hemoglobin_A1C=7.5-9.0-Biguauides"}),
(m5: Medication {MedicationClass: "Biguauides class", Medicine: "Metamorphix ER", icd10: "E11.65", range:"Hemoglobin_A1C>9.0"}-Biguauides),


CREATE(t1: TREATMENTANDCARE {MedicationClass: "Sulfouylunoa class", Medicine: "Glimepnide 1mg", Treatment: "1 po of AM for DM"}),
(t2: TREATMENTANDCARE {MedicationClass: "Biguauides class", Medicine: "Metamorphix IR", Treatment: "500 mg IR twice per day"}),
(t3: TREATMENTANDCARE {MedicationClass: "Biguauides class", Medicine: "Metamorphix IR", Treatment: "850 mg IR twice per day"}),
(t4: TREATMENTANDCARE {MedicationClass: "Biguauides class", Medicine: "Metamorphix IR", Treatment: "2000 mg IR twice per day"}),
(t5: TREATMENTANDCARE {MedicationClass: "Biguauides class", Medicine: "Metamorphix ER", Treatment: "500 mg ER twice per day"}),
(t6: TREATMENTANDCARE {MedicationClass: "Biguauides class", Medicine: "Metamorphix ER", Treatment: "1000 mg IR twice per day"})






MATCH (p:Patient) 
WHERE 0 < p.eGfr < 15
MATCH (c:Diagnosis) 
WHERE (c.class = "CKD" AND c.range = "0-14") 
CREATE (p)-[:diagnosedwith]->(c)

MATCH (p:Patient) 
WHERE 15 < p.eGfr < 30
MATCH (c:Diagnosis) 
WHERE (c.class = "CKD" AND c.range = "15-29") 
CREATE (p)-[:diagnosedwith]->(c)

MATCH (p:Patient) 
WHERE 30 < p.eGfr < 45
MATCH (c:Diagnosis) 
WHERE (c.class = "CKD" AND c.range = "30-44") 
CREATE (p)-[:diagnosedwith]->(c)

MATCH (p:Patient) 
WHERE 45 < p.eGfr < 60
MATCH (c:Diagnosis) 
WHERE (c.class = "CKD" AND c.range = "45-59") 
CREATE (p)-[:diagnosedwith]->(c)

MATCH (p:Patient) 
WHERE 60 < p.eGfr < 90
MATCH (c:Diagnosis) 
WHERE (c.class = "CKD" AND c.range = "60-89") 
CREATE (p)-[:diagnosedwith]->(c)

MATCH (p:Patient) 
WHERE 90 < p.eGfr < 150
MATCH (c:Diagnosis) 
WHERE (c.class = "CKD" AND c.range = "90-150") 
CREATE (p)-[:diagnosedwith]->(c)

-------------------------------------

MATCH (p:Patient) 
WHERE (140 < p.sbp < 160 OR 90 < p.dbp < 100)
MATCH (c:Diagnosis) 
WHERE (c.class = "Hypertension" AND c.range = "SBP=140-159,DBP=90-99") 
CREATE (p)-[:diagnosedwith]->(c)

MATCH (p:Patient) 
WHERE (160 < p.sbp < 180 OR 100 < p.dbp < 110)
MATCH (c:Diagnosis) 
WHERE (c.class = "Hypertension" AND c.range = "SBP=160-179,DBP=100-109") 
CREATE (p)-[:diagnosedwith]->(c)

MATCH (p:Patient) 
WHERE (120 < p.sbp < 140 OR p.dbp < 80)
MATCH (c:Diagnosis) 
WHERE (c.class = "Hypertension" AND c.range = "SBP=120-139,DBP<80") 
CREATE (p)-[:diagnosedwith]->(c)

MATCH (p:Patient) 
WHERE (p.sbp < 180 OR 105 < p.dbp)
MATCH (c:Diagnosis) 
WHERE (c.class = "Hypertension" AND c.range = "SBP>180,DBP>105") 
CREATE (p)-[:diagnosedwith]->(c)

-------------------------------------

MATCH (p:Patient) 
WHERE (5.4 < p.Hemoglobin_A1C < 6.4)
MATCH (c:Diagnosis) 
WHERE (c.class = "Diabetes" AND c.range = "Hemoglobin_A1C=5.4-6.4") 
CREATE (p)-[:diagnosedwith]->(c)

MATCH (p:Patient) 
WHERE (6.5 < p.Hemoglobin_A1C < 7.5)
MATCH (c:Diagnosis) 
WHERE (c.class = "Diabetes" AND c.range = "Hemoglobin_A1C=6.5-7.5") 
CREATE (p)-[:diagnosedwith]->(c)

MATCH (p:Patient) 
WHERE (7.5 < p.Hemoglobin_A1C < 9.0)
MATCH (c:Diagnosis) 
WHERE (c.class = "Diabetes" AND c.range = "Hemoglobin_A1C=7.5-9.0") 
CREATE (p)-[:diagnosedwith]->(c)

MATCH (p:Patient) 
WHERE (p.Hemoglobin_A1C > 9.0)
MATCH (c:Diagnosis) 
WHERE (c.class = "Diabetes" AND c.range = "Hemoglobin_A1C>9.0") 
CREATE (p)-[:diagnosedwith]->(c)

-------------------------------------


MATCH (u:Physician {PhysicianNPI:'Physician123'}), (r:Patient {PhysicianNPI:'Physician123'})
CREATE (u)-[:treats]->(r)

MATCH (u:Physician {PhysicianNPI:'Physician453'}), (r:Patient {PhysicianNPI:'Physician453'})
CREATE (u)-[:treats]->(r)

MATCH (u:Physician {PhysicianNPI:'Physician999'}), (r:Patient {PhysicianNPI:'Physician999'})
CREATE (u)-[:treats]->(r)

MATCH (u:Physician {PhysicianNPI:'Physician93'}), (r:Patient {PhysicianNPI:'Physician93'})
CREATE (u)-[:treats]->(r)

MATCH (u:Physician {PhysicianNPI:'Physician49'}), (r:Patient {PhysicianNPI:'Physician49'})
CREATE (u)-[:treats]->(r)


----------------------------------------------

MATCH (u:Medication {range:"Hemoglobin_A1C=6.5-7.5"}), (r:Diagnosis {range:"Hemoglobin_A1C=6.5-7.5"})
CREATE (u)-[:prescribedfor]->(r)

MATCH (u:Medication {range:"Hemoglobin_A1C=7.5-9.0"}), (r:Diagnosis {range:"Hemoglobin_A1C=7.5-9.0"})
CREATE (u)-[:prescribedfor]->(r)

MATCH (u:Medication {range:"Hemoglobin_A1C>9.0"}), (r:Diagnosis {range:"Hemoglobin_A1C=>9.0"})
CREATE (u)-[:prescribedfor]->(r)

MATCH (u:Medication {range:"Hemoglobin_A1C=7.5-9.0"}), (r:Diagnosis {range:"Hemoglobin_A1C=7.5-9.0-Biguauides"})
CREATE (u)-[:prescribedfor]->(r)

MATCH (u:Medication {range:"Hemoglobin_A1C>9.0"}), (r:Diagnosis {range:"Hemoglobin_A1C=>9.0-Biguauides"})
CREATE (u)-[:prescribedfor]->(r)

----------------------------------------------

MATCH (u:Medication {PhysicianNPI:'Physician49'}), (r:Patient {PhysicianNPI:'Physician49'})
CREATE (u)-[:treats]->(r)

