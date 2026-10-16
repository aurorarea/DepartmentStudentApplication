Classlist.destroy_all if defined?(Classlist)
Student.destroy_all
Section.destroy_all
Subject.destroy_all
Teacher.destroy_all
Department.destroy_all

print "seeding data"

ECE_CPE = Department.find_or_create_by!(name: "ECE & CPE Department") do |d|
  d.location = "Engineering Department"
end
ComSci = Department.find_or_create_by!(name: "Computer Science Department") do |d|
  d.location = "Phelan Building"
end

# LIST OF TEACHERS

# 1T
t1 = Teacher.find_or_create_by!(name: "Karla Sobrevilla") do |t|
  t.specialization = "Embedded Systems and IOT"
  t.email = "ksobrevilla@adnu.com"
  t.department = ECE_CPE
  t.perUnitRate = 2500
end

# 2T
t2 = Teacher.find_or_create_by!(name: "Robert Downey") do |t|
  t.specialization = "AI/ML"
  t.email = "rdowney@adnu.com"
  t.department = ECE_CPE
  t.perUnitRate = 2500
end

# 2T
t3 = Teacher.find_or_create_by!(name: "Mwaynia Brass") do |t|
  t.specialization = "Microcontrollers"
  t.email = "mbrass@adnu.com"
  t.department = ECE_CPE
  t.perUnitRate = 2500
end

# 2T
t4 = Teacher.find_or_create_by!(name: "Khaki Difes") do |t|
  t.specialization = "Networks and Communications"
  t.email = "rdowney@adnu.com"
  t.department = ComSci
  t.perUnitRate = 2500
end

# 5T
t5 = Teacher.find_or_create_by!(name: "Thaya Mihathi") do |t|
  t.specialization = "CyberSecurity and Ethical Hacking"
  t.email = "tmihathi@adnu.com"
  t.department = ComSci
  t.perUnitRate = 2000
end

# 6T
t6 = Teacher.find_or_create_by!(name: "Delle Cris") do |t|
  t.specialization = "Software Development"
  t.email = "dcris@adnu.com"
  t.department = ComSci
  t.perUnitRate = 2000
end

# 7T
t7 = Teacher.find_or_create_by!(name: "Fiona Villara") do |t|
  t.specialization = "Application Development"
  t.email = "fvillara@adnu.com"
  t.department = ComSci
  t.perUnitRate = 3000
end

# 8T
t8 = Teacher.find_or_create_by!(name: "Vin Mercado") do |t|
  t.specialization = "Control Systems"
  t.email = "vmercado@adnu.ph"
  t.department = ECE_CPE
  t.perUnitRate = 2700
end

# LIST OF SUBJECTS

# 1S
s1 = Subject.find_or_create_by!(name: "Database Management") do |s|
  s.teacher = t2
end

# 2S
s2 = Subject.find_or_create_by!(name: "Fundamentals of Software Engineering") do |s|
  s.teacher = t6
end

# 3S
s3 = Subject.find_or_create_by!(name: "Application Development") do |s|
  s.teacher = t7
end

# 4S
s4 = Subject.find_or_create_by!(name: "Cybersecurity Basics and Framework") do |s|
  s.teacher = t8
end

# LIST OF SECTIONS

# sc1
sc1 = Section.find_or_create_by!(name: "DB-1") do |sc|
  sc.room = "Dolan 317"
  sc.timeslot = "TTH 1:30-4:30PM"
  sc.subject = s1
end

# sc2
sc2 = Section.find_or_create_by!(name: "DB-2") do |sc|
  sc.room = "Dolan 417"
  sc.timeslot = "MW 7:30 - 9:00AM"
  sc.subject = s1
end

# sc3
sc3 = Section.find_or_create_by!(name: "SE-1") do |sc|
  sc.room = "Dolan 315"
  sc.timeslot = "MW 1:30 - 4:30PM"
  sc.subject = s2
end

# sc4
sc4 = Section.find_or_create_by!(name: "SE-2") do |sc|
  sc.room = "COMMLAB"
  sc.timeslot = "TTH 10:30 - 12:00PM"
  sc.subject = s2
end

# sc5
sc5 = Section.find_or_create_by!(name: "AD-1") do |sc|
  sc.room = "COMMLAB"
  sc.timeslot = "FRI 7:30 - 10:30AM"
  sc.subject = s3
