library(plyr)


# original data: all
df <- read.csv('star_xy_all.csv')

# data with ratings as factors
s <- df

##### need to convert to factors for dodged bars!!!***
#GEN HOSPITAL RATINGS
s$Hosp.overall.CAT.avg.x <- as.factor(s$Hosp.overall.CAT.avg.x)
s$Mortality.natcomp.CAT.avg.x <- as.factor(s$Mortality.natcomp.CAT.avg.x)
s$Safety.of.care.natcomp.CAT.avg.x <- as.factor(s$Safety.of.care.natcomp.CAT.avg.x)
s$ReAd.natcomp.CAT.avg.x <- as.factor(s$ReAd.natcomp.CAT.avg.x)
s$Pt.exp.natcomp.CAT.avg.x <- as.factor(s$Pt.exp.natcomp.CAT.avg.x)
s$Effectiveness.of.care.natcomp.CAT.avg.x <- as.factor(s$Effectiveness.of.care.natcomp.CAT.avg.x)
s$Timeliness.of.care.natcomp.CAT.avg.x <- as.factor(s$Timeliness.of.care.natcomp.CAT.avg.x)
s$Efficient.use.med.imaging.natcomp.CAT.avg.x <- as.factor(s$Efficient.use.med.imaging.natcomp.CAT.avg.x)

#HCAHPS STAR RATINGS
s$SR.clean <- as.factor(s$SR.clean)
s$SR.drcomm <- as.factor(s$SR.drcomm)
s$SR.dxinfo <- as.factor(s$SR.dxinfo)
s$SR.medcomm <- as.factor(s$SR.medcomm)
s$SR.nursecomm <- as.factor(s$SR.nursecomm)
s$SR.overall <- as.factor(s$SR.overall)
s$SR.painm <- as.factor(s$SR.painm)
s$SR.quiet <- as.factor(s$SR.quiet)
s$SR.rec <- as.factor(s$SR.rec)
s$SR.staffresp <- as.factor(s$SR.staffresp)
s$SR.summary <- as.factor(s$SR.summary)
s$SR.trans <- as.factor(s$SR.trans)

#COMPLICATIONS RATINGS
s$X.Compared.x.CAT.ACC.LAC <- as.factor(s$X.Compared.x.CAT.ACC.LAC)
s$X.Compared.x.CAT.CVCBI7 <- as.factor(s$X.Compared.x.CAT.CVCBI7)
s$X.Compared.x.CAT.hip_knee9 <- as.factor(s$X.Compared.x.CAT.hip_knee9)
s$X.Compared.x.CAT.dehis1 <- as.factor(s$X.Compared.x.CAT.dehis1)
s$X.Compared.x.CAT.hip4 <- as.factor(s$X.Compared.x.CAT.hip4)
s$X.Compared.x.CAT.PE_DVT10 <- as.factor(s$X.Compared.x.CAT.PE_DVT10)
s$X.Compared.x.CAT.sepsis3 <- as.factor(s$X.Compared.x.CAT.sepsis3)
s$X.Compared.x.CAT.PTX5 <- as.factor(s$X.Compared.x.CAT.PTX5)
s$X.Compared.x.CAT.safety11 <- as.factor(s$X.Compared.x.CAT.safety11)
s$X.Compared.x.CAT.surg_comp6 <- as.factor(s$X.Compared.x.CAT.surg_comp6)
s$X.Compared.x.CAT.ulcer8 <- as.factor(s$X.Compared.x.CAT.ulcer8)

#ReAD/MORT RATINGS
s$X.Compared.x.CAT.MORT30_AMI1 <- as.factor(s$X.Compared.x.CAT.MORT30_AMI1)
s$X.Compared.x.CAT.MORT30_CABG3 <- as.factor(s$X.Compared.x.CAT.MORT30_CABG3)
s$X.Compared.x.CAT.MORT30_COPD4 <- as.factor(s$X.Compared.x.CAT.MORT30_COPD4)
s$X.Compared.x.CAT.MORT30_HF6 <- as.factor(s$X.Compared.x.CAT.MORT30_HF6)
s$X.Compared.x.CAT.MORT30_PN8 <- as.factor(s$X.Compared.x.CAT.MORT30_PN8)
s$X.Compared.x.CAT.MORT30_STK5 <- as.factor(s$X.Compared.x.CAT.MORT30_STK5)
s$X.Compared.x.CAT.READM30_AMI2 <- as.factor(s$X.Compared.x.CAT.READM30_AMI2)
s$X.Compared.x.CAT.READM30_CABG12 <- as.factor(s$X.Compared.x.CAT.READM30_CABG12)
s$X.Compared.x.CAT.READM30_COPD13 <- as.factor(s$X.Compared.x.CAT.READM30_COPD13)
s$X.Compared.x.CAT.READM30_HF7 <- as.factor(s$X.Compared.x.CAT.READM30_HF7)
s$X.Compared.x.CAT.READM30_HIPKNEE11 <- as.factor(s$X.Compared.x.CAT.READM30_HIPKNEE11)
s$X.Compared.x.CAT.READM30_HOSPW10 <- as.factor(s$X.Compared.x.CAT.READM30_HOSPW10)
s$X.Compared.x.CAT.READM30_PN9 <- as.factor(s$X.Compared.x.CAT.READM30_PN9)
s$X.Compared.x.CAT.READM30_STK14 <- as.factor(s$X.Compared.x.CAT.READM30_STK14)


