#Clear existing data and graphics
rm(list=ls())
graphics.off()
#Load Hmisc library
library(Hmisc)
library(tidyverse)
library(janitor)
library(naniar)

#Read Data
data=read.csv('MeasuringFatigueInIn-UCData111024_DATA_2024-11-11_0630.csv')
#Setting Labels

label(data$sbj_id)="Subject ID"
label(data$uc_gender)="What is your gender?"
label(data$uc_age)="What is your age?"
label(data$uc_race___1)="What is your race? Choose all that apply.  (choice=American Indian or Alaska Native)"
label(data$uc_race___2)="What is your race? Choose all that apply.  (choice=Asian)"
label(data$uc_race___3)="What is your race? Choose all that apply.  (choice=Black or African American)"
label(data$uc_race___4)="What is your race? Choose all that apply.  (choice=Native Hawaiian or other Pacific Islander)"
label(data$uc_race___5)="What is your race? Choose all that apply.  (choice=Unknown)"
label(data$uc_race___6)="What is your race? Choose all that apply.  (choice=White)"
label(data$uc_race___7)="What is your race? Choose all that apply.  (choice=Other)"
label(data$uc_ethnicity)="What is your ethnicity?"
label(data$uc_ibd_type)="Which type of inflammatory bowel disease do you have?"
label(data$uc_complications___1)="Do you have any of the following complications from your Crohns disease or ulcerative colitis? (choice=fistulas)"
label(data$uc_complications___2)="Do you have any of the following complications from your Crohns disease or ulcerative colitis? (choice=strictures)"
label(data$uc_complications___3)="Do you have any of the following complications from your Crohns disease or ulcerative colitis? (choice=abscess)"
label(data$uc_complications___0)="Do you have any of the following complications from your Crohns disease or ulcerative colitis? (choice=none of the above)"
label(data$uc_complications___4)="Do you have any of the following complications from your Crohns disease or ulcerative colitis? (choice=not sure)"
label(data$uc_extent___1)="What is the extent of your disease? (choice=colon involvement)"
label(data$uc_extent___2)="What is the extent of your disease? (choice=small bowel involvement)"
label(data$uc_extent___3)="What is the extent of your disease? (choice=upper gastrointestinal involvement (such as the esophagus, stomach, and duodenum))"
label(data$uc_extent___4)="What is the extent of your disease? (choice=not sure)"
label(data$uc_surgery)="Have you ever had surgery for IBD? "
label(data$uc_hospital)="Have you ever been hospitalized for IBD? "
label(data$uc_meds_current___1)="Which of the following medications are you currently taking to treat your inflammatory bowel disease? (choice=steroids, such as prednisone or budesonide)"
label(data$uc_meds_current___2)="Which of the following medications are you currently taking to treat your inflammatory bowel disease? (choice=5-aminosalicylate or mesalamine (Apriso, Asacol, Delzicol, Lialda, Sulfasalazine))"
label(data$uc_meds_current___3)="Which of the following medications are you currently taking to treat your inflammatory bowel disease? (choice=methotrexate)"
label(data$uc_meds_current___4)="Which of the following medications are you currently taking to treat your inflammatory bowel disease? (choice=azathioprine/6-mercaptopurine (Imuran))"
label(data$uc_meds_current___5)="Which of the following medications are you currently taking to treat your inflammatory bowel disease? (choice=infliximab (Remicade, Inflectra, Renflexis, Ixifi, Avsola))"
label(data$uc_meds_current___6)="Which of the following medications are you currently taking to treat your inflammatory bowel disease? (choice=adalimumab (Humira, Hadlima))"
label(data$uc_meds_current___7)="Which of the following medications are you currently taking to treat your inflammatory bowel disease? (choice=certolizumab (Cimzia))"
label(data$uc_meds_current___8)="Which of the following medications are you currently taking to treat your inflammatory bowel disease? (choice=golimumab (Simponi))"
label(data$uc_meds_current___9)="Which of the following medications are you currently taking to treat your inflammatory bowel disease? (choice=vedolizumab (Entyvio))"
label(data$uc_meds_current___10)="Which of the following medications are you currently taking to treat your inflammatory bowel disease? (choice=ustekinumab (Stelara))"
label(data$uc_meds_current___11)="Which of the following medications are you currently taking to treat your inflammatory bowel disease? (choice=risankizumab (Skyrizi))"
label(data$uc_meds_current___12)="Which of the following medications are you currently taking to treat your inflammatory bowel disease? (choice=mirikizumab (Omvoh))"
label(data$uc_meds_current___13)="Which of the following medications are you currently taking to treat your inflammatory bowel disease? (choice=etrasiod (Velsipity))"
label(data$uc_meds_current___14)="Which of the following medications are you currently taking to treat your inflammatory bowel disease? (choice=ozanimod (Zeposia))"
label(data$uc_meds_current___15)="Which of the following medications are you currently taking to treat your inflammatory bowel disease? (choice=tofacitinib (Xeljanz))"
label(data$uc_meds_current___16)="Which of the following medications are you currently taking to treat your inflammatory bowel disease? (choice=upadacitinib (Rinvoq))"
label(data$uc_meds_current___0)="Which of the following medications are you currently taking to treat your inflammatory bowel disease? (choice=none)"
label(data$uc_meds_current___17)="Which of the following medications are you currently taking to treat your inflammatory bowel disease? (choice=not sure)"
label(data$uc_meds_prior___1)="Which of the following medications have you tried to treat your inflammatory bowel disease? (choice=steroids, such as prednisone or budesonide)"
label(data$uc_meds_prior___2)="Which of the following medications have you tried to treat your inflammatory bowel disease? (choice=5-aminosalicylate or mesalamine (Apriso, Asacol, Delzicol, Lialda, Sulfasalazine))"
label(data$uc_meds_prior___3)="Which of the following medications have you tried to treat your inflammatory bowel disease? (choice=methotrexate)"
label(data$uc_meds_prior___4)="Which of the following medications have you tried to treat your inflammatory bowel disease? (choice=azathioprine/6-mercaptopurine (Imuran))"
label(data$uc_meds_prior___5)="Which of the following medications have you tried to treat your inflammatory bowel disease? (choice=infliximab (Remicade, Inflectra, Renflexis, Ixifi, Avsola))"
label(data$uc_meds_prior___6)="Which of the following medications have you tried to treat your inflammatory bowel disease? (choice=adalimumab (Humira, Hadlima))"
label(data$uc_meds_prior___7)="Which of the following medications have you tried to treat your inflammatory bowel disease? (choice=certolizumab (Cimzia))"
label(data$uc_meds_prior___8)="Which of the following medications have you tried to treat your inflammatory bowel disease? (choice=golimumab (Simponi))"
label(data$uc_meds_prior___9)="Which of the following medications have you tried to treat your inflammatory bowel disease? (choice=vedolizumab (Entyvio))"
label(data$uc_meds_prior___10)="Which of the following medications have you tried to treat your inflammatory bowel disease? (choice=ustekinumab (Stelara))"
label(data$uc_meds_prior___11)="Which of the following medications have you tried to treat your inflammatory bowel disease? (choice=risankizumab (Skyrizi))"
label(data$uc_meds_prior___12)="Which of the following medications have you tried to treat your inflammatory bowel disease? (choice=mirikizumab (Omvoh))"
label(data$uc_meds_prior___13)="Which of the following medications have you tried to treat your inflammatory bowel disease? (choice=etrasiod (Velsipity))"
label(data$uc_meds_prior___14)="Which of the following medications have you tried to treat your inflammatory bowel disease? (choice=ozanimod (Zeposia))"
label(data$uc_meds_prior___15)="Which of the following medications have you tried to treat your inflammatory bowel disease? (choice=tofacitinib (Xeljanz))"
label(data$uc_meds_prior___16)="Which of the following medications have you tried to treat your inflammatory bowel disease? (choice=upadacitinib (Rinvoq))"
label(data$uc_meds_prior___0)="Which of the following medications have you tried to treat your inflammatory bowel disease? (choice=none)"
label(data$uc_meds_prior___17)="Which of the following medications have you tried to treat your inflammatory bowel disease? (choice=not sure)"
label(data$uc_prednisone)="Have you been on PREDNISONE for an IBD flare in the last year? "
label(data$uc_steroid_months_yr)="How many months (to your best knowledge) have you taken STEROIDS in the past year, to the closest number of months (put zero if none), from 0-12?"
label(data$uc_steroid_month_life)="How many months (to your best knowledge) have you taken STEROIDS in your life for UC or CD, to the closest number of months (put zero if none), from 0-360. "
label(data$ucheart_liver_brain___1)="Have you ever been told by a physician that you have any of the following heart, liver, or brain conditions?  If yes, please check all that apply. Otherwise, select no or not sure. (choice=Type 1 Diabetes)"
label(data$ucheart_liver_brain___2)="Have you ever been told by a physician that you have any of the following heart, liver, or brain conditions?  If yes, please check all that apply. Otherwise, select no or not sure. (choice=Type 2 Diabetes)"
label(data$ucheart_liver_brain___3)="Have you ever been told by a physician that you have any of the following heart, liver, or brain conditions?  If yes, please check all that apply. Otherwise, select no or not sure. (choice=High blood pressure)"
label(data$ucheart_liver_brain___4)="Have you ever been told by a physician that you have any of the following heart, liver, or brain conditions?  If yes, please check all that apply. Otherwise, select no or not sure. (choice=Heart disease)"
label(data$ucheart_liver_brain___5)="Have you ever been told by a physician that you have any of the following heart, liver, or brain conditions?  If yes, please check all that apply. Otherwise, select no or not sure. (choice=Stroke)"
label(data$ucheart_liver_brain___6)="Have you ever been told by a physician that you have any of the following heart, liver, or brain conditions?  If yes, please check all that apply. Otherwise, select no or not sure. (choice=Migraines)"
label(data$ucheart_liver_brain___7)="Have you ever been told by a physician that you have any of the following heart, liver, or brain conditions?  If yes, please check all that apply. Otherwise, select no or not sure. (choice=Liver problems)"
label(data$ucheart_liver_brain___8)="Have you ever been told by a physician that you have any of the following heart, liver, or brain conditions?  If yes, please check all that apply. Otherwise, select no or not sure. (choice=Primary Sclerosing Cholangitis)"
label(data$ucheart_liver_brain___9)="Have you ever been told by a physician that you have any of the following heart, liver, or brain conditions?  If yes, please check all that apply. Otherwise, select no or not sure. (choice=Nonalcoholic Hepatitis)"
label(data$ucheart_liver_brain___10)="Have you ever been told by a physician that you have any of the following heart, liver, or brain conditions?  If yes, please check all that apply. Otherwise, select no or not sure. (choice=Kidney problems)"
label(data$ucheart_liver_brain___11)="Have you ever been told by a physician that you have any of the following heart, liver, or brain conditions?  If yes, please check all that apply. Otherwise, select no or not sure. (choice=Thyroid disease)"
label(data$ucheart_liver_brain___12)="Have you ever been told by a physician that you have any of the following heart, liver, or brain conditions?  If yes, please check all that apply. Otherwise, select no or not sure. (choice=HIV)"
label(data$ucheart_liver_brain___13)="Have you ever been told by a physician that you have any of the following heart, liver, or brain conditions?  If yes, please check all that apply. Otherwise, select no or not sure. (choice=Anxiety)"
label(data$ucheart_liver_brain___14)="Have you ever been told by a physician that you have any of the following heart, liver, or brain conditions?  If yes, please check all that apply. Otherwise, select no or not sure. (choice=Depression)"
label(data$ucheart_liver_brain___0)="Have you ever been told by a physician that you have any of the following heart, liver, or brain conditions?  If yes, please check all that apply. Otherwise, select no or not sure. (choice=No)"
label(data$ucheart_liver_brain___15)="Have you ever been told by a physician that you have any of the following heart, liver, or brain conditions?  If yes, please check all that apply. Otherwise, select no or not sure. (choice=Not sure)"
label(data$uc_pulmonary___1)="Have you ever been told by a physician that you have any of the following lung or breathing problems? If yes, please check all that apply. Otherwise, select no or not sure. (choice=Asthma)"
label(data$uc_pulmonary___2)="Have you ever been told by a physician that you have any of the following lung or breathing problems? If yes, please check all that apply. Otherwise, select no or not sure. (choice=Obstructive pulmonary disease)"
label(data$uc_pulmonary___3)="Have you ever been told by a physician that you have any of the following lung or breathing problems? If yes, please check all that apply. Otherwise, select no or not sure. (choice=Tuberculosis)"
label(data$uc_pulmonary___4)="Have you ever been told by a physician that you have any of the following lung or breathing problems? If yes, please check all that apply. Otherwise, select no or not sure. (choice=Obstructive sleep apnea)"
label(data$uc_pulmonary___0)="Have you ever been told by a physician that you have any of the following lung or breathing problems? If yes, please check all that apply. Otherwise, select no or not sure. (choice=No)"
label(data$uc_pulmonary___5)="Have you ever been told by a physician that you have any of the following lung or breathing problems? If yes, please check all that apply. Otherwise, select no or not sure. (choice=Not sure)"
label(data$uc_digestive_skin___1)="Have you ever been told by a physician that you have any of the following digestive or skin conditions?  If yes, please check all that apply. Otherwise, select no or not sure. (choice=Celiac disease)"
label(data$uc_digestive_skin___2)="Have you ever been told by a physician that you have any of the following digestive or skin conditions?  If yes, please check all that apply. Otherwise, select no or not sure. (choice=Irritable Bowel Syndrome (IBS))"
label(data$uc_digestive_skin___3)="Have you ever been told by a physician that you have any of the following digestive or skin conditions?  If yes, please check all that apply. Otherwise, select no or not sure. (choice=Lupus)"
label(data$uc_digestive_skin___4)="Have you ever been told by a physician that you have any of the following digestive or skin conditions?  If yes, please check all that apply. Otherwise, select no or not sure. (choice=Arthritis (non-rheumatoid))"
label(data$uc_digestive_skin___5)="Have you ever been told by a physician that you have any of the following digestive or skin conditions?  If yes, please check all that apply. Otherwise, select no or not sure. (choice=Rheumatoid arthritis)"
label(data$uc_digestive_skin___6)="Have you ever been told by a physician that you have any of the following digestive or skin conditions?  If yes, please check all that apply. Otherwise, select no or not sure. (choice=Eczema)"
label(data$uc_digestive_skin___7)="Have you ever been told by a physician that you have any of the following digestive or skin conditions?  If yes, please check all that apply. Otherwise, select no or not sure. (choice=Scleroderma)"
label(data$uc_digestive_skin___8)="Have you ever been told by a physician that you have any of the following digestive or skin conditions?  If yes, please check all that apply. Otherwise, select no or not sure. (choice=Psoriasis)"
label(data$uc_digestive_skin___9)="Have you ever been told by a physician that you have any of the following digestive or skin conditions?  If yes, please check all that apply. Otherwise, select no or not sure. (choice=Ankylosing Spondylitis)"
label(data$uc_digestive_skin___10)="Have you ever been told by a physician that you have any of the following digestive or skin conditions?  If yes, please check all that apply. Otherwise, select no or not sure. (choice=Multiple Sclerosis)"
label(data$uc_digestive_skin___11)="Have you ever been told by a physician that you have any of the following digestive or skin conditions?  If yes, please check all that apply. Otherwise, select no or not sure. (choice=Shingles)"
label(data$uc_digestive_skin___0)="Have you ever been told by a physician that you have any of the following digestive or skin conditions?  If yes, please check all that apply. Otherwise, select no or not sure. (choice=No)"
label(data$uc_digestive_skin___12)="Have you ever been told by a physician that you have any of the following digestive or skin conditions?  If yes, please check all that apply. Otherwise, select no or not sure. (choice=Not sure)"
label(data$uc_cancer)="Have you ever been diagnosed with cancer other than non-melanoma skin cancer (basal cell carcinoma or squamous cell carcinoma of the skin)? "
label(data$uc_cancer_type)="Which type of cancer were you diagnosed with?"
label(data$uc_cancer_tx)="Are you actively receiving treatment for cancer (e.g., chemotherapy, immunotherapy, or radiation)?"
label(data$uc_facit_q1)="1. I feel fatigued"
label(data$uc_facit_q2)="2. I feel weak all over"
label(data$uc_facit_q3)="3. I feel listless (washed out)"
label(data$uc_facit_q4)="4. I feel tired"
label(data$uc_facit_q5)="5. I have trouble starting things because I am tired"
label(data$uc_facit_q6)="6. I have trouble finishing things because I am tired"
label(data$uc_facit_q7)="7. I have energy"
label(data$uc_facit_q8)="8. I am able to do my usual activities"
label(data$uc_facit_q9)="9. I need to sleep during the day"
label(data$uc_facit_q10)="10. I am too tired to eat"
label(data$uc_facit_q11)="11. I need help doing my usual activities"
label(data$uc_facit_q12)="12. I am frustrated by being too tired to do the things I want to do"
label(data$uc_facit_q13)="13. I have to limit my social activity because I am tired"
label(data$uc_pro1)="1.1. In the past 24 hours, how many bowel movements did you have?"
label(data$uc_pro2)="1.2. In the past 24 hours, how often were your bowel movements mostly or completely liquid?"
label(data$uc_pro3)="2.1. In the past 24 hours, did you have blood in your bowel movements?"
label(data$uc_pro4)="If yes, how often did you experience this symptom?"
label(data$uc_pro5)="2.2. In the past 24 hours, did you have mucus (white material) in your bowel movements?"
label(data$uc_pro6)="If yes, how often did you experience this symptom?"
label(data$uc_pro7)="2.3. In the past 24 hours, did stool, blood, or liquid leak out before you reached a toilet?"
label(data$uc_pro8)="If yes, how often did you experience this symptom?"
label(data$uc_pro9)="2.4. In the past 24 hours, did you pass gas?"
label(data$uc_pro10)="If yes, how often did you experience this symptom?"
label(data$uc_pro11)="2.5. In the past 24 hours, did you feel the need to have a bowel movement right away?"
label(data$uc_pro12)="If yes, how severe was this symptom at its worst?"
label(data$uc_pro13)="2.6. In the past 24 hours, did you feel pain in your belly?"
label(data$uc_pro14)="If yes, how severe was this symptom at its worst?"
label(data$uc_pro15)="2.7. In the past 24 hours, did you feel bloating in your belly?"
label(data$uc_pro16)="If yes, how severe was this symptom at its worst?"
label(data$uc_pro17)="2.8. In the past 24 hours, did you feel pain in your knees, hips, and/or elbows?"
label(data$uc_pro18)="If yes, how severe was this symptom at its worst?"
label(data$uc_pro19)="  2.9. In the past 24 hours, did you feel tired?  "
label(data$uc_pro20)="If yes, how severe was this symptom at its worst?"
label(data$uc_pro21)="  2.10. In the past 24 hours, did you lack an appetite?  "
label(data$uc_pro22)="If yes, how severe was this symptom at its worst?"
label(data$uc_pro23)="  2.11. In the past 24 hours, did you feel weak?  "
label(data$uc_pro24)="If yes, how severe was this symptom at its worst?"
label(data$uc_pro25)="  2.12. In the past 24 hours, did you feel thirsty?  "
label(data$uc_pro26)="If yes, how severe was this symptom at its worst?"
label(data$uc_pro27)="  3.1. In the past year, did you schedule your activities around your bowel movements?  "
label(data$uc_pro28)="3.2. In the past 24 hours, did you eat less to help control your bowel movements?"
label(data$uc_pro29)="3.3. In the past 24 hours, did you avoid foods you usually eat, to help control your bowel symptoms?"
label(data$uc_pro30)="3.4. In the past 24 hours, did you take over-the-counter medicines to help control your digestive symptoms?"
label(data$uc_pro31)="3.5. In the past 24 hours, did you leave home for any reason?"
label(data$uc_pro32)="3.5a.1. If yes, you left home, did you only go to places where you knew there was a toilet nearby?"
label(data$uc_pro33)="3.5a.2. If yes, you left home, did you carry a change of clothing or supplies such as toilet paper or wipes in case of a bowel accident?"
label(data$uc_pro34)="3.5b If no, you did not leave home, did you stay at home because of your ulcerative colitis?"
label(data$uc_pro35)="4.1. In the past seven days, how much did Ulcerative Colitis interfere with your ability to perform well at work or school?"
label(data$uc_pro36)="4.2. In the past seven days, how much did Ulcerative Colitis interfere with your ability to do chores around the home?"
label(data$uc_pro37)="4.3. In the past seven days, how much did Ulcerative Colitis interfere with activities you do for enjoyment?"
label(data$uc_pro38)="4.4. In the past seven days, how much did Ulcerative Colitis interfere with your sleep?"
label(data$uc_pro39)="4.5. In the past seven days, how much did Ulcerative Colitis interfere with your ability to concentrate?"
label(data$uc_pro40)="4.6. In the past seven days, how much did Ulcerative Colitis make leaving home difficult?"
label(data$uc_pro41)="4.7. In the past seven days, how much did Ulcerative Colitis interfere with your ability to travel more than one hour away from home?"
label(data$uc_pro42)="4.8. In the past seven days, how much did Ulcerative Colitis make you less interested in sex?"
label(data$uc_pro43)="4.9. In the past seven days, how much did Ulcerative Colitis make it difficult to plan several days in ahead?"
label(data$uc_pro44)="5.1. In the past seven days, how often did you feel alone?"
label(data$uc_pro45)="5.2. In the past seven days, how often did you feel embarrassed?"
label(data$uc_pro46)="5.3. In the past seven days, how often did you feel worried?"
label(data$uc_pro47)="5.4. In the past seven days, how often did you feel scared?"
label(data$uc_pro48)="5.5. In the past seven days, how often did you feel you had no control of your life?"
label(data$uc_pro49)="5.6. In the past seven days, how often did you feel angry?"
label(data$uc_pro50)="5.7. In the past seven days, how often did you feel frustrated?"
label(data$uc_pro51)="5.8. In the past seven days, how often did you feel depressed?"
label(data$uc_ibdf_1)="1. What is your level of fatigue right NOW"
label(data$uc_ibdf_2)="2. What was your HIGHEST fatigue level in the past two weeks"
label(data$uc_ibdf_3)="3. What was your LOWEST fatigue level in the past two weeks"
label(data$uc_ibdf_4)="4. What was your AVERAGE fatigue level in the past two weeks"
label(data$uc_ibdf_5)="5. How much of your waking time have you felt fatigued in the past two weeks "
label(data$uc_stop_bang1)="1. Do you Snore Loudly (loud enough to be heard through closed doors or your bed-partner elbows you for snoring at night)"
label(data$uc_stop_bang2)="2. Do you often feel Tired, Fatigued, or Sleepy during the daytime (such as falling asleep during driving or talking to someone)?"
label(data$uc_stop_bang3)="3. Has anyone Observed you Stop Breathing or Choking/Gasping during your sleep ?"
label(data$uc_stop_bang4)="4. Do you have or are being treated for High Blood Pressure ?"
label(data$uc_stop_bang5)="5. Body Mass Index more than 35 kg/m2?"
label(data$uc_stop_bang6)="6. Is your age older than 50?"
label(data$uc_stop_bang7)="7. Neck size.  Is your shirt collar 16 inches / 40cm or larger? (Measured around Adams apple)"
label(data$uc_stop_bang8)="8. Is your gender male?"
label(data$ulcerative_colitis_fatigue_assessment_complete)="Complete?"
#Setting Units