end

# sc6
sc6 = Section.find_or_create_by!(name: "AD-2") do |sc|
  sc.room = "PH 312"
  sc.timeslot = "FRI 10:30AM - 12:00PM"
  sc.subject = s3
end

# sc7
sc7 = Section.find_or_create_by!(name: "CB-1") do |sc|
  sc.room = "PH 315"
  sc.timeslot = "FRI 1:30 - 4:30 PM"
  sc.subject = s4
end

# sc8
sc8 = Section.find_or_create_by!(name: "CB-2") do |sc|
  sc.room = "MAC LAB"
  sc.timeslot = "MW 5:30 - 7:00PM"
  sc.subject = s4
end

# st 1
st1 = Student.find_or_create_by!(name: "Lhoulle Velgara") do |st|
  st.year_level = 1
  st.program = "CPE"
  st.department = ECE_CPE
end

# st 2
st2 = Student.find_or_create_by!(name: "Juan Dela Cruz") do |st|
  st.year_level = 1
  st.program = "ECE"
  st.department = ECE_CPE
end

# st 3
st3 = Student.find_or_create_by!(name: "Maria Clara Santos") do |st|
  st.year_level = 1
  st.program = "ECE"
  st.department = ECE_CPE
end

# st 4
st4 = Student.find_or_create_by!(name: "Anthony Grey") do |st|
  st.year_level = 1
  st.program = "CPE"
  st.department = ECE_CPE
end

# st 5
st5 = Student.find_or_create_by!(name: "Angelica Ramos") do |st|
  st.year_level = 1
  st.program = "CPE"
  st.department = ECE_CPE
end

# st 6
st6 = Student.find_or_create_by!(name: "Joshua Garry") do |st|
  st.year_level = 1
  st.program = "IT"
  st.department = ComSci
end

# st 7
st7 = Student.find_or_create_by!(name: "Alexander Wright") do |st|
  st.year_level = 1
  st.program = "IT"
  st.department = ComSci
end

# st 8
st8 = Student.find_or_create_by!(name: "Charlotte Bennett") do |st|
  st.year_level = 1
  st.program = "COM SCI"
  st.department = ComSci
end

# st 9
st9 = Student.find_or_create_by!(name: "Liam Gallagher") do |st|
  st.year_level = 1
  st.program = "IT"
  st.department = ComSci
end

# st 10
st10 = Student.find_or_create_by!(name: "Olivia Smith") do |st|
  st.year_level = 1
  st.program = "IT"
  st.department = ComSci
end

# st 11
st11 = Student.find_or_create_by!(name: "Oliver Taylor") do |st|
  st.year_level = 2
  st.program = "CPE"
  st.department = ECE_CPE
end

# st 12
st12 = Student.find_or_create_by!(name: "Emma Davies") do |st|
  st.year_level = 2
  st.program = "ECE"
  st.department = ECE_CPE
end

# st 13
st13 = Student.find_or_create_by!(name: "Lucas Fischer") do |st|
  st.year_level = 2
  st.program = "ECE"
  st.department = ECE_CPE
end

# st 14
st14 = Student.find_or_create_by!(name: "Sophia Mueller") do |st|
  st.year_level = 2
  st.program = "ECE"
  st.department = ECE_CPE
end

# st 15
st15 = Student.find_or_create_by!(name: "Benjamin Walker") do |st|
  st.year_level = 2
  st.program = "CPE"
  st.department = ECE_CPE
end

# st 16
st16 = Student.find_or_create_by!(name: "Amelia Evans") do |st|
  st.year_level = 2
  st.program = "COM SCI"
  st.department = ComSci
end

# st 17
st17 = Student.find_or_create_by!(name: "Sebastian Weber") do |st|
  st.year_level = 2
  st.program = "IT"
  st.department = ComSci
end

# st 18
st18 = Student.find_or_create_by!(name: "Freja Lindqvist") do |st|
  st.year_level = 2
  st.program = "IT"
  st.department = ComSci
end

# st 19
st19 = Student.find_or_create_by!(name: "Julian Rossi") do |st|
  st.year_level = 2
  st.program = "COM SCI"
  st.department = ComSci
end

# st 20
st20 = Student.find_or_create_by!(name: "Clara Dubois") do |st|
  st.year_level = 2
  st.program = "COM SCI"
  st.department = ComSci