# GENERAL INFO/NATIONAL COMPARISON ratings list (for compl)***
GEN.list <- list('Overall Hospital Ratings' = 'Hosp.overall.CAT.avg.x',
                 'Mortality' = 'Mortality.natcomp.CAT.avg.x',
                 'Safety of Care' = 'Safety.of.care.natcomp.CAT.avg.x',
                 'Readmissions' = 'ReAd.natcomp.CAT.avg.x',
                 'Patient Experience' = 'Pt.exp.natcomp.CAT.avg.x',
                 'Effectiveness of Care' = 'Effectiveness.of.care.natcomp.CAT.avg.x',
                 'Timeliness of Care' = 'Timeliness.of.care.natcomp.CAT.avg.x',
                 'Efficient use of medical imaging' = 'Efficient.use.med.imaging.natcomp.CAT.avg.x')
# (for textOutput)***
GEN.list.t <- list('Hosp.overall.CAT.avg.x' = 'Overall Hospital Ratings',
                  'Mortality.natcomp.CAT.avg.x' = 'Mortality',
                  'Safety.of.care.natcomp.CAT.avg.x' = 'Safety of Care',
                  'ReAd.natcomp.CAT.avg.x' = 'Readmissions',
                  'Pt.exp.natcomp.CAT.avg.x' = 'Patient Experience',
                  'Effectiveness.of.care.natcomp.CAT.avg.x' = 'Effectiveness of Care',
                  'Timeliness.of.care.natcomp.CAT.avg.x'= 'Timeliness of Care',
                  'Efficient.use.med.imaging.natcomp.CAT.avg.x' = 'Efficient use of medical imaging')


# COMPLICATIONS ratings list
COMPL.list <- list('POSTOP WOUND SPLIT' = 'X.Compared.x.CAT.dehis1',
                   'TREATMENT CUTS & TEARS' = 'X.Compared.x.CAT.ACC.LAC',
                   'POSTOP BLOOD STREAM INFECTION' = 'X.Compared.x.CAT.sepsis3',
                   'POSTOP FALL/BROKEN HIP' = 'X.Compared.x.CAT.hip4',
                   'COLLAPSED LUNG FROM TREATMENT' = 'X.Compared.x.CAT.PTX5',
                   'POSTOP SURGICAL COMPLICATIONS' = 'X.Compared.x.CAT.surg_comp6',
                   'VENOUS CATHETER INFECTIONS' = 'X.Compared.x.CAT.CVCBI7',
                   'PRESSURE ULCERS' = 'X.Compared.x.CAT.ulcer8',
                   'HIP/KNEE REPLACEMENT COMPLICATIONS' = 'X.Compared.x.CAT.hip_knee9',
                   'SERIOUS POSTOP BLOOD CLOTS' = 'X.Compared.x.CAT.PE_DVT10',
                   'OTHER SERIOUS COMPLICATIONS/SAFETY' = 'X.Compared.x.CAT.safety11')
# (for textOutput)***
COMPL.list.t <- list('X.Compared.x.CAT.dehis1' = 'POSTOP WOUND SPLIT',
                     'X.Compared.x.CAT.ACC.LAC' = 'TREATMENT CUTS & TEARS',
                     'X.Compared.x.CAT.sepsis3' = 'POSTOP BLOOD STREAM INFECTION',
                     'X.Compared.x.CAT.hip4' = 'POSTOP FALL/BROKEN HIP',
                     'X.Compared.x.CAT.PTX5' = 'COLLAPSED LUNG FROM TREATMENT',
                     'X.Compared.x.CAT.surg_comp6' = 'POSTOP SURGICAL COMPLICATIONS',
                     'X.Compared.x.CAT.CVCBI7' = 'VENOUS CATHETER INFECTIONS',
                     'X.Compared.x.CAT.ulcer8' = 'PRESSURE ULCERS',
                     'X.Compared.x.CAT.hip_knee9' = 'HIP/KNEE REPLACEMENT COMPLICATIONS',
                     'X.Compared.x.CAT.PE_DVT10' = 'SERIOUS POSTOP BLOOD CLOTS',
                     'X.Compared.x.CAT.safety11' = 'OTHER SERIOUS COMPLICATIONS/SAFETY')