#Setting Factors(will create new variable for factors)
data$uc_gender.factor = factor(data$uc_gender,levels=c("1","2","3","4"))
data$uc_race___1.factor = factor(data$uc_race___1,levels=c("0","1"))
data$uc_race___2.factor = factor(data$uc_race___2,levels=c("0","1"))
data$uc_race___3.factor = factor(data$uc_race___3,levels=c("0","1"))
data$uc_race___4.factor = factor(data$uc_race___4,levels=c("0","1"))
data$uc_race___5.factor = factor(data$uc_race___5,levels=c("0","1"))
data$uc_race___6.factor = factor(data$uc_race___6,levels=c("0","1"))
data$uc_race___7.factor = factor(data$uc_race___7,levels=c("0","1"))
data$uc_ethnicity.factor = factor(data$uc_ethnicity,levels=c("1","2","3","4"))
data$uc_ibd_type.factor = factor(data$uc_ibd_type,levels=c("1","2","3","4"))
data$uc_complications___1.factor = factor(data$uc_complications___1,levels=c("0","1"))
data$uc_complications___2.factor = factor(data$uc_complications___2,levels=c("0","1"))
data$uc_complications___3.factor = factor(data$uc_complications___3,levels=c("0","1"))
data$uc_complications___0.factor = factor(data$uc_complications___0,levels=c("0","1"))
data$uc_complications___4.factor = factor(data$uc_complications___4,levels=c("0","1"))
data$uc_extent___1.factor = factor(data$uc_extent___1,levels=c("0","1"))
data$uc_extent___2.factor = factor(data$uc_extent___2,levels=c("0","1"))
data$uc_extent___3.factor = factor(data$uc_extent___3,levels=c("0","1"))
data$uc_extent___4.factor = factor(data$uc_extent___4,levels=c("0","1"))
data$uc_surgery.factor = factor(data$uc_surgery,levels=c("1","0","2"))
data$uc_hospital.factor = factor(data$uc_hospital,levels=c("1","0","2"))
data$uc_meds_current___1.factor = factor(data$uc_meds_current___1,levels=c("0","1"))
data$uc_meds_current___2.factor = factor(data$uc_meds_current___2,levels=c("0","1"))
data$uc_meds_current___3.factor = factor(data$uc_meds_current___3,levels=c("0","1"))
data$uc_meds_current___4.factor = factor(data$uc_meds_current___4,levels=c("0","1"))
data$uc_meds_current___5.factor = factor(data$uc_meds_current___5,levels=c("0","1"))
data$uc_meds_current___6.factor = factor(data$uc_meds_current___6,levels=c("0","1"))
data$uc_meds_current___7.factor = factor(data$uc_meds_current___7,levels=c("0","1"))
data$uc_meds_current___8.factor = factor(data$uc_meds_current___8,levels=c("0","1"))
data$uc_meds_current___9.factor = factor(data$uc_meds_current___9,levels=c("0","1"))
data$uc_meds_current___10.factor = factor(data$uc_meds_current___10,levels=c("0","1"))
data$uc_meds_current___11.factor = factor(data$uc_meds_current___11,levels=c("0","1"))
data$uc_meds_current___12.factor = factor(data$uc_meds_current___12,levels=c("0","1"))
data$uc_meds_current___13.factor = factor(data$uc_meds_current___13,levels=c("0","1"))
data$uc_meds_current___14.factor = factor(data$uc_meds_current___14,levels=c("0","1"))
data$uc_meds_current___15.factor = factor(data$uc_meds_current___15,levels=c("0","1"))
data$uc_meds_current___16.factor = factor(data$uc_meds_current___16,levels=c("0","1"))
data$uc_meds_current___0.factor = factor(data$uc_meds_current___0,levels=c("0","1"))
data$uc_meds_current___17.factor = factor(data$uc_meds_current___17,levels=c("0","1"))
data$uc_meds_prior___1.factor = factor(data$uc_meds_prior___1,levels=c("0","1"))
data$uc_meds_prior___2.factor = factor(data$uc_meds_prior___2,levels=c("0","1"))
data$uc_meds_prior___3.factor = factor(data$uc_meds_prior___3,levels=c("0","1"))
data$uc_meds_prior___4.factor = factor(data$uc_meds_prior___4,levels=c("0","1"))
data$uc_meds_prior___5.factor = factor(data$uc_meds_prior___5,levels=c("0","1"))
data$uc_meds_prior___6.factor = factor(data$uc_meds_prior___6,levels=c("0","1"))
data$uc_meds_prior___7.factor = factor(data$uc_meds_prior___7,levels=c("0","1"))
data$uc_meds_prior___8.factor = factor(data$uc_meds_prior___8,levels=c("0","1"))
data$uc_meds_prior___9.factor = factor(data$uc_meds_prior___9,levels=c("0","1"))
data$uc_meds_prior___10.factor = factor(data$uc_meds_prior___10,levels=c("0","1"))
data$uc_meds_prior___11.factor = factor(data$uc_meds_prior___11,levels=c("0","1"))
data$uc_meds_prior___12.factor = factor(data$uc_meds_prior___12,levels=c("0","1"))
data$uc_meds_prior___13.factor = factor(data$uc_meds_prior___13,levels=c("0","1"))
data$uc_meds_prior___14.factor = factor(data$uc_meds_prior___14,levels=c("0","1"))
data$uc_meds_prior___15.factor = factor(data$uc_meds_prior___15,levels=c("0","1"))
data$uc_meds_prior___16.factor = factor(data$uc_meds_prior___16,levels=c("0","1"))
data$uc_meds_prior___0.factor = factor(data$uc_meds_prior___0,levels=c("0","1"))
data$uc_meds_prior___17.factor = factor(data$uc_meds_prior___17,levels=c("0","1"))
data$uc_prednisone.factor = factor(data$uc_prednisone,levels=c("1","0"))
data$ucheart_liver_brain___1.factor = factor(data$ucheart_liver_brain___1,levels=c("0","1"))
data$ucheart_liver_brain___2.factor = factor(data$ucheart_liver_brain___2,levels=c("0","1"))
data$ucheart_liver_brain___3.factor = factor(data$ucheart_liver_brain___3,levels=c("0","1"))
data$ucheart_liver_brain___4.factor = factor(data$ucheart_liver_brain___4,levels=c("0","1"))
data$ucheart_liver_brain___5.factor = factor(data$ucheart_liver_brain___5,levels=c("0","1"))
data$ucheart_liver_brain___6.factor = factor(data$ucheart_liver_brain___6,levels=c("0","1"))
data$ucheart_liver_brain___7.factor = factor(data$ucheart_liver_brain___7,levels=c("0","1"))
data$ucheart_liver_brain___8.factor = factor(data$ucheart_liver_brain___8,levels=c("0","1"))
data$ucheart_liver_brain___9.factor = factor(data$ucheart_liver_brain___9,levels=c("0","1"))
data$ucheart_liver_brain___10.factor = factor(data$ucheart_liver_brain___10,levels=c("0","1"))
data$ucheart_liver_brain___11.factor = factor(data$ucheart_liver_brain___11,levels=c("0","1"))
data$ucheart_liver_brain___12.factor = factor(data$ucheart_liver_brain___12,levels=c("0","1"))
data$ucheart_liver_brain___13.factor = factor(data$ucheart_liver_brain___13,levels=c("0","1"))
data$ucheart_liver_brain___14.factor = factor(data$ucheart_liver_brain___14,levels=c("0","1"))
data$ucheart_liver_brain___0.factor = factor(data$ucheart_liver_brain___0,levels=c("0","1"))
data$ucheart_liver_brain___15.factor = factor(data$ucheart_liver_brain___15,levels=c("0","1"))
data$uc_pulmonary___1.factor = factor(data$uc_pulmonary___1,levels=c("0","1"))
data$uc_pulmonary___2.factor = factor(data$uc_pulmonary___2,levels=c("0","1"))
data$uc_pulmonary___3.factor = factor(data$uc_pulmonary___3,levels=c("0","1"))
data$uc_pulmonary___4.factor = factor(data$uc_pulmonary___4,levels=c("0","1"))
data$uc_pulmonary___0.factor = factor(data$uc_pulmonary___0,levels=c("0","1"))
data$uc_pulmonary___5.factor = factor(data$uc_pulmonary___5,levels=c("0","1"))
data$uc_digestive_skin___1.factor = factor(data$uc_digestive_skin___1,levels=c("0","1"))
data$uc_digestive_skin___2.factor = factor(data$uc_digestive_skin___2,levels=c("0","1"))
data$uc_digestive_skin___3.factor = factor(data$uc_digestive_skin___3,levels=c("0","1"))
data$uc_digestive_skin___4.factor = factor(data$uc_digestive_skin___4,levels=c("0","1"))
data$uc_digestive_skin___5.factor = factor(data$uc_digestive_skin___5,levels=c("0","1"))
data$uc_digestive_skin___6.factor = factor(data$uc_digestive_skin___6,levels=c("0","1"))
data$uc_digestive_skin___7.factor = factor(data$uc_digestive_skin___7,levels=c("0","1"))
data$uc_digestive_skin___8.factor = factor(data$uc_digestive_skin___8,levels=c("0","1"))
data$uc_digestive_skin___9.factor = factor(data$uc_digestive_skin___9,levels=c("0","1"))
data$uc_digestive_skin___10.factor = factor(data$uc_digestive_skin___10,levels=c("0","1"))
data$uc_digestive_skin___11.factor = factor(data$uc_digestive_skin___11,levels=c("0","1"))
data$uc_digestive_skin___0.factor = factor(data$uc_digestive_skin___0,levels=c("0","1"))
data$uc_digestive_skin___12.factor = factor(data$uc_digestive_skin___12,levels=c("0","1"))
data$uc_cancer.factor = factor(data$uc_cancer,levels=c("1","0","2"))
data$uc_cancer_tx.factor = factor(data$uc_cancer_tx,levels=c("1","0","2"))
data$uc_facit_q1.factor = factor(data$uc_facit_q1,levels=c("0","1","2","3","4"))
data$uc_facit_q2.factor = factor(data$uc_facit_q2,levels=c("0","1","2","3","4"))
data$uc_facit_q3.factor = factor(data$uc_facit_q3,levels=c("0","1","2","3","4"))
data$uc_facit_q4.factor = factor(data$uc_facit_q4,levels=c("0","1","2","3","4"))
data$uc_facit_q5.factor = factor(data$uc_facit_q5,levels=c("0","1","2","3","4"))
data$uc_facit_q6.factor = factor(data$uc_facit_q6,levels=c("0","1","2","3","4"))
data$uc_facit_q7.factor = factor(data$uc_facit_q7,levels=c("0","1","2","3","4"))
data$uc_facit_q8.factor = factor(data$uc_facit_q8,levels=c("0","1","2","3","4"))
data$uc_facit_q9.factor = factor(data$uc_facit_q9,levels=c("0","1","2","3","4"))
data$uc_facit_q10.factor = factor(data$uc_facit_q10,levels=c("0","1","2","3","4"))
data$uc_facit_q11.factor = factor(data$uc_facit_q11,levels=c("0","1","2","3","4"))
data$uc_facit_q12.factor = factor(data$uc_facit_q12,levels=c("0","1","2","3","4"))
data$uc_facit_q13.factor = factor(data$uc_facit_q13,levels=c("0","1","2","3","4"))
data$uc_pro1.factor = factor(data$uc_pro1,levels=c("0","1","2","3","4","5","6","7"))
data$uc_pro2.factor = factor(data$uc_pro2,levels=c("0","1","2","3","4"))
data$uc_pro3.factor = factor(data$uc_pro3,levels=c("1","0"))
data$uc_pro4.factor = factor(data$uc_pro4,levels=c("1","2","3","4"))
data$uc_pro5.factor = factor(data$uc_pro5,levels=c("1","0"))
data$uc_pro6.factor = factor(data$uc_pro6,levels=c("1","2","3","4"))
data$uc_pro7.factor = factor(data$uc_pro7,levels=c("1","0"))
data$uc_pro8.factor = factor(data$uc_pro8,levels=c("1","2","3","4"))
data$uc_pro9.factor = factor(data$uc_pro9,levels=c("1","0"))
data$uc_pro10.factor = factor(data$uc_pro10,levels=c("1","2","3","4"))
data$uc_pro11.factor = factor(data$uc_pro11,levels=c("1","0"))
data$uc_pro12.factor = factor(data$uc_pro12,levels=c("1","2","3","4"))
data$uc_pro13.factor = factor(data$uc_pro13,levels=c("1","0"))
data$uc_pro14.factor = factor(data$uc_pro14,levels=c("1","2","3","4"))
data$uc_pro15.factor = factor(data$uc_pro15,levels=c("1","0"))
data$uc_pro16.factor = factor(data$uc_pro16,levels=c("1","2","3","4"))
data$uc_pro17.factor = factor(data$uc_pro17,levels=c("1","0"))
data$uc_pro18.factor = factor(data$uc_pro18,levels=c("1","2","3","4"))
data$uc_pro19.factor = factor(data$uc_pro19,levels=c("1","0"))
data$uc_pro20.factor = factor(data$uc_pro20,levels=c("1","2","3","4"))
data$uc_pro21.factor = factor(data$uc_pro21,levels=c("1","0"))
data$uc_pro22.factor = factor(data$uc_pro22,levels=c("1","2","3","4"))
data$uc_pro23.factor = factor(data$uc_pro23,levels=c("1","0"))
data$uc_pro24.factor = factor(data$uc_pro24,levels=c("1","2","3","4"))
data$uc_pro25.factor = factor(data$uc_pro25,levels=c("1","0"))
data$uc_pro26.factor = factor(data$uc_pro26,levels=c("1","2","3","4"))
data$uc_pro27.factor = factor(data$uc_pro27,levels=c("1","0"))
data$uc_pro28.factor = factor(data$uc_pro28,levels=c("1","0"))
data$uc_pro29.factor = factor(data$uc_pro29,levels=c("1","0"))
data$uc_pro30.factor = factor(data$uc_pro30,levels=c("1","0"))
data$uc_pro31.factor = factor(data$uc_pro31,levels=c("1","0"))
data$uc_pro32.factor = factor(data$uc_pro32,levels=c("1","0"))
data$uc_pro33.factor = factor(data$uc_pro33,levels=c("1","0"))
data$uc_pro34.factor = factor(data$uc_pro34,levels=c("1","0"))
data$uc_pro35.factor = factor(data$uc_pro35,levels=c("0","1","2","3","4"))
data$uc_pro36.factor = factor(data$uc_pro36,levels=c("0","1","2","3","4"))
data$uc_pro37.factor = factor(data$uc_pro37,levels=c("0","1","2","3","4"))
data$uc_pro38.factor = factor(data$uc_pro38,levels=c("0","1","2","3","4"))
data$uc_pro39.factor = factor(data$uc_pro39,levels=c("0","1","2","3","4"))
data$uc_pro40.factor = factor(data$uc_pro40,levels=c("0","1","2","3","4"))
data$uc_pro41.factor = factor(data$uc_pro41,levels=c("0","1","2","3","4"))
data$uc_pro42.factor = factor(data$uc_pro42,levels=c("0","1","2","3","4"))
data$uc_pro43.factor = factor(data$uc_pro43,levels=c("0","1","2","3","4"))
data$uc_pro44.factor = factor(data$uc_pro44,levels=c("0","1","2","3","4"))
data$uc_pro45.factor = factor(data$uc_pro45,levels=c("0","1","2","3","4"))
data$uc_pro46.factor = factor(data$uc_pro46,levels=c("0","1","2","3","4"))
data$uc_pro47.factor = factor(data$uc_pro47,levels=c("0","1","2","3","4"))
data$uc_pro48.factor = factor(data$uc_pro48,levels=c("0","1","2","3","4"))
data$uc_pro49.factor = factor(data$uc_pro49,levels=c("0","1","2","3","4"))
data$uc_pro50.factor = factor(data$uc_pro50,levels=c("0","1","2","3","4"))
data$uc_pro51.factor = factor(data$uc_pro51,levels=c("0","1","2","3","4"))
data$uc_ibdf_1.factor = factor(data$uc_ibdf_1,levels=c("0","1","2","3","4"))
data$uc_ibdf_2.factor = factor(data$uc_ibdf_2,levels=c("0","1","2","3","4"))
data$uc_ibdf_3.factor = factor(data$uc_ibdf_3,levels=c("0","1","2","3","4"))
data$uc_ibdf_4.factor = factor(data$uc_ibdf_4,levels=c("0","1","2","3","4"))
data$uc_ibdf_5.factor = factor(data$uc_ibdf_5,levels=c("0","1","2","3","4"))
data$uc_stop_bang1.factor = factor(data$uc_stop_bang1,levels=c("1","0","2"))
data$uc_stop_bang2.factor = factor(data$uc_stop_bang2,levels=c("1","0"))
data$uc_stop_bang3.factor = factor(data$uc_stop_bang3,levels=c("1","0","2"))
data$uc_stop_bang4.factor = factor(data$uc_stop_bang4,levels=c("1","0","2"))
data$uc_stop_bang5.factor = factor(data$uc_stop_bang5,levels=c("1","0","2"))
data$uc_stop_bang6.factor = factor(data$uc_stop_bang6,levels=c("1","0"))
data$uc_stop_bang7.factor = factor(data$uc_stop_bang7,levels=c("1","0","2"))
data$uc_stop_bang8.factor = factor(data$uc_stop_bang8,levels=c("1","0","2"))
data$ulcerative_colitis_fatigue_assessment_complete.factor = factor(data$ulcerative_colitis_fatigue_assessment_complete,levels=c("0","1","2"))