end

# st 21
st21 = Student.find_or_create_by!(name: "Hugo Garcia") do |st|
  st.year_level = 3
  st.program = "IT"
  st.department = ComSci
end

# st 22
st22 = Student.find_or_create_by!(name: "Elena Petrov") do |st|
  st.year_level = 3
  st.program = "IT"
  st.department = ComSci
end

# st 23
st23 = Student.find_or_create_by!(name: "Matteo Bianchi") do |st|
  st.year_level = 3
  st.program = "IT"
  st.department = ComSci
end

# st 24
st24 = Student.find_or_create_by!(name: "Francesca Romano") do |st|
  st.year_level = 3
  st.program = "COM SCI"
  st.department = ComSci
end

# st 23
st25 = Student.find_or_create_by!(name: "Alessandro Conti") do |st|
  st.year_level = 3
  st.program = "COM SCI"
  st.department = ComSci
end

# st 26
st26 = Student.find_or_create_by!(name: "Giulia Marino") do |st|
  st.year_level = 3
  st.program = "ECE"
  st.department = ECE_CPE
end

# st 27
st27 = Student.find_or_create_by!(name: "Leonardo Ricci") do |st|
  st.year_level = 3
  st.program = "CPE"
  st.department = ECE_CPE
end

# st 28
st28 = Student.find_or_create_by!(name: "Chiara Esposito") do |st|
  st.year_level = 3
  st.program = "CPE"
  st.department = ECE_CPE
end

# st 29
st29 = Student.find_or_create_by!(name: "Marco Bruno") do |st|
  st.year_level = 3
  st.program = "ECE"
  st.department = ECE_CPE
end

# st 30
st30 = Student.find_or_create_by!(name: "Sofia Moretti") do |st|
  st.year_level = 3
  st.program = "CPE"
  st.department = ECE_CPE
end

# st 31
st31 = Student.find_or_create_by!(name: "Min-jun Kim") do |st|
  st.year_level = 4
  st.program = "CPE"
  st.department = ECE_CPE
end

# st 32
st32 = Student.find_or_create_by!(name: "Seo-yun Park") do |st|
  st.year_level = 4
  st.program = "IT"
  st.department = ComSci
end

# st 33
st33 = Student.find_or_create_by!(name: "Do-yoon Lee") do |st|
  st.year_level = 4
  st.program = "ECE"
  st.department = ECE_CPE
end

# st 34
st34 = Student.find_or_create_by!(name: "Ji-woo Choi") do |st|
  st.year_level = 4
  st.program = "IT"
  st.department = ComSci
end

# st 35
st35 = Student.find_or_create_by!(name: "Ha-jun Jung") do |st|
  st.year_level = 4
  st.program = "ECE"
  st.department = ECE_CPE
end

# st 36
st36 = Student.find_or_create_by!(name: "So-eun Kang") do |st|
  st.year_level = 4
  st.program = "IT"
  st.department = ComSci
end

# st 37
st37 = Student.find_or_create_by!(name: "Yoon-woo Cho") do |st|
  st.year_level = 4
  st.program = "ECE"
  st.department = ECE_CPE
end

# st 38
st38 = Student.find_or_create_by!(name: "Eun-ji Yoon") do |st|
  st.year_level = 4
  st.program = "COM SCI"
  st.department = ComSci
end

# st 39
st39 = Student.find_or_create_by!(name: "Chen Wei") do |st|
  st.year_level = 4
  st.program = "IT"
  st.department = ComSci
end

# st 40
st40 = Student.find_or_create_by!(name: "Zhang Xiu Ying") do |st|
  st.year_level = 4
  st.program = "ECE"
  st.department = ECE_CPE
end

# Classlist
sections = [ sc1, sc2, sc3, sc4, sc5, sc6, sc7, sc8 ]
students = [
  st1, st2, st3, st4, st5, st6, st7, st8, st9, st10,
  st11, st12, st13, st14, st15, st16, st17, st18, st19, st20,
  st21, st22, st23, st24, st25, st26, st27, st28, st29, st30,
  st31, st32, st33, st34, st35, st36, st37, st38, st39, st40
]

students.each do |student|
  sections.sample(4).each do |section|
    Classlist.find_or_create_by!(student: student, section: section)
  end
end