# READMISSIONS/DEATHS ratings list
RD.list <- list('HEART ATTACK READMISSIONS' = 'X.Compared.x.CAT.READM30_AMI2',
                'CORONARY ARTERY BYPASS GRAFT SURGERY READMISSIONS' = 'X.Compared.x.CAT.READM30_CABG12',
                'CHRONIC OBSTRUCTIVE PULMONARY DISEASE READMISSIONS' = 'X.Compared.x.CAT.READM30_COPD13',
                'HEART FAILURE READMISSIONS' = 'X.Compared.x.CAT.READM30_HF7',
                'HIP/KNEE REPLACEMENT READMISSIONS' = 'X.Compared.x.CAT.READM30_HIPKNEE11',
                'PNEUMONIA READMISSIONS' = 'X.Compared.x.CAT.READM30_PN9',
                'STROKE READMISSIONS' = 'X.Compared.x.CAT.READM30_STK14',
                'HOSPITAL-WIDE READMISSIONS' = 'X.Compared.x.CAT.READM30_HOSPW10',
                'HEART ATTACK DEATH RATES' = 'X.Compared.x.CAT.MORT30_AMI1',
                'CORONARY ARTERY BYPASS GRAFT SURGERY DEATH RATES' = 'X.Compared.x.CAT.MORT30_CABG3',
                'CHRONIC OBSTRUCTIVE PULMONARY DISEASE DEATH RATES' = 'X.Compared.x.CAT.MORT30_COPD4',
                'HEART FAILURE DEATH RATES' = 'X.Compared.x.CAT.MORT30_HF6',
                'PNEUMONIA DEATH RATES' = 'X.Compared.x.CAT.MORT30_PN8',
                'STROKE DEATH RATES' = 'X.Compared.x.CAT.MORT30_STK5')
# (for textOutput)***
RD.list.t <- list('X.Compared.x.CAT.READM30_AMI2' = 'HEART ATTACK READMISSIONS',
                  'X.Compared.x.CAT.READM30_CABG12' = 'CORONARY ARTERY BYPASS GRAFT SURGERY READMISSIONS',
                  'X.Compared.x.CAT.READM30_COPD13' = 'CHRONIC OBSTRUCTIVE PULMONARY DISEASE READMISSIONS',
                  'X.Compared.x.CAT.READM30_HF7' = 'HEART FAILURE READMISSIONS',
                  'X.Compared.x.CAT.READM30_HIPKNEE11' = 'HIP/KNEE REPLACEMENT READMISSIONS',
                  'X.Compared.x.CAT.READM30_PN9' = 'PNEUMONIA READMISSIONS',
                  'X.Compared.x.CAT.READM30_STK14' = 'STROKE READMISSIONS',
                  'X.Compared.x.CAT.READM30_HOSPW10' = 'HOSPITAL-WIDE READMISSIONS',
                  'X.Compared.x.CAT.MORT30_AMI1' = 'HEART ATTACK DEATH RATES',
                  'X.Compared.x.CAT.MORT30_CABG3' = 'CORONARY ARTERY BYPASS GRAFT SURGERY DEATH RATES',
                  'X.Compared.x.CAT.MORT30_COPD4' = 'CHRONIC OBSTRUCTIVE PULMONARY DISEASE DEATH RATES',
                  'X.Compared.x.CAT.MORT30_HF6' = 'HEART FAILURE DEATH RATES',
                  'X.Compared.x.CAT.MORT30_PN8' = 'PNEUMONIA DEATH RATES',
                  'X.Compared.x.CAT.MORT30_STK5' = 'STROKE DEATH RATES')