levels(data$uc_gender.factor)=c("male","female","other","choose not to disclose")
levels(data$uc_race___1.factor)=c("Unchecked","Checked")
levels(data$uc_race___2.factor)=c("Unchecked","Checked")
levels(data$uc_race___3.factor)=c("Unchecked","Checked")
levels(data$uc_race___4.factor)=c("Unchecked","Checked")
levels(data$uc_race___5.factor)=c("Unchecked","Checked")
levels(data$uc_race___6.factor)=c("Unchecked","Checked")
levels(data$uc_race___7.factor)=c("Unchecked","Checked")
levels(data$uc_ethnicity.factor)=c("Hispanic or Latino","Not Hispanic or Latino","Choose not to disclose","Unknown")
levels(data$uc_ibd_type.factor)=c("ulcerative colitis","Crohns disease","indeterminate colitis","unknown")
levels(data$uc_complications___1.factor)=c("Unchecked","Checked")
levels(data$uc_complications___2.factor)=c("Unchecked","Checked")
levels(data$uc_complications___3.factor)=c("Unchecked","Checked")
levels(data$uc_complications___0.factor)=c("Unchecked","Checked")
levels(data$uc_complications___4.factor)=c("Unchecked","Checked")
levels(data$uc_extent___1.factor)=c("Unchecked","Checked")
levels(data$uc_extent___2.factor)=c("Unchecked","Checked")
levels(data$uc_extent___3.factor)=c("Unchecked","Checked")
levels(data$uc_extent___4.factor)=c("Unchecked","Checked")
levels(data$uc_surgery.factor)=c("yes","no","not sure")
levels(data$uc_hospital.factor)=c("yes","no","not sure")
levels(data$uc_meds_current___1.factor)=c("Unchecked","Checked")
levels(data$uc_meds_current___2.factor)=c("Unchecked","Checked")
levels(data$uc_meds_current___3.factor)=c("Unchecked","Checked")
levels(data$uc_meds_current___4.factor)=c("Unchecked","Checked")
levels(data$uc_meds_current___5.factor)=c("Unchecked","Checked")
levels(data$uc_meds_current___6.factor)=c("Unchecked","Checked")
levels(data$uc_meds_current___7.factor)=c("Unchecked","Checked")
levels(data$uc_meds_current___8.factor)=c("Unchecked","Checked")
levels(data$uc_meds_current___9.factor)=c("Unchecked","Checked")
levels(data$uc_meds_current___10.factor)=c("Unchecked","Checked")
levels(data$uc_meds_current___11.factor)=c("Unchecked","Checked")
levels(data$uc_meds_current___12.factor)=c("Unchecked","Checked")
levels(data$uc_meds_current___13.factor)=c("Unchecked","Checked")
levels(data$uc_meds_current___14.factor)=c("Unchecked","Checked")
levels(data$uc_meds_current___15.factor)=c("Unchecked","Checked")
levels(data$uc_meds_current___16.factor)=c("Unchecked","Checked")
levels(data$uc_meds_current___0.factor)=c("Unchecked","Checked")
levels(data$uc_meds_current___17.factor)=c("Unchecked","Checked")
levels(data$uc_meds_prior___1.factor)=c("Unchecked","Checked")
levels(data$uc_meds_prior___2.factor)=c("Unchecked","Checked")
levels(data$uc_meds_prior___3.factor)=c("Unchecked","Checked")
levels(data$uc_meds_prior___4.factor)=c("Unchecked","Checked")
levels(data$uc_meds_prior___5.factor)=c("Unchecked","Checked")
levels(data$uc_meds_prior___6.factor)=c("Unchecked","Checked")
levels(data$uc_meds_prior___7.factor)=c("Unchecked","Checked")
levels(data$uc_meds_prior___8.factor)=c("Unchecked","Checked")
levels(data$uc_meds_prior___9.factor)=c("Unchecked","Checked")
levels(data$uc_meds_prior___10.factor)=c("Unchecked","Checked")
levels(data$uc_meds_prior___11.factor)=c("Unchecked","Checked")
levels(data$uc_meds_prior___12.factor)=c("Unchecked","Checked")
levels(data$uc_meds_prior___13.factor)=c("Unchecked","Checked")
levels(data$uc_meds_prior___14.factor)=c("Unchecked","Checked")
levels(data$uc_meds_prior___15.factor)=c("Unchecked","Checked")
levels(data$uc_meds_prior___16.factor)=c("Unchecked","Checked")
levels(data$uc_meds_prior___0.factor)=c("Unchecked","Checked")
levels(data$uc_meds_prior___17.factor)=c("Unchecked","Checked")
levels(data$uc_prednisone.factor)=c("yes","no")
levels(data$ucheart_liver_brain___1.factor)=c("Unchecked","Checked")
levels(data$ucheart_liver_brain___2.factor)=c("Unchecked","Checked")
levels(data$ucheart_liver_brain___3.factor)=c("Unchecked","Checked")
levels(data$ucheart_liver_brain___4.factor)=c("Unchecked","Checked")
levels(data$ucheart_liver_brain___5.factor)=c("Unchecked","Checked")
levels(data$ucheart_liver_brain___6.factor)=c("Unchecked","Checked")
levels(data$ucheart_liver_brain___7.factor)=c("Unchecked","Checked")
levels(data$ucheart_liver_brain___8.factor)=c("Unchecked","Checked")
levels(data$ucheart_liver_brain___9.factor)=c("Unchecked","Checked")
levels(data$ucheart_liver_brain___10.factor)=c("Unchecked","Checked")
levels(data$ucheart_liver_brain___11.factor)=c("Unchecked","Checked")
levels(data$ucheart_liver_brain___12.factor)=c("Unchecked","Checked")
levels(data$ucheart_liver_brain___13.factor)=c("Unchecked","Checked")
levels(data$ucheart_liver_brain___14.factor)=c("Unchecked","Checked")
levels(data$ucheart_liver_brain___0.factor)=c("Unchecked","Checked")
levels(data$ucheart_liver_brain___15.factor)=c("Unchecked","Checked")
levels(data$uc_pulmonary___1.factor)=c("Unchecked","Checked")
levels(data$uc_pulmonary___2.factor)=c("Unchecked","Checked")
levels(data$uc_pulmonary___3.factor)=c("Unchecked","Checked")
levels(data$uc_pulmonary___4.factor)=c("Unchecked","Checked")
levels(data$uc_pulmonary___0.factor)=c("Unchecked","Checked")
levels(data$uc_pulmonary___5.factor)=c("Unchecked","Checked")
levels(data$uc_digestive_skin___1.factor)=c("Unchecked","Checked")
levels(data$uc_digestive_skin___2.factor)=c("Unchecked","Checked")
levels(data$uc_digestive_skin___3.factor)=c("Unchecked","Checked")
levels(data$uc_digestive_skin___4.factor)=c("Unchecked","Checked")
levels(data$uc_digestive_skin___5.factor)=c("Unchecked","Checked")
levels(data$uc_digestive_skin___6.factor)=c("Unchecked","Checked")
levels(data$uc_digestive_skin___7.factor)=c("Unchecked","Checked")
levels(data$uc_digestive_skin___8.factor)=c("Unchecked","Checked")
levels(data$uc_digestive_skin___9.factor)=c("Unchecked","Checked")
levels(data$uc_digestive_skin___10.factor)=c("Unchecked","Checked")
levels(data$uc_digestive_skin___11.factor)=c("Unchecked","Checked")
levels(data$uc_digestive_skin___0.factor)=c("Unchecked","Checked")
levels(data$uc_digestive_skin___12.factor)=c("Unchecked","Checked")
levels(data$uc_cancer.factor)=c("yes","no","not sure or prefer not to answer")
levels(data$uc_cancer_tx.factor)=c("yes","no","not sure")
levels(data$uc_facit_q1.factor)=c("Not at all","A little bit","Somewhat","Quite a bit","Very much")
levels(data$uc_facit_q2.factor)=c("Not at all","A little bit","Somewhat","Quite a bit","Very much")
levels(data$uc_facit_q3.factor)=c("Not at all","A little bit","Somewhat","Quite a bit","Very much")
levels(data$uc_facit_q4.factor)=c("Not at all","A little bit","Somewhat","Quite a bit","Very much")
levels(data$uc_facit_q5.factor)=c("Not at all","A little bit","Somewhat","Quite a bit","Very much")
levels(data$uc_facit_q6.factor)=c("Not at all","A little bit","Somewhat","Quite a bit","Very much")
levels(data$uc_facit_q7.factor)=c("Not at all","A little bit","Somewhat","Quite a bit","Very much")
levels(data$uc_facit_q8.factor)=c("Not at all","A little bit","Somewhat","Quite a bit","Very much")
levels(data$uc_facit_q9.factor)=c("Not at all","A little bit","Somewhat","Quite a bit","Very much")
levels(data$uc_facit_q10.factor)=c("Not at all","A little bit","Somewhat","Quite a bit","Very much")
levels(data$uc_facit_q11.factor)=c("Not at all","A little bit","Somewhat","Quite a bit","Very much")
levels(data$uc_facit_q12.factor)=c("Not at all","A little bit","Somewhat","Quite a bit","Very much")
levels(data$uc_facit_q13.factor)=c("Not at all","A little bit","Somewhat","Quite a bit","Very much")
levels(data$uc_pro1.factor)=c("0 bowel movements","1-2 bowel movements","3-4 bowel movements","5-6 bowel movements","7-9, bowel movements","10-12 bowel movements","13-17 bowel movements","18 or more bowel movements")
levels(data$uc_pro2.factor)=c("Never","Rarely","Sometimes","Often","Always")
levels(data$uc_pro3.factor)=c("Yes","No")
levels(data$uc_pro4.factor)=c("Rarely","Sometimes","Often","Always")
levels(data$uc_pro5.factor)=c("Yes","No")
levels(data$uc_pro6.factor)=c("Rarely","Sometimes","Often","Always")
levels(data$uc_pro7.factor)=c("Yes","No")
levels(data$uc_pro8.factor)=c("Rarely","Sometimes","Often","Always")
levels(data$uc_pro9.factor)=c("Yes","No")
levels(data$uc_pro10.factor)=c("Rarely","Sometimes","Often","Always")
levels(data$uc_pro11.factor)=c("Yes","No")
levels(data$uc_pro12.factor)=c("Mild","Moderate","Severe","Very severe")
levels(data$uc_pro13.factor)=c("Yes","No")
levels(data$uc_pro14.factor)=c("Mild","Moderate","Severe","Very severe")
levels(data$uc_pro15.factor)=c("Yes","No")
levels(data$uc_pro16.factor)=c("Mild","Moderate","Severe","Very severe")
levels(data$uc_pro17.factor)=c("Yes","No")
levels(data$uc_pro18.factor)=c("Mild","Moderate","Severe","Very severe")
levels(data$uc_pro19.factor)=c("Yes","No")
levels(data$uc_pro20.factor)=c("Mild","Moderate","Severe","Very severe")
levels(data$uc_pro21.factor)=c("Yes","No")
levels(data$uc_pro22.factor)=c("Mild","Moderate","Severe","Very severe")
levels(data$uc_pro23.factor)=c("Yes","No")
levels(data$uc_pro24.factor)=c("Mild","Moderate","Severe","Very severe")
levels(data$uc_pro25.factor)=c("Yes","No")
levels(data$uc_pro26.factor)=c("Mild","Moderate","Severe","Very severe")
levels(data$uc_pro27.factor)=c("Yes","No")
levels(data$uc_pro28.factor)=c("Yes","No")
levels(data$uc_pro29.factor)=c("Yes","No")
levels(data$uc_pro30.factor)=c("Yes","No")
levels(data$uc_pro31.factor)=c("Yes","No")
levels(data$uc_pro32.factor)=c("Yes","No")
levels(data$uc_pro33.factor)=c("Yes","No")
levels(data$uc_pro34.factor)=c("Yes","No")
levels(data$uc_pro35.factor)=c("Not at all","A little bit","Somewhat","Quite a bit","A great deal")
levels(data$uc_pro36.factor)=c("Not at all","A little bit","Somewhat","Quite a bit","A great deal")
levels(data$uc_pro37.factor)=c("Not at all","A little bit","Somewhat","Quite a bit","A great deal")
levels(data$uc_pro38.factor)=c("Not at all","A little bit","Somewhat","Quite a bit","A great deal")
levels(data$uc_pro39.factor)=c("Not at all","A little bit","Somewhat","Quite a bit","A great deal")
levels(data$uc_pro40.factor)=c("Not at all","A little bit","Somewhat","Quite a bit","A great deal")
levels(data$uc_pro41.factor)=c("Not at all","A little bit","Somewhat","Quite a bit","A great deal")
levels(data$uc_pro42.factor)=c("Not at all","A little bit","Somewhat","Quite a bit","A great deal")
levels(data$uc_pro43.factor)=c("Not at all","A little bit","Somewhat","Quite a bit","A great deal")
levels(data$uc_pro44.factor)=c("Never","Rarely","Sometimes","Often","Always")
levels(data$uc_pro45.factor)=c("Never","Rarely","Sometimes","Often","Always")
levels(data$uc_pro46.factor)=c("Never","Rarely","Sometimes","Often","Always")
levels(data$uc_pro47.factor)=c("Never","Rarely","Sometimes","Often","Always")
levels(data$uc_pro48.factor)=c("Never","Rarely","Sometimes","Often","Always")
levels(data$uc_pro49.factor)=c("Never","Rarely","Sometimes","Often","Always")
levels(data$uc_pro50.factor)=c("Never","Rarely","Sometimes","Often","Always")
levels(data$uc_pro51.factor)=c("Never","Rarely","Sometimes","Often","Always")
levels(data$uc_ibdf_1.factor)=c("No fatigue","Some fatigue","Mild fatigue","Moderate fatigue","Severe fatigue")
levels(data$uc_ibdf_2.factor)=c("No fatigue","Some fatigue","Mild fatigue","Moderate fatigue","Severe fatigue")
levels(data$uc_ibdf_3.factor)=c("No fatigue","Some fatigue","Mild fatigue","Moderate fatigue","Severe fatigue")
levels(data$uc_ibdf_4.factor)=c("No fatigue","Some fatigue","Mild fatigue","Moderate fatigue","Severe fatigue")
levels(data$uc_ibdf_5.factor)=c("None of the time","Some of the time","Often","Most of the time","All the time")
levels(data$uc_stop_bang1.factor)=c("Yes","No","I dont know")
levels(data$uc_stop_bang2.factor)=c("Yes","No")
levels(data$uc_stop_bang3.factor)=c("Yes","No","I dont know")
levels(data$uc_stop_bang4.factor)=c("Yes","No","I dont know")
levels(data$uc_stop_bang5.factor)=c("Yes","No","I dont know")
levels(data$uc_stop_bang6.factor)=c("Yes","No")
levels(data$uc_stop_bang7.factor)=c("Yes","No","I dont know")
levels(data$uc_stop_bang8.factor)=c("Yes","No","NA or other")
levels(data$ulcerative_colitis_fatigue_assessment_complete.factor)=c("Incomplete","Unverified","Complete")