# GENERAL INFO/NATIONAL COMPARISON ratings list (for RD)***
GEN2.list <- list('Overall Hospital Ratings' = 'Hosp.overall.CAT.avg.x',
                 'Mortality' = 'Mortality.natcomp.CAT.avg.x',
                 'Safety of Care' = 'Safety.of.care.natcomp.CAT.avg.x',
                 'Readmissions' = 'ReAd.natcomp.CAT.avg.x',
                 'Patient Experience' = 'Pt.exp.natcomp.CAT.avg.x',
                 'Effectiveness of Care' = 'Effectiveness.of.care.natcomp.CAT.avg.x',
                 'Timeliness of Care' = 'Timeliness.of.care.natcomp.CAT.avg.x',
                 'Efficient use of medical imaging' = 'Efficient.use.med.imaging.natcomp.CAT.avg.x')
# (for textOutput)***
GEN2.list.t <- list('Hosp.overall.CAT.avg.x' = 'Overall Hospital Ratings',
                    'Mortality.natcomp.CAT.avg.x' = 'Mortality',
                    'Safety.of.care.natcomp.CAT.avg.x' = 'Safety of Care',
                    'ReAd.natcomp.CAT.avg.x' = 'Readmissions',
                    'Pt.exp.natcomp.CAT.avg.x' = 'Patient Experience',
                    'Effectiveness.of.care.natcomp.CAT.avg.x' = 'Effectiveness of Care',
                    'Timeliness.of.care.natcomp.CAT.avg.x' = 'Timeliness of Care',
                    'Efficient.use.med.imaging.natcomp.CAT.avg.x' = 'Efficient use of medical imaging')









# HCAHPS STAR RATING list
SR.list <- list('CLEANLINESS' = 'SR.clean',
                'NURSE COMMUNICATION' = 'SR.nursecomm',
                'DOCTOR COMMUNICATION' = 'SR.drcomm',
                'STAFF RESPONSIVENESS' = 'SR.staffresp',
                'PAIN MANAGEMENT' = 'SR.painm',
                'COMMUNICATION ABOUT MEDICATION' = 'SR.medcomm',
                'DISCHARGE INFORMATION' = 'SR.dxinfo',
                'CARE TRANSITION' = 'SR.trans',
                'QUIETNESS' = 'SR.quiet',
                'WOULD RECOMMEND HOSPITAL?' = 'SR.rec',
                'SUMMARY STAR RATING' = 'SR.summary')
# (for textOutput)***
SR.list.t <- list('SR.clean' = 'CLEANLINESS',
                  'SR.nursecomm' = 'NURSE COMMUNICATION',
                  'SR.drcomm' = 'DOCTOR COMMUNICATION',
                  'SR.staffresp' = 'STAFF RESPONSIVENESS',
                  'SR.painm' = 'PAIN MANAGEMENT',
                  'SR.medcomm' = 'COMMUNICATION ABOUT MEDICATION',
                  'SR.dxinfo' = 'DISCHARGE INFORMATION',
                  'SR.trans' = 'CARE TRANSITION',
                  'SR.quiet' = 'QUIETNESS',
                  'SR.rec' = 'WOULD RECOMMEND HOSPITAL?',
                  'SR.summary' = 'SUMMARY STAR RATING')




# GENERAL INFO/NATIONAL COMPARISON ratings list (for SR)***
GEN3.list <- list('Overall Hospital Ratings' = 'Hosp.overall.CAT.avg.x',
                  'Mortality' = 'Mortality.natcomp.CAT.avg.x',
                  'Safety of Care' = 'Safety.of.care.natcomp.CAT.avg.x',
                  'Readmissions' = 'ReAd.natcomp.CAT.avg.x',
                  'Patient Experience' = 'Pt.exp.natcomp.CAT.avg.x',
                  'Effectiveness of Care' = 'Effectiveness.of.care.natcomp.CAT.avg.x',
                  'Timeliness of Care' = 'Timeliness.of.care.natcomp.CAT.avg.x',
                  'Efficient use of medical imaging' = 'Efficient.use.med.imaging.natcomp.CAT.avg.x')
# (for textOutput)***
GEN3.list.t <- list('Hosp.overall.CAT.avg.x' = 'Overall Hospital Ratings',
                    'Mortality.natcomp.CAT.avg.x' = 'Mortality',
                    'Safety.of.care.natcomp.CAT.avg.x' = 'Safety of Care',
                    'ReAd.natcomp.CAT.avg.x' = 'Readmissions',
                    'Pt.exp.natcomp.CAT.avg.x' = 'Patient Experience',
                    'Effectiveness.of.care.natcomp.CAT.avg.x' = 'Effectiveness of Care',
                    'Timeliness.of.care.natcomp.CAT.avg.x' = 'Timeliness of Care',
                    'Efficient.use.med.imaging.natcomp.CAT.avg.x' = 'Efficient use of medical imaging')


