# Recoding stopbang score -----------------------------------------------------
data <- data |> 
  naniar::replace_with_na(list(
    uc_stop_bang1 = c(2),
    uc_stop_bang3 = c(2),
    uc_stop_bang4 = c(2),
    uc_stop_bang5 = c(2),
    uc_stop_bang7 = c(2),
    uc_stop_bang8 = c(2)
  )) 

data <- data |> 
  rowwise() |>
  mutate(
    uc_stop_bang_score = sum(uc_stop_bang1, uc_stop_bang2, uc_stop_bang3, uc_stop_bang4, 
   uc_stop_bang5, uc_stop_bang6, 
   uc_stop_bang7, uc_stop_bang8, na.rm = TRUE)) |> 
  ungroup()
                         
data |> 
  tabyl(uc_stop_bang_score, uc_pulmonary___4.factor) |> 
  adorn_totals("both")


# sensitivity analysis, what if NA (dont know) are 1s? -----

data_sens <- data |>
  mutate(across(starts_with("uc_stop_bang"), as.numeric)) |> 
  replace_na(list(uc_stop_bang1 = 1,
                  uc_stop_bang2 = 1,
                  uc_stop_bang3 = 1,
                  uc_stop_bang4 = 1,
                  uc_stop_bang5 = 1,
                  uc_stop_bang6 = 1,
                  uc_stop_bang7 = 1,
                  uc_stop_bang8 = 1))

data_sens <- data_sens |> 
  rowwise() |> 
  mutate(
    uc_stop_bang_score = sum(uc_stop_bang1, uc_stop_bang2,
                             uc_stop_bang3, uc_stop_bang4, 
                             uc_stop_bang5, uc_stop_bang6, 
                             uc_stop_bang7, uc_stop_bang8, 
                             na.rm = TRUE)) |> 
  ungroup()

data_sens |>
  tabyl(uc_stop_bang_score, uc_pulmonary___4.factor) |> 
  adorn_totals("both") 

 

